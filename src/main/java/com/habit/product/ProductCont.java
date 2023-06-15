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
import java.util.Map;

@Controller
@Slf4j
public class ProductCont {

    public ProductCont () {
        System.out.println("-----ProductCont() 객체 생성됨");
    }

    @Autowired
    ProductDAO productDao;

    @RequestMapping  ("/category")
    public ModelAndView category() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/category");

        mav.addObject("category", productDao.category());
        return mav;
    }

    @RequestMapping("category/{cate_large}")
    public ModelAndView list(@PathVariable String cate_large){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/itemlist");
        mav.addObject("list", productDao.list(cate_large));
        mav.addObject("middle", productDao.middle(cate_large));
        return mav;
    }

    @RequestMapping("/category/products/{cont_no}")
    public ModelAndView detail(@PathVariable int cont_no) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/detailpage");
        mav.addObject("detail", productDao.detail(cont_no));
        return mav;
    }


}
