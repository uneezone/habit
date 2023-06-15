package com.habit.product;

import ch.qos.logback.core.net.SyslogOutputStream;
import jdk.jfr.Category;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.ItemList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/category")
public class ProductCont {

    public ProductCont () {
        System.out.println("-----ProductCont() 객체 생성됨");
    }

    @Autowired
    ProductDAO productDao;

    @RequestMapping  ("")
    public String cate() {
        return "product/category";
    }



    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mav = new ModelAndView();
        log.info("list={}",productDao.list());
        mav.setViewName("product/itemlist");

        mav.addObject("list", productDao.list());

        //test code
        mav.addObject("mid", productDao.mid());

        return mav;
    }

    @RequestMapping("/category/{cate_large}")
    public ModelAndView middle(@PathVariable String cate_large){
        ModelAndView mav = new ModelAndView();
        mav. setViewName("product/itemlist");
        mav.addObject("suf", cate_large);
        return mav;
    }

}
