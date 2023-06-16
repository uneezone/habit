package com.habit.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;


@Controller
public class memberCont {

    @Autowired
    memberDAO memberdao;
    public memberCont() {
        System.out.println("Cont() 생성");
    }


    @RequestMapping("/newMember.do")
    public ModelAndView newMember() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/newMember");
        return mav;
    }//member() end

    @RequestMapping("/welcome.do")
    public String welcome(@RequestParam Map<String, Object> map) {


       System.out.println(map.get("user_id"));
       System.out.println(map.get("user_pw"));
       System.out.println(map.get("user_name"));
       System.out.println(map.get("user_email"));
       System.out.println(map.get("user_email2"));
       System.out.println(map.get("user_phone"));
       System.out.println(map.get("user_phone2"));
       System.out.println(map.get("user_phone3"));
       System.out.println(map.get("user_birth"));
       System.out.println(map.get("user_gender"));

       String user_email=map.get("user_email") + "@" + map.get("user_email2");
       map.put("user_email", user_email);

       String user_phone=map.get("user_phone") + "-" + map.get("user_phone2") + "-" + map.get("user_phone3");
        map.put("user_phone", user_phone);


       memberDAO.insert(map);

        return "redirect:/";


    }




}






