package controller;



import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.Item;
import logic.Sale;
import logic.SaleItem;
import logic.ShopService;
import logic.User;


@Controller
public class UserController {
   @Autowired
   ShopService service;
   
   @RequestMapping("user/userreg")
   public ModelAndView userreg() {
      ModelAndView mav = new ModelAndView();
      mav.addObject(new User());
      return mav;
   }
   
   @RequestMapping("user/userEntry")
   public ModelAndView entry(@Valid User user, BindingResult br) {
      ModelAndView mav = new ModelAndView("user/userreg");
      if (br.hasErrors()) {
         mav.getModel().putAll(br.getModel());
         return mav;
      }
      try {
         service.userCreate(user);
         mav.setViewName("user/login");
         mav.addObject("user", user);
      } catch (Exception e) {
         br.reject("error.duplicate.user");
      }
      return mav;
   }
   
      @RequestMapping(value="user/login", method=RequestMethod.GET)
       public ModelAndView login() {
          ModelAndView mav = new ModelAndView();
          mav.addObject(new User());
         return mav; 
      }
      
      @RequestMapping(value="user/login", method=RequestMethod.POST)
        public ModelAndView login(@Valid User user, BindingResult br, HttpSession session) {
            ModelAndView mav = new ModelAndView();
            if (br.hasErrors()) {
               mav.getModel().putAll(br.getModel());
               System.out.println("hasErrors : "+br.getModel());
               return mav;
            }
            try {
               User dbuser = service.selectUser(user.getUserId());
               System.out.println(dbuser);
               if(dbuser == null) {
                  br.reject("error.login.id");
                  mav.getModel().putAll(br.getModel());
                  return mav;
               }
               if(user.getPassword().equals(dbuser.getPassword())) {
                  session.setAttribute("loginUser", dbuser);
               } else {
                  br.reject("error.login.password");
                  mav.getModel().putAll(br.getModel());
                  return mav;
               }
            } catch (Exception e) {
               e.printStackTrace();
               br.reject("error.user.login");
               mav.getModel().putAll(br.getModel());
               return mav;
            }
            mav.setViewName("user/loginSuccess");
            return mav;
         }
   
   @RequestMapping("user/logout")
   public ModelAndView logout(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("redirect:login.shop");
      session.invalidate();
      return mav;   
   }
   
   @RequestMapping("user/mypage")
     public ModelAndView mypage(String id,HttpSession session) {
       ModelAndView mav = new ModelAndView();
        User user = (User)session.getAttribute("loginUser");  
        List<Sale> saleList = service.getSaleList(id);     
        for(Sale s : saleList) {

           List<SaleItem> saleItemList = service.getSaleItemList(s.getSaleId());
           s.setItemList(saleItemList);
           for(SaleItem si : saleItemList) {
              Item item=service.getItem(""+si.getItemId());
              si.setItem(item);
           }
        }     
        mav.addObject("salelist",saleList);
        mav.addObject("user",user);
      return mav;  
     }
   
    @RequestMapping("user/updateForm")
     public ModelAndView updateForm(String id, HttpSession session) {
        ModelAndView mav = new ModelAndView();
         User user = service.selectUser(id);
        mav.addObject("user",user);
      return mav;
     }

     @RequestMapping("user/update")
     public ModelAndView update(@Valid User user, HttpSession session, BindingResult br) {
        ModelAndView mav = new ModelAndView("user/updateForm");
        if(br.hasErrors()) {
           mav.getModel().putAll(br.getModel());
           System.out.println(br.getModel());
           return mav;
        }

        User dbuser = service.selectUser(user.getUserId());  
        if(user.getPassword().equals(dbuser.getPassword())) {
           try {// 업데이트 성공
              System.out.println(1);
           service.userUpdate(user);
           mav.setViewName("user/mypage");
        }catch(Exception e) {// 업데이트 오류 , 작성 이 안되거나 맞는 값이 아님
           mav.setViewName("user/updateForm");
        }
        }else {   // 비밀번호가 맞지 않음...
           br.reject("error.login.password");
           mav.getModel().putAll(br.getModel());
           mav.setViewName("user/update");
        }
      return mav;
     }
     
     @RequestMapping(value = "user/delete", method = RequestMethod.GET)
      public ModelAndView delete(String id, HttpSession session) {
         ModelAndView mav = new ModelAndView();
         User user = service.selectUser(id);
         mav.addObject("user", user);
         return mav;
      }
      
      @RequestMapping(value = "user/delete", method = RequestMethod.POST)
      public ModelAndView delete(String id, HttpSession session, String password, @Valid User user) {
         ModelAndView mav = new ModelAndView();
         User dbuser = service.selectUser(id);
         User loginUser =(User)session.getAttribute("loginUser");
         if(loginUser.getPassword().equals(dbuser.getPassword())) {
            try {
               service.userDelete(id);
               if(!loginUser.getUserId().equals("admin")) {
                  session.invalidate();
                  mav.setViewName("redirect:login.shop");
               } else {
                  mav.setViewName("redirect:../admin/list.shop");
               }   
            }catch (Exception e) {
               e.printStackTrace();
               throw new LoginException("탈퇴 실패","../user/delete.shop?id" + id);
            }

            } else {
               throw new LoginException("비밀번호 오류", "../user/delete.shop?id="+ id);
            }
         return mav;
      }
}