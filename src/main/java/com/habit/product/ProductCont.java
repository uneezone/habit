package com.habit.product;

import ch.qos.logback.core.net.SyslogOutputStream;
import jdk.jfr.Category;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.ItemList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

    @Autowired
    DetailDAO detailDao;



    @RequestMapping  ("/category")
    public ModelAndView category() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/category");

        mav.addObject("category", productDao.category());
        return mav;
    }

//    기본 카테고리 클릭시 요약(인기/신규) 리스트 매핑
    @RequestMapping("category/{cate_large}")
    public ModelAndView list(@PathVariable String cate_large){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/itemlist");
        mav.addObject("middle", productDao.middle(cate_large));
        mav.addObject("hotTop", productDao.hotTop(cate_large));
        mav.addObject("hotListCount", productDao.hotListCount(cate_large));
        mav.addObject("newTop", productDao.newtop(cate_large));
        mav.addObject("newListCount", productDao.newListCount(cate_large));



        List<Integer> contNoList = productDao.contNoList(cate_large);
        Map<Integer, Map<String, Object>> starMap = new HashMap<>();

        for (Integer cont_no : contNoList) {
            starMap.put(cont_no, productDao.star(cont_no));
        }
        mav.addObject("starMap", starMap);

        Map<Integer, Map<String, Object>> priceMap = new HashMap<>();
        for (Integer cont_no : contNoList) {
            priceMap.put(cont_no, productDao.price(cont_no));
            Map<String, Object> price = productDao.price(cont_no);
            if(price != null) {
                priceMap.put(cont_no, price);
            }
        }
        mav.addObject("priceMap", priceMap);


        return mav;
    }

//    전체보기 클릭시 매핑
@RequestMapping("category/{cate_large}/all")
public ModelAndView allList(@PathVariable String cate_large) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("product/allitemlist");
    mav.addObject("list", productDao.list(cate_large));
    mav.addObject("middle", productDao.middle(cate_large));
    mav.addObject("hotListCount", productDao.hotListCount(cate_large));


    List<Integer> contNoList = productDao.contNoList(cate_large);
    Map<Integer, Map<String, Object>> starMap = new HashMap<>();

    for (Integer cont_no : contNoList) {
        starMap.put(cont_no, productDao.star(cont_no));
    }
    mav.addObject("starMap", starMap);

    Map<Integer, Map<String, Object>> priceMap = new HashMap<>();
    for (Integer cont_no : contNoList) {
        priceMap.put(cont_no, productDao.price(cont_no));
        Map<String, Object> price = productDao.price(cont_no);
        if(price != null) {
            priceMap.put(cont_no, price);
        }
    }
    mav.addObject("priceMap", priceMap);
    return mav;
}


    //인기 리스트 매핑
    @RequestMapping("category/{cate_large}/hot")
    public ModelAndView hotList(@PathVariable String cate_large) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/hotlist");
        mav.addObject("hotListCount", productDao.hotListCount(cate_large));

        // 기존 메서드에서 사용한 로직
        mav.addObject("hotList", productDao.hotList(cate_large));
        List<Integer> contNoList = productDao.contNoList(cate_large);
        Map<Integer, Map<String, Object>> starMap = new HashMap<>();

        for (Integer cont_no : contNoList) {
            starMap.put(cont_no, productDao.star(cont_no));
        }
        mav.addObject("starMap", starMap);

        Map<Integer, Map<String, Object>> priceMap = new HashMap<>();
        for (Integer cont_no : contNoList) {
            priceMap.put(cont_no, productDao.price(cont_no));
            Map<String, Object> price = productDao.price(cont_no);
            if(price != null) {
                priceMap.put(cont_no, price);
            }
        }
        mav.addObject("priceMap", priceMap);
        return mav;
    }

    //신규 리스트 매핑
    @RequestMapping("category/{cate_large}/new")
    public ModelAndView newList(@PathVariable String cate_large) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/newlist");
        mav.addObject("newListCount", productDao.newListCount(cate_large));

        // 기존 메서드에서 사용한 로직
        mav.addObject("newList", productDao.newList(cate_large));
        List<Integer> contNoList = productDao.contNoList(cate_large);
        Map<Integer, Map<String, Object>> starMap = new HashMap<>();

        for (Integer cont_no : contNoList) {
            starMap.put(cont_no, productDao.star(cont_no));
        }
        mav.addObject("starMap", starMap);

        Map<Integer, Map<String, Object>> priceMap = new HashMap<>();
        for (Integer cont_no : contNoList) {
            priceMap.put(cont_no, productDao.price(cont_no));
            Map<String, Object> price = productDao.price(cont_no);
            if(price != null) {
                priceMap.put(cont_no, price);
            }
        }
        mav.addObject("priceMap", priceMap);
        return mav;
    }







}
