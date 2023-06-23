package com.habit.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class PayCont {

    public PayCont(){
        System.out.println("----PayCont() 객체 생성됨");
    }

    @Autowired
    PayDAO payDAO;
//
//    @RequestMapping(value="/order/payDone", method= RequestMethod.GET)
//    public String payDone(@ModelAttribute CartDTO cartDTO, HttpServletRequest req, HttpSession session){
//
//        System.out.println("안녕하세요");
//    }

}
