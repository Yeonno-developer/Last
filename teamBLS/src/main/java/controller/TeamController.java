package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/*
	Map<String, Integer> teamCode = tCode(); //teamCode() => key : 팀명, value : 팀번호 
	
	List<Integer> tcode = new ArrayList<>();
	for (String s : teamCode.keySet()) {
		tcode.add(teamCode.get(s));
	}
	Map<String, Integer> pCode = pCode(tcode); //pCode(팀 번호) =key : 선수 번호, value : 팀 번호
	
	
	List<String> tName = new ArrayList<>();
	for (String s : pCode.keySet()) {
		tName.add(s);
	}
	Map<String, String> pName = pName(tName); //pName(선수 번호) =>key : 선수 번호, value : 선수 이름
	
*/
@Controller
public class TeamController {
	//메인
	@RequestMapping("team/mainPage")
	public ModelAndView main(HttpSession session) {
		ModelAndView mav = new ModelAndView("team/main");
		Map<String, String> teamCode = tCode();
		Map<String, List> teamrank = MainRank();
		Map<String, List> playerrank = MainPRank();
		// teamCode() => key : 팀명, value : 팀번호 
		session.setAttribute("teamCode", teamCode);
		mav.addObject("Rank",teamrank);
		mav.addObject("PRank",playerrank);
		return mav;
	}


	//팀 순위
	@RequestMapping("team/teamMain")
	public ModelAndView tMain(HttpSession session) {
		ModelAndView mav = new ModelAndView("team/tMain");
		Map<String, String> teamCode = tCode();
		List<String> score = tRankS(session);
		List<String> title = tRankT();
		List<String> teamRankName = teamRankName();
		List<String> tcode = new ArrayList<>();
		List<String> tName = new ArrayList<>();
		for (String s : teamCode.keySet()) {
			tcode.add(String.valueOf(teamCode.get(s)));
		}
		Map<String, String> pCode = pCode(tcode);
		for (String s : pCode.keySet()) {
			tName.add(s);
		}
		Map<String, String> pName = pName(tName);
		// pCode(팀 번호) =key : 선수 번호, value : 팀 번호
		session.setAttribute("teamCode", teamCode);
		mav.addObject("teamRankName", teamRankName);
		mav.addObject("score", score);
		mav.addObject("title", title);
		mav.addObject("pCode", pCode);
		mav.addObject("pName", pName);
		return mav;
	}
	//팀 세부정보
	@RequestMapping("team/tInfo")
	public ModelAndView tInfo(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("team/teamInfo");
		String tnum = request.getParameter("tcode");
		Map<String, String> pCode = plCode(tnum); //pCode(팀 번호) =key : 선수 번호, value : 팀 번호
		List<String> tName = new ArrayList<>();
		for (String s : pCode.keySet()) {
			tName.add(s);
		}
		Map<String, String> pName = pName(tName); //pName(선수 번호) =>key : 선수 번호, value : 선수 이름
		mav.addObject("table1",Table1(tnum));
		mav.addObject("table2",Table2(tnum));
		mav.addObject("table3",Table3(tnum));
		mav.addObject("teaminfo",Tinfo(tnum)); //팀 정보
		mav.addObject("pCode", pCode);
		mav.addObject("pName", pName);
		
		return mav;
	}
	//
	@RequestMapping("team/pl")
	public ModelAndView pMain(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("team/player");
		String pnum = request.getParameter("pCode");
		Map<String,List> pinfo = player(pnum);
		mav.addObject("seasonrecord",season(pnum));
		mav.addObject("gamerecord",game(pnum));
		mav.addObject("pinfo",pinfo);
		return mav;
	}







