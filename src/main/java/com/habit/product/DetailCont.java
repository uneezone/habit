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

        Map<String, Object> hostProfileMap = detailDao.hostprofile(cont_no);

        if (hostProfileMap != null && hostProfileMap.containsKey("host_id")) {
            String host_id = (String) hostProfileMap.get("host_id");
            mav.addObject("hostcontcnt", detailDao.hostcontcnt(host_id));
            mav.addObject("hostreviewcnt", detailDao.hostreviewcnt(host_id));
            mav.addObject("hostzzimcnt", detailDao.hostzzimcnt(host_id));
        }

        mav.setViewName("product/detailpage");
        mav.addObject("detail", productDao.detail(cont_no));
        mav.addObject("hostprofile", detailDao.hostprofile(cont_no));
        mav.addObject("price", productDao.price(cont_no));
        mav.addObject("star", productDao.star(cont_no));
        mav.addObject("detailproduct", detailDao.detailproduct(cont_no));
        mav.addObject("contreview", detailDao.contreview(cont_no));
        mav.addObject("contreviewcnt", detailDao.contreviewcnt(cont_no));
        mav.addObject("contzzim", detailDao.contzzim(cont_no));


        return mav;
    }

    @RequestMapping("/category/{cont_no}/reviews")
    public ModelAndView reviews(@PathVariable int cont_no) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("etc/review");

        return mav;
    }


}
