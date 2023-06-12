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

    @GetMapping("/home")
    public String showHome () {
        return "habit";
    }

    @GetMapping("/category")
    public String category() { return "product/category";}

    @GetMapping("/itemlist")
    public String itemlist() { return "product/itemlist";}

    @GetMapping("/allitemlist")
    public String allitemlist() { return "product/allitemlist";}

    @GetMapping("/hotlist")
    public String hotlist() { return "product/hotlist";}

    @GetMapping("/newlist")
    public String newlist() { return "product/newlist";}
}



