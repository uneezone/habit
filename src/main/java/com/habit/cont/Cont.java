package com.habit.cont;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class Cont {
    //주석
    public Cont() {
        System.out.println("Cont() 생성");
    }

    @GetMapping("/")
    public String showHome () {
        return "order/payPage";
    }

    @GetMapping("/category")
    public String category() { return "product/category";}
}



