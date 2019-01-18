package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SCController {
	String line = "";

	@RequestMapping("schedule/teamB")
	public ModelAndView teamB() {
		ModelAndView mav = new ModelAndView("schedule/team");
		return mav;
	}

	@RequestMapping("schedule/playerR")
	public ModelAndView playerR(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("schedule/player");
		String day = day();
		Map<List<String>, List<String>> prankMap = pRankS(day);
		Collection<String> key = null;
		Collection<String> value = null;
		for (List<String> s : prankMap.keySet()) {
			key = s;
		}
		for (List<String> s : prankMap.values()) {
			value = s;
		}
		Map<List<String>, List<String>> imgN = pImg(day);
		List<String> pcode = null;
		for (List<String> s : imgN.values()) {
			pcode = s;
		}
		mav.addObject("pcode", pcode);
		mav.addObject("Pkey", key);
		mav.addObject("Pvalue", value);
		return mav;
	}

	@RequestMapping(value = "schedule/CrowlingSchdule", method = RequestMethod.GET)
	public ModelAndView CrowlingSchdule() {
		ModelAndView mav = new ModelAndView("schedule/scheMain");
		Date date = new Date();
		String inputUrl = new SimpleDateFormat("yyyy-MM-dd").format(date);
		String schedule = schedule(inputUrl);
		List<String> year =scheduleY(inputUrl);
		List<String> month =scheduleM(inputUrl);
		mav.addObject("schedule", schedule);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("SchYear", inputUrl.substring(0, 4));
		mav.addObject("SchMonth", inputUrl.substring(5, 7));
		return mav;
	}

	private String schedule(String inputUrl) {
		String url="https://www.kbl.or.kr/schedule/today/calendar.asp?tdate="
				+inputUrl+"&CalDate="+inputUrl+"&SchSeason=S1";
		String line2 = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table");
			String tmpline = div.toString();
			String imgs=tmpline.replaceAll("/images/new","/teamBLS/picture/schdule");
			String span=imgs.replaceAll("span>","span><br>");
			String img2=span.replaceAll("<img src=\"/images/schedule/ico_air.png\">","");
			String space1=img2.replaceAll("\\[","<br>\\[");
			String space2=space1.replaceAll("\\]","\\]<br>");
			String br=space2.replaceAll("<br><br>","<br>");
			String fi=br.replaceAll("<br></spa","</spa");
			String today=fi.replaceAll("<span class=\"today_icon\"><img src=\"/teamBLS/picture/schdule/today_icon.gif\" alt=\"\"></span>","");
			line2+=today;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return line2;
	}

	private List<String> scheduleY(String inputUrl) {
		String url="https://www.kbl.or.kr/schedule/today/calendar.asp?tdate="
				+inputUrl+"&CalDate="+inputUrl+"&SchSeason=S1";
		List<String> year = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("span.cate2>select:eq(0)");
			for (Element s : div.select("option")) {
				String text = s.text();
				year.add(text);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return year;
	}

	private List<String> scheduleM(String inputUrl) {
		String url="https://www.kbl.or.kr/schedule/today/calendar.asp?tdate="
				+inputUrl+"&CalDate="+inputUrl+"&SchSeason=S1";
		List<String> month = new ArrayList<String>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("span.cate2>select:eq(1)");
			for (Element s : div.select("option")) {
				String text = s.text();
				month.add(text.replaceAll("월", ""));
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return month;
	}
	@RequestMapping(value = "schedule/CrowlingSchduleF", method = RequestMethod.POST)
	public ModelAndView CrowlingSchduleChange(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("schedule/scheMain");
		String yearl=request.getParameter("SchYear");
		String monthl=request.getParameter("SchMonth");
		Date date = new Date();
		String inputUrl = new SimpleDateFormat("yyyy-MM-dd").format(date);
		String day=inputUrl.substring(8, 10);
		String scheduleC = scheduleC(yearl,monthl,day);
		List<String> year =scheduleY(inputUrl);
		List<String> month =scheduleM(inputUrl);
		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("schedule", scheduleC);
		mav.addObject("SchYear", yearl);
		mav.addObject("SchMonth", monthl);
		return mav;
	}

	private String scheduleC(String year,String month,String day) {
		String url="https://www.kbl.or.kr/schedule/today/calendar.asp?tdate="
				+year+"-"+month+"-"+day+"&CalDate="+year+"-"+month+"-"+day+"&SchSeason=S1";
		String line2 = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("table");
			String tmpline = div.toString();
			String imgs=tmpline.replaceAll("/images/new","/teamBLS/picture/schdule");
			String span=imgs.replaceAll("span>","span><br>");
			String img2=span.replaceAll("<img src=\"/images/schedule/ico_air.png\">","");
			String space1=img2.replaceAll("\\[","<br>\\[");
			String space2=space1.replaceAll("\\]","\\]<br>");
			String br=space2.replaceAll("<br><br>","<br>");
			String fi=br.replaceAll("<br></spa","</spa");
			String today=fi.replaceAll("<span class=\"today_icon\"><img src=\"/teamBLS/picture/schdule/today_icon.gif\" alt=\"\"></span>","");
			line2+=today;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return line2;
	}

	private Map<List<String>, List<String>> pRankS(String day) {
		String url = "https://www.kbl.or.kr/stats/part_player_rank.asp?gpart=1&scode=" + day;
		List<String> name = new ArrayList<String>();
		List<String> score = new ArrayList<String>();
		Map<List<String>, List<String>> rank = new HashMap<List<String>, List<String>>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("ol>li");
			for (Element src : div) {
				for (Element a : src.select("a")) {
					String text = a.text();
					name.add(text);
				}
				for (Element sp : src.select("span")) {
					String text = sp.text();
					score.add(text);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		rank.put(name, score);
		return rank;
	}

	private Map<List<String>, List<String>> pImg(String day) {
		String url = "https://www.kbl.or.kr/stats/part_player_rank.asp?gpart=1&scode=" + day;
		List<String> name = new ArrayList<String>();
		List<String> code = new ArrayList<String>();
		Map<List<String>, List<String>> pcode = new HashMap<List<String>, List<String>>();
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select("ol>li");
			for (Element src : div) {
				for (Element a : src.select("a")) {
					String text = a.text();
					name.add(text);
				}
				for (Element im : src.select("a")) {
					String text = im.toString();
					String val = text.substring(text.indexOf("de=") + 3, text.indexOf(">") - 1);
					code.add(val);
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		pcode.put(name, code);
		return pcode;
	}

	private String day() {
		String url = "https://www.kbl.or.kr/stats/part_player_rank.asp?";
		String val = "";
		try {
			Document doc = Jsoup.connect(url).get();
			Elements div = doc.select(".more");
			int i = 0;
			for (Element src : div) {
				i++;
				String outCode = src.toString();
				val = outCode.substring(outCode.indexOf("scode=") + 6, outCode.indexOf("&amp;gcode="));
				if (i > 0)
					break;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return val;
	}
	

	@RequestMapping("schedule/schedule")
	public ModelAndView sc() throws Exception {
		ModelAndView mav = new ModelAndView("schedule/schedule");
		List<String> paths = Arrays.asList("2018_2019_schedule.xlsx");
		List<String> list = new ArrayList<String>();
		for (String path : paths) {
			Workbook tempWorkbook;
			if (path.endsWith(".xls")) {
				tempWorkbook = new HSSFWorkbook(new FileInputStream(path));
			} else if (path.endsWith(".xlsx")) {
				tempWorkbook = new XSSFWorkbook(new FileInputStream(path));
			} else {
				throw new IllegalAccessError("xls / xlsx 확장자만 읽을 수 있습니다.");
			}
			try (Workbook workbook = tempWorkbook) {
//				System.out.println("경로 : " + path);
				Sheet sheet = workbook.getSheetAt(0);
//				System.out.println("첫번째 sheet 읽음");
				// 행을 가져옵니다.
				for (Row row : sheet) {
					// cell (행의 각 열) 을 가져옵니다.

					row.forEach(cell -> {
						/*
						 * System.out.print(cell.toString()); System.out.print(" || ");
						 */

						line += cell + " ";
					});
					list.add(line);
					line = "";

//					System.out.println();
				}
//				System.out.println(list);
			}
		}
		return mav;
	}
}
