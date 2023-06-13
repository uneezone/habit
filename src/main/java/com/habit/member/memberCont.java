package com.habit.member;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class memberCont {

    public memberCont() {
        System.out.println("Cont() 생성");
    }

    @GetMapping("/newMember")
    public String showHome () {
        return "member/newMember";
    }

}
