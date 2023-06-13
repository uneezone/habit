package com.habit.tableexam2.web;

import org.springframework.web.bind.annotation.GetMapping;

@org.springframework.stereotype.Controller
public class Controller {
    //controller
    //주석
    public Controller() {
        System.out.println("Cont() 생성");
    }

    @GetMapping("/home")
    public String showHome () {
        return "habit";
    }

    @GetMapping("/category")
    public String category() { return "product/category";}
}



