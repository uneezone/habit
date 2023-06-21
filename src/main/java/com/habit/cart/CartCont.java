package com.habit.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;


@Controller
@RequestMapping("/cart")
public class CartCont {

    public CartCont() {
        System.out.println("----CartCont() 객체 생성됨");
    }

    @Autowired
    CartDAO cartDAO;

    @RequestMapping(value="/insert")
    public String cartInsert(@ModelAttribute CartDTO cartDTO, HttpSession session, HttpServletRequest req){
        cartDTO.setUser_id("user-3");
        cartDAO.cartInsert(cartDTO);

        return "redirect:/cart/list";
    }

    @RequestMapping(value="/list")
    public ModelAndView list(HttpSession session, HttpServletRequest req){
        String user_id="user-3";

        //System.out.println(cartDAO.oneday_list("user-3"));

        ModelAndView mav=new ModelAndView();
        mav.setViewName("order/cart");
        mav.addObject("list1", cartDAO.oneday_list(user_id));
        mav.addObject("list2", cartDAO.prod_list(user_id));
        return mav;

    }

    @RequestMapping(value="/delete")
    public String delete(HttpSession session, int cl_no){
        HashMap<String, Object> map=new HashMap<>();
        map.put("cl_no", cl_no);
        map.put("user_id", "user-3");
        cartDAO.cartDelete(map);

        return "redirect:/cart/list";
    }


}
