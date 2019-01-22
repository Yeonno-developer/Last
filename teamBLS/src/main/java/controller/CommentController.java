package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import logic.Comment;
import logic.ShopService;
import logic.User;


@Controller
public class CommentController {

	@Autowired
	ShopService service;
	@RequestMapping("comment/register")
	public ModelAndView comment(Comment comment, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		service.commregster(comment);
		mav.setViewName("redirect:../item/detail.shop?id="+request.getParameter("itemid"));
		mav.addObject("comment", comment);
		return mav;
	}
	
	
	
	 
	@RequestMapping(value ="comment/commentupdatefrom")
	public ModelAndView commentupdate1(@Valid Comment comment, HttpSession session, BindingResult br, HttpServletRequest request, Integer comnum) {
		System.out.println("1"+comment);
		  System.out.println("2"+br);
		  System.out.println("3"+request);
		  System.out.println("4"+comnum);
		ModelAndView mav = new ModelAndView("comment/commentupdate");
		Comment dbcomment = service.getComment(comment.getComnum(), request);
		if (br.hasErrors()) {
			mav.getModel().putAll(br.getModel());
			mav.addObject("comment",dbcomment);
			return mav;
		}
		
		if (dbcomment.getPassword().equals(comment.getPassword())) {
			try {
				service.commnetUpdate(comment,request);
				mav.setViewName("item/detail");
				List<Comment> commentlist = service.commentlist();
				mav.addObject("commentlist", commentlist);
				mav.addObject("comment", comment);
			} catch(Exception e) {
				mav.setViewName("item/detail");
				List<Comment> commentlist = service.commentlist();
				mav.addObject("commentlist", commentlist);
			}
		} else {
			  mav.getModel().putAll(br.getModel());
			  mav.setViewName("item/detail");
			  List<Comment> commentlist = service.commentlist();
				mav.addObject("commentlist", commentlist);
		}
			return mav;
		}
	
	@RequestMapping(value="comment/commentupdate")
	  public ModelAndView updateForm(Comment comment, BindingResult br, HttpServletRequest request) {
		  ModelAndView mav = new ModelAndView();
			Comment dbcomment = service.getComment(comment.getComnum(), request);
			System.out.println("@"+comment);
			System.out.println("1"+dbcomment.getPassword());
			System.out.println("2"+comment.getPassword());
		  mav.addObject("Comment",dbcomment);
		return mav;
	  }
	
	@RequestMapping(value="comment/commentdelete")
	public ModelAndView delete(Comment comment, HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Comment dbcomment = service.getComment(comment.getComnum(), request);
		System.out.println("@"+comment);
		System.out.println("1"+dbcomment.getPassword());
		System.out.println("2"+comment.getPassword());
		mav.addObject("comment", comment);
		return mav;
	}
	
	 @RequestMapping(value="comment/commentdeletefrom")
		public ModelAndView delete(Comment comment, HttpServletRequest request, Integer comnum) {
			ModelAndView mav = new ModelAndView("comment/commentdelete");
			Comment dbcomment = service.getComment(comment.getComnum(), request); //db에 있는 데이터
			System.out.println("1"+comment);
			  System.out.println("3"+request);
			  System.out.println("4"+comnum);
			if(dbcomment.getPassword().equals(comment.getPassword())) { //비밀번호가 같으면
				try {
					service.commentdelete(comment);
					mav.setViewName("item/detail");
					List<Comment> commentlist = service.commentlist();
					mav.addObject("commentlist", commentlist);
					mav.addObject("comment", comment);
				}catch(Exception e) {
					mav.setViewName("item/detail");
					e.printStackTrace();
				}
			} else {
				  mav.setViewName("item/detail");
				  List<Comment> commentlist = service.commentlist();
				mav.addObject("commentlist", commentlist);
			}
			return mav;
		}		
}