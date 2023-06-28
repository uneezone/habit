package com.habit.product;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class FilterCont {

    @Autowired
    ProductDAO productDao;

    @Autowired
    FilterDAO filterDao;

    @Autowired
    DetailDAO detailDao;

    //중분류 클릭시  매핑
    @RequestMapping("/category/{cate_large}/{cate_middle}")
    public ModelAndView midfilter(@PathVariable String cate_large, @PathVariable String cate_middle, @RequestParam(required = false) String filter) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/midfilter");

        // Filter 처리
        List<Map<String, Object>> list;
        if (filter != null) {
            switch (filter) {
                case "midpopularity":
                    list = filterDao.selectMidByPopularity(cate_large, cate_middle);
                    break;
                case "middate":
                    list = filterDao.selectMidByDate(cate_large, cate_middle);
                    break;
                case "midrating":
                    list = filterDao.selectMidByRating(cate_large, cate_middle);
                    break;
                case "midhighPrice":
                    list = filterDao.selectMidByHighPrice(cate_large, cate_middle);
                    break;
                case "midlowPrice":
                    list = filterDao.selectMidByLowPrice(cate_large, cate_middle);
                    break;
                default:
                    list = productDao.list(cate_large);
                    break;
            }
        } else {
            list = filterDao.midFilter(cate_large, cate_middle);
        }

        mav.addObject("middle", productDao.middle(cate_large));

        List<Map<String, Object>> midfilter = list;
        for (Map<String, Object> cont : midfilter) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }
        mav.addObject("midFilter", midfilter);
        mav.addObject("midHotListCount", filterDao.midHotListCount(cate_large, cate_middle));



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

        Map<Integer, Map<String, Object>> reviewcnt = new HashMap<>();
        for (Integer cont_no : contNoList) {
            reviewcnt.put(cont_no, detailDao.contreviewcnt(cont_no));
        }
        mav.addObject("reviewcnt", reviewcnt);

        return mav;
    }

    //중분류 전체보기 매핑
    @RequestMapping("/category/{cate_large}/{cate_middle}/all")
    public ModelAndView midFilterAll(@PathVariable String cate_large, @PathVariable String cate_middle) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/allmidfilter");
        mav.addObject("middle", productDao.middle(cate_large));
        mav.addObject("midFilter", filterDao.midFilter(cate_large, cate_middle));
        mav.addObject("midHotListCount", filterDao.midHotListCount(cate_large, cate_middle));

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

    //중분류 선택시 인기 리스트 매핑
    @RequestMapping("category/{cate_large}/{cate_middle}/hot")
    public ModelAndView midHotList(@PathVariable String cate_large,  @PathVariable String cate_middle) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/midhotlist");
        mav.addObject("midHotListCount", filterDao.midHotListCount(cate_large, cate_middle));
        mav.addObject("midHotList", filterDao.midHotList(cate_large, cate_middle));


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

    //중분류 선택시 신규 리스트 매핑
    @RequestMapping("category/{cate_large}/{cate_middle}/new")
    public ModelAndView midNewList(@PathVariable String cate_large,  @PathVariable String cate_middle) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/midnewlist");
        mav.addObject("midNewListCount", filterDao.midNewListCount(cate_large, cate_middle));
        mav.addObject("midNewList", filterDao.midNewList(cate_large, cate_middle));


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
