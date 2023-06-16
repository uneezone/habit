package com.habit.product;

import ch.qos.logback.core.net.SyslogOutputStream;
import jdk.jfr.Category;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.ItemList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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


        List<Integer> contNoList = productDao.contNoList(cate_large);
        Map<Integer, Map<String, Object>> starMap = new HashMap<>();

        for (Integer cont_no : contNoList) {
            starMap.put(cont_no, productDao.star(cont_no));
        }
        mav.addObject("starMap", starMap);

        Map<Integer, Map<String, Object>> priceMap = new HashMap<>();
        for (Integer cont_no : contNoList) {
            Map<String, Object> price = productDao.price(cont_no);
            if(price != null) {
                priceMap.put(cont_no, price);
            }
        }
        mav.addObject("priceMap", priceMap);


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
