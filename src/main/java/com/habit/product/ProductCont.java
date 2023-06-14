package com.habit.product;

import ch.qos.logback.core.net.SyslogOutputStream;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.ItemList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
        return mav;
    }

}