	@RequestMapping("team/t1")
	public ModelAndView test4(HttpSession session) {
		ModelAndView mav = new ModelAndView("team/ts1");
		Map<String, String> teamCode = tCode();
		List<String> tcode = new ArrayList<>();
		for (String s : teamCode.keySet()) {
			tcode.add(String.valueOf(teamCode.get(s)));
		}
		Map<String, String> pCode = pCode(tcode);
		List<String> tName = new ArrayList<>();
		for (String s : pCode.keySet()) {
			tName.add(s);
		}
		Map<String, String> pName = pName(tName);
		// pName(선수 번호) =>key : 선수 번호, value : 선수 이름
		mav.addObject("pCode", pCode);
		mav.addObject("pName", pName);
		return mav;
	}

	@RequestMapping("team/t2")
	public ModelAndView test2(HttpSession session) {
		ModelAndView mav = new ModelAndView("team/ts2");
		Map<String, String> tCode = tCode();
		session.setAttribute("tCode", tCode);
		return mav;
	}
// 여기부터 크롤링을 위한 메서드
	private List<String> teamRankName() {
		String url = "https://www.kbl.or.kr/stats/team_rank.asp";
		List<String> score = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for (Element c : src.select("td:eq(1)")) {
					score.add(c.text());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return score;
	}
	
	private List<String> tRankS(HttpSession session) {
		String url = "https://www.kbl.or.kr/stats/team_rank.asp";
		List<String> score = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			Map<String, String> teamCode = tCode();
			int i = 0;
			for (Element src : div) {
				for (Element c : src.select("td")) {
					String text = c.text();
					score.add(text);
					if (i % 10 == 1) {
						score.remove(i);
						score.add(getKey(teamCode, text));
					}
					i++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return score;
	}

	private String getKey(Map<String, String> teamCode, String string) {
		for (String o : teamCode.keySet()) {
			if (string.contains(o)) {
				return o;
			}
		}
		return null;
	}
	private Map<String,List> MainRank(){
		List<String> teamname = new ArrayList<String>();
		List<String> win = new ArrayList<String>();
		List<String> lose = new ArrayList<String>();
		Map<String,List> rank = new TreeMap<>();
		String url = "https://www.kbl.or.kr/main/main.asp";
		
		try {
			Document doc = Jsoup.connect(url).get();	
			Elements div = doc.select("div.row");							
			for (Element src : div) {
				for(Element c : src.select("strong.txt_team")) {	
					teamname.add(c.text());	
				}
			}
			for (Element src : div) {
				for(Element c : src.select("span.txt_win")) {	
					win.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("span.txt_lose")) {
					lose.add(c.text());
				}
			}
			rank.put("teamname", teamname);
			rank.put("win", win);
			rank.put("lose", lose);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return rank;
	}
	private Map<String, List> MainPRank() {
		List<String> cont = new ArrayList<String>();
		List<String> teamname = new ArrayList<String>();
		List<String> pname = new ArrayList<String>();
		List<String> score = new ArrayList<String>();
		List<String> pimg = new ArrayList<String>();
		Map<String,List> prank = new TreeMap<>();
		String url = "https://www.kbl.or.kr/main/main.asp";	// 소스를 가져올 주소입력
		try {
			Document doc = Jsoup.connect(url).get();	// doc : url 소스 전체를 가져옴
			Elements div = doc.select("div.row");	
			// div : doc에서 div태그 중 class속성이 table_type_ht이고 mt1인 div태그를 선택
			for (Element src : div) {
				for(Element c : src.select("div.desc_block strong")) {	// div에서  (table태그안에있는)caption태그를 선택
					cont.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("div.desc_block div.name")) {	// div에서  (table태그안에있는)caption태그를 선택
					pname.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("div.desc_block div.team")) {	// div에서  (table태그안에있는)caption태그를 선택
					teamname.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("div.desc_block em")) {	// div에서  (table태그안에있는)caption태그를 선택
					score.add(c.text());
				}
			}
			/*
			 * String val = outCode.substring(outCode.indexOf("/") + 1, outCode.indexOf(".png"));
			 *  <img src="/images/playersPhoto/290381.jpg" alt="이정현">
				<img src="/images/playersPhoto/290450.jpg" alt="오세근">
				<img src="/images/playersPhoto/290380.jpg" alt="박찬희">
			 */
			for (Element src : div) {
				for(Element c : src.select("div.cover img")) {
					String outCode = c.toString();
					String val = outCode.substring(outCode.lastIndexOf("/") + 1, outCode.indexOf(".jpg"));
					pimg.add(val);
				}
			}
			prank.put("cont", cont);
			prank.put("pname", pname);
			prank.put("teamname", teamname);
			prank.put("score", score);
			prank.put("pimg",pimg);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return prank;
	}
	private Map<String,List> player(String pnum) {
		List<String> pinfoco = new ArrayList<String>();
		List<String> pinfosu = new ArrayList<String>();
		Map<String,List> pinfo = new TreeMap<>();
		
		String url = "https://www.kbl.or.kr/players/player_info.asp?pcode="+pnum;	// 소스를 가져올 주소입력
		try {
			Document doc = Jsoup.connect(url).get();	// doc : url 소스 전체를 가져옴
			Elements div = doc.select("div.playerbox_2015");
			// div : doc에서 div태그 중 class속성이 table_type_ht이고 mt1인 div태그를 선택		
			for (Element src : div) {
				for(Element c : src.select("dl.protxt_2015 dd")) {	
					String outCode = c.text();
					String val = outCode.replace((char)160,' ');
					pinfoco.add(val);
				}
			}
			for (Element src : div) {
				for(Element c : src.select("dl.protxt_2015 dt")) {	
					String outCode = c.text();
					String val = outCode.replace((char)160,' ');
					pinfosu.add(val);
				}
			}
			pinfo.put("psu",pinfosu);
			pinfo.put("pco",pinfoco);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return pinfo;
	}
	private Map<String,String> Tinfo(String tnum){
		Map<String,String> tinfo = new TreeMap<>();
		String url = "https://www.kbl.or.kr/teams/team_info.asp?tcode="+tnum;	// 소스를 가져올 주소입력

		try {
			Document doc = Jsoup.connect(url).get();	// doc : url 소스 전체를 가져옴
			Elements div = doc.select("dl.infotxt_2015");
			// div : doc에서 div태그 중 class속성이 table_type_ht이고 mt1인 div태그를 선택		
			int cnt=0;
			for (Element src : div) {
				for(Element c : src.select("dd")) {	
					cnt ++;
					tinfo.put("infotxt"+cnt,c.text());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tinfo;
	}
	private List<String> tRankT() {
		String url = "https://www.kbl.or.kr/stats/team_rank.asp";
		List<String> title = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for (Element c : src.select("th")) {
					String text = c.text();
					title.add(text);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return title;
	}

	private String teamName() {
		String url = "https://www.kbl.or.kr/schedule/today/todaygame.asp";
		String line = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("ul.gnb__list>li:eq(2)");
			String tmpline = div.toString();
			line += tmpline;
		} catch (IOException e) {
			e.printStackTrace();
		}
		line += "</table>";
		return line;
	}

	private Map<String, String> tCode() {
		List<String> tCode1 = new ArrayList<String>();
		List<String> tCode2 = new ArrayList<String>();
		Map<String, String> tMap = new HashMap<String, String>();
		String url = "https://www.kbl.or.kr/stats/team_rank.asp";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("div.foot_link");
			for (Element src : div) {
				for (Element c : src.select("li>a>img")) {
					String outCode = c.toString();
					String val = outCode.substring(outCode.indexOf("_") + 1, outCode.indexOf(".png"));
					if (val.length()<2) {
						String num="0";
						String num1=val;
						val+=num+num1;
					}
					tCode2.add(val);
				}
				for (Element c : src.select("li")) {
					tCode1.add(c.text());
				}
			}
			for (int i = 0; i < tCode2.size(); i++) {
				tMap.put(tCode1.get(i), tCode2.get(i));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tMap;
	}

	private Map<String, String> pCode(List<String> tcode) {  
		Map<String, String> tMap = new TreeMap();
		try {
			for (String s : tcode) {
				String url = "https://www.kbl.or.kr/teams/team_players.asp?tcode=" + s;
				Document doc = Jsoup.connect(url).get();
				Elements div = doc.select("div#subcontents>div");
				for (Element src : div) {
					for (Element c : src.select("img")) {
						String outCode = c.toString();
						String val = outCode.substring(outCode.indexOf("o/")+2, outCode.indexOf(".jpg"));
						tMap.put(val,s);
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tMap;
	}
	private Map<String, String> plCode(String tcode) { //tinfo에서 사용할
		Map<String, String> tMap = new TreeMap();
		try {
				String url = "https://www.kbl.or.kr/teams/team_players.asp?tcode=" + tcode;
				Document doc = Jsoup.connect(url).get();
				Elements div = doc.select("div#subcontents>div");
				for (Element src : div) {
					for (Element c : src.select("img")) {
						String outCode = c.toString();
						String val = outCode.substring(outCode.indexOf("o/")+2, outCode.indexOf(".jpg"));
						tMap.put(val,tcode);
					}		
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tMap;
	}
	private Map<String, String> pName(List<String> tName) {
		Map<String, String> tMap = new TreeMap();
		try {
			for (String s : tName) {
				String url = "https://www.kbl.or.kr/players/player_info.asp?pcode=" + s;
				Document doc = Jsoup.connect(url).get();
				Elements div = doc.select("div#subcontents>div>div>dl");
				for (Element src : div) {
					Elements c = src.select("dd>dl:eq(0)");
					for (Element pro : c) {
						Elements dd = pro.select("dd");
						for (Element name : dd) {
							String outCode = name.toString();
							String val = outCode.substring(outCode.indexOf("d>") +4, outCode.indexOf("&"));
							tMap.put(s, val);
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return tMap;
	}
	private Map<String,Object> Table1(String tnum) {
		String url = "https://www.kbl.or.kr/teams/team_record.asp?tcode="+tnum;
		List<String> num = new ArrayList<String>();
		List<String> name = new ArrayList<String>();
		List<String> G = new ArrayList<String>();
		List<String> Min = new ArrayList<String>();
		List<String> P2 = new ArrayList<String>();
		List<String> PA2 = new ArrayList<String>();
		List<String> Per1 = new ArrayList<String>();
		List<String> P3 = new ArrayList<String>();
		List<String> PA3 = new ArrayList<String>();
		List<String> Per2 = new ArrayList<String>();
		List<String> FG = new ArrayList<String>();
		List<String> FT = new ArrayList<String>();
		List<String> FTA = new ArrayList<String>();
		List<String> Per3 = new ArrayList<String>();
		List<String> foot = new ArrayList<String>();
		Map<String, Object> table1 = new TreeMap<>();
		
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(0)")) {	
					num.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(1)")) {	
					name.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(2)")) {	
					G.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(3)")) {	
					Min.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(4)")) {	
					P2.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(5)")) {	
					PA2.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(6)")) {	
					Per1.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(7)")) {	
					P3.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(8)")) {	
					PA3.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(9)")) {	
					Per2.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(10)")) {	
					FG.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(11)")) {	
					FT.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(12)")) {	
					FTA.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) td:eq(13)")) {	
					Per3.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(0) tfoot tr td")) {	
					foot.add(c.text());
					
				}
			}
			table1.put("num",num);
			table1.put("name",name);
			table1.put("G",G);
			table1.put("Min",Min);
			table1.put("P2",P2);
			table1.put("PA2",PA2);
			table1.put("Per1",Per1);
			table1.put("P3",PA3);
			table1.put("PA3",PA3);
			table1.put("Per2",Per2);
			table1.put("FG",FG);
			table1.put("FT",FT);
			table1.put("FTA",FTA);
			table1.put("Per3",Per3);
			table1.put("foot", foot);
			table1.put("size", num.size());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return table1;	
	}
	private Map<String,Object> Table2(String tnum) {
		String url = "https://www.kbl.or.kr/teams/team_record.asp?tcode="+tnum;
		List<String> num = new ArrayList<String>();
		List<String> name = new ArrayList<String>();
		List<String> Off = new ArrayList<String>();
		List<String> Def = new ArrayList<String>();
		List<String> RPG = new ArrayList<String>();
		List<String> Ast = new ArrayList<String>();
		List<String> APG = new ArrayList<String>();
		List<String> wFT = new ArrayList<String>();
		List<String> woFT = new ArrayList<String>();
		List<String> foot = new ArrayList<String>();
		Map<String, Object> table2 = new TreeMap<>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(0)")) {	
					num.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(1)")) {	
					name.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(2)")) {	
					Off.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(3)")) {	
					Def.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(4)")) {	
					RPG.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(5)")) {	
					Ast.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(6)")) {	
					APG.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(7)")) {	
					wFT.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) td:eq(8)")) {	
					woFT.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(1) tfoot tr td")) {	
					foot.add(c.text());
					
				}
			}
			table2.put("num",num);
			table2.put("name",name);
			table2.put("Off",Off);
			table2.put("Def",Def);
			table2.put("RPG",RPG);
			table2.put("Ast",Ast);
			table2.put("APG",APG);
			table2.put("wFT",wFT);
			table2.put("woFT",woFT);
			table2.put("foot", foot);
			table2.put("size", num.size());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return table2;
	}
	private Map<String,Object> Table3(String tnum) {
		List<String> num = new ArrayList<String>();
		List<String> name = new ArrayList<String>();
		List<String> STL = new ArrayList<String>();
		List<String> BS = new ArrayList<String>();
		List<String> GD = new ArrayList<String>();
		List<String> TO = new ArrayList<String>();
		List<String> DK = new ArrayList<String>();
		List<String> DKA = new ArrayList<String>();
		List<String> PTS = new ArrayList<String>();
		List<String> PPG = new ArrayList<String>();
		List<String> foot = new ArrayList<String>();
		Map<String, Object> table3 = new TreeMap<>();
		String url = "https://www.kbl.or.kr/teams/team_record.asp?tcode="+tnum;
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(0)")) {	
					num.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(1)")) {	
					name.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(2)")) {	
					STL.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(3)")) {	
					BS.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(4)")) {	
					GD.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(5)")) {	
					TO.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(6)")) {	
					DK.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(7)")) {	
					DKA.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(8)")) {	
					PTS.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) td:eq(9)")) {	
					PPG.add(c.text());
				}
			}
			for (Element src : div) {
				for(Element c : src.select("table:eq(2) tfoot tr td")) {	
					foot.add(c.text());
				}
			}
			table3.put("num", num);
			table3.put("name", name);
			table3.put("STL", STL);
			table3.put("BS", BS);
			table3.put("GD", GD);
			table3.put("TO", TO);
			table3.put("DK", DK);
			table3.put("DKA", DKA);
			table3.put("PTS", PTS);
			table3.put("PPG", PPG);
			table3.put("foot", foot);
			table3.put("size", num.size());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return table3;	
	}
	private List<Object> season(String pnum) {
		List<Object> table = new ArrayList<Object>();
		String url = "https://www.kbl.or.kr/players/player_season_record.asp?pcode="+pnum+"&flag1=1";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for(Element c : src.select("table")) {	
					//System.out.println(c.toString());
					//c.child(1).attr("style","float:left");
					table.add(c.toString());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return table;		
	}
	private List<Object> game(String pnum) {
		List<Object> table = new ArrayList<Object>();
		String url = "https://www.kbl.or.kr/players/player_game_record.asp?pcode="+pnum+"&flag1=1";

		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table.tbltype_record");
			for (Element src : div) {
				for(Element c : src.select("table")) {	
					//System.out.println(c.toString());
					table.add(c.toString());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return table;		
	}
}
