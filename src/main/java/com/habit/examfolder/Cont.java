package com.habit.examfolder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Cont {
    //controller
    //주석
    public Cont() {
        System.out.println("Cont() 생성");
    }

    @GetMapping("/home")
    public String showHome () {
        return "habit";
    }

    @GetMapping("/category")
    public String category() { return "product/category";}

    @GetMapping("/payPage")
    public String payPage() { return "order/payPage";}

}



