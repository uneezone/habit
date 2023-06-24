package com.habit.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
public class CartCont {

    public CartCont() {
        System.out.println("----CartCont() 객체 생성됨");
    }

    @Autowired
    CartDAO cartDAO;

    @RequestMapping(value="/cart/insert", method = RequestMethod.POST, consumes = "application/json")
    public String cartInsert(@RequestBody CartDTO cartDTO, HttpSession session){
        cartDTO.setUser_id("user-3");
        cartDAO.cartInsert(cartDTO);

        return "redirect:/cart/list";
    }

    @RequestMapping(value="/cart/list")
    public ModelAndView list(HttpSession session, HttpServletRequest req){
        String user_id="user-3";

        //System.out.println(cartDAO.oneday_list("user-3"));
        List<CartDTO> list1 = cartDAO.oneday_list(user_id);
        List<CartDTO> list2 = cartDAO.prod_list(user_id);

        ModelAndView mav=new ModelAndView();
        mav.setViewName("order/cart");
        mav.addObject("list1", cartDAO.oneday_list(user_id));
        mav.addObject("list2", cartDAO.prod_list(user_id));

        return mav;

    }


    @RequestMapping(value="/cart/order/payPage", method=RequestMethod.GET)
    public ModelAndView orderSelectedItems(@RequestParam(value = "cartno")String ch, HttpServletRequest req){
        //System.out.println(ch);

        List<Integer> carts=new ArrayList<>();
        String[] cartnos= ch.split("-");// split으로 자르고 자른 조각들을 배열에 담는다.
        for (String cartno : cartnos) { // 배열에 담긴 문자열들을 하나씩 꺼내서 정수로 변환 후 리스트에 담기
            //System.out.println("cartno = " + cartno);
            carts.add(Integer.valueOf(cartno));
        }
        //req.setAttribute("carts", carts);
        System.out.println(carts);

        String user_id="user-3";
        HashMap<String, Object> map=new HashMap<>();
        map.put("user_id", user_id);
        map.put("carts", carts);

        List<CartDTO> cartDTOS=cartDAO.selectedItemsInfo(map);
        System.out.println(cartDTOS);
        //log.info("carts={}",carts);

        ModelAndView mav=new ModelAndView();

        mav.setViewName("order/payPage");
        mav.addObject("cartDTOS", cartDTOS);
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
