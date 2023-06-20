package com.habit.product;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class DetailCont {

    @Autowired
    DetailDAO detailDao;

    @Autowired
    ProductDAO productDao;



    // 아이템 클릭시 상세페이지 매핑
    @RequestMapping("/category/products/{cont_no}")
    public ModelAndView detail(@PathVariable int cont_no) {
        ModelAndView mav = new ModelAndView();

        // 조회수 업데이트
        productDao.updateViewCount(cont_no);

        mav.setViewName("product/detailpage");
        mav.addObject("detail", productDao.detail(cont_no));
        mav.addObject("hostprofile", detailDao.hostprofile(cont_no));
        mav.addObject("price", productDao.price(cont_no));
        mav.addObject("star", productDao.star(cont_no));


        return mav;
    }


}
