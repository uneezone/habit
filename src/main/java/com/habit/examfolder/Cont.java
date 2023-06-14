package com.habit.examfolder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Cont {
    //controller
    //주석

    @GetMapping("/home")
    public String showHome () {
        return "habit";
    }


    @GetMapping("/itemlist")
    public String itemlist() { return "product/itemlist";}

    @GetMapping("/allitemlist")
    public String allitemlist() { return "product/allitemlist";}

    @GetMapping("/itemdetail")
    public String itemdetail() { return "product/detailpage";}

    @GetMapping("/payPage")
    public String payPage() { return "order/payPage";}

}



