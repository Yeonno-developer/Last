package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.jboss.netty.handler.codec.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.ShopException;
import logic.Board;
import logic.ShopService;

@Controller
public class BoardController {
	@Autowired
	private ShopService service;

	@RequestMapping(value = "board/list")
//	public ModelAndView list(Integer pageNum, String searchType, String searchContent,HttpRequest request) {
	public ModelAndView list(Integer pageNum, String searchType, String searchContent,HttpServletRequest request) {
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		ModelAndView mav = new ModelAndView();
		int limit = 10; // 한페이지에 출력할 게시물 갯수
		// 총 게시물 건수
//		int listcount = service.boardcount(searchType, searchContent);
		String tcode=request.getParameter("tcode");
		int listcount = service.boardcount(searchType, searchContent,tcode);
		// boardlist : 한페이지에 출력할 게시물 정보 저장
//		List<Board> boardlist = service.boardlist(searchType, searchContent, pageNum, limit);
		List<Board> boardlist = service.boardlist(searchType, searchContent, tcode, pageNum, limit);
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = ((int) ((pageNum / 10.0 + 0.9) - 1)) * 10 + 1;
		int endpage = startpage + 9;
		if (endpage > maxpage)
			endpage = maxpage;
		int boardcnt = listcount - (pageNum - 1) * limit;
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardlist", boardlist);
		mav.addObject("boardcnt", boardcnt);
		return mav;
	}

	@RequestMapping(value = "board/write", method = RequestMethod.POST)
	public ModelAndView boardadd(@Valid Board board, BindingResult br, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			service.boardadd(board, request);
			mav.addObject("board", board);
			mav.setViewName("redirect:list.shop?tcode="+request.getParameter("tcode"));
		} catch (Exception e) {
			e.printStackTrace();
			throw new ShopException("게시글 등록에 실패하셨습니다", "write.shop");
		}
		return mav;
	}

	/*
	 * 답글 등록 1. 유효성 검증 2. 답글 db에 등록 원게시글 정보 중 ref는 답글 정보의 ref 값 원게시글 정보 중 reflevel 는
	 * 답글의 reflevel + 1값 원게시글 정보 중 refstep 는 답글의 refstep + 1값 => 작업 전 기존의 원글의
	 * refstep 보다 큰 모든 레코드들을 refstep+1로 수정하기 3. 등록 후 list.shop 요청하기
	 */
	@RequestMapping(value = "board/reply", method = RequestMethod.POST)
	public ModelAndView reply(Board board, BindingResult br,HttpServletRequest value) {
		ModelAndView mav = new ModelAndView("redirect:detail.shop?num=" + board.getRef()+"&tcode="+value.getParameter("tcode"));
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			return mav;
		}
		try {
			service.replyadd(board);
			mav.addObject("board", board);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ShopException("답글 등록에 실패했습니다", "detail.shop?num=" + board.getRef()+"&tcode"+value.getParameter("tcode"));
		}
		return mav;
	}

	@RequestMapping(value = "board/update", method = RequestMethod.POST)
	public ModelAndView update(@Valid Board board, BindingResult br, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		Board b1 = service.getBoard(num); // 기존의 board
		if (br.hasErrors()) { // 유효성 검사
			mav.getModel().putAll(br.getModel());
			mav.addObject("board", b1);
			return mav;
		}
		if (!board.getPass().equals(b1.getPass())) {// 비밀번호 오류
			throw new ShopException("비밀번호를 확인하세요", "update.shop?num=" + board.getNum());
		} else { // 비번통과
			board.setFileurl(request.getParameter("file2")); //기존의 파일로 url 넣어놓기
			try { // 수정
				service.boardupdate(board,request);
				mav.addObject("board",board);
			} catch (Exception e) { // 수정시 오류 발생
				e.printStackTrace();
				throw new ShopException("게시글 수정에 실패했습니다", "update.shop?num=" + board.getNum());
			}
		}
		mav.setViewName("redirect:list.shop");
		return mav;
	}
	
	@RequestMapping(value = "board/delete", method = RequestMethod.POST)
	public ModelAndView delete(Board board) {
		ModelAndView mav = new ModelAndView();
		Board bo = service.getBoard(board.getNum());
		if(!board.getPass().equals(bo.getPass())) {
			throw new ShopException("비밀번호 오류", "delete.shop?num=" + board.getNum());
		}
		//비밀번호 확인 성공
		try {
			service.boarddelete(board.getNum());
			mav.setViewName("redirect:list.shop");
			mav.addObject("board",bo);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ShopException("게시글 삭제에 실패했습니다", "delete.shop?num=" + board.getNum());
		}
		return mav;
	}
	
	@RequestMapping(value = "board/*", method = RequestMethod.GET)
	public ModelAndView getboard(Integer num, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Board board = new Board();
		if (num != null) {
			if (request.getRequestURI().contains("detail")) { // 페이지경로가 datail을 포함할때 (상세보기)
				service.readcntadd(num); // 조회수 증가
			}
			board = service.getBoard(num);
			List<Board> boardreply=new ArrayList<>();
			boardreply = service.boardreply(board.getNum(),board.getReflevel());
			int commentcount = service.commentcount(board.getNum());
			mav.addObject("ccount", commentcount);
			mav.addObject("boardreply", boardreply);
		}
		mav.addObject("board", board);
		return mav;
	}
}
