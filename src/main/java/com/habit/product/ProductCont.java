package com.habit.product;

import ch.qos.logback.core.net.SyslogOutputStream;
import jdk.jfr.Category;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.ItemList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
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

        List<Map<String, Object>> hotTop = productDao.hotTop(cate_large);
        for (Map<String, Object> cont : hotTop) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }
        mav.addObject("hotTop", hotTop);

        mav.addObject("hotListCount", productDao.hotListCount(cate_large));

        List<Map<String, Object>> newtop = productDao.newtop(cate_large);
        for (Map<String, Object> cont : newtop) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }
        mav.addObject("newTop", newtop);

        mav.addObject("newListCount", productDao.newListCount(cate_large));

        List<Map<String, Object>> reviewtop = productDao.reviewtop(cate_large);
        for (Map<String, Object> cont : reviewtop) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }
        mav.addObject("reviewTop", reviewtop);
        mav.addObject("reviewCount", productDao.reviewCount(cate_large));



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

//    전체보기 클릭시 매핑
@RequestMapping("category/{cate_large}/all")
public ModelAndView allList(@PathVariable String cate_large, @RequestParam(required = false) String filter) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("product/allitemlist");

    // Filter 처리
    List<Map<String, Object>> list;
    if (filter != null) {
        switch (filter) {
            case "popularity":
                list = productDao.selectContentsByPopularity(cate_large);
                break;
            case "date":
                list = productDao.selectContentsByDate(cate_large);
                break;
            case "rating":
                list = productDao.selectContentsByRating(cate_large);
                break;
            case "highPrice":
                list = productDao.selectContentsByHighPrice(cate_large);
                break;
            case "lowPrice":
                list = productDao.selectContentsByLowPrice(cate_large);
                break;
            default:
                list = productDao.list(cate_large);
                break;
        }
    } else {
        list = productDao.list(cate_large);
    }
    List<Map<String, Object>> alllist = list;
    for (Map<String, Object> cont : alllist) {
        String cont_img = (String) cont.get("cont_img");
        cont_img = cont_img.trim().split("\\|")[0];
        cont.put("cont_img", cont_img);
    }


    mav.addObject("list", alllist);
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

    Map<Integer, Map<String, Object>> reviewcnt = new HashMap<>();
    for (Integer cont_no : contNoList) {
        reviewcnt.put(cont_no, detailDao.contreviewcnt(cont_no));
    }
    mav.addObject("reviewcnt", reviewcnt);


    return mav;
}


    //인기 리스트 매핑
    @RequestMapping("category/{cate_large}/hot")
    public ModelAndView hotList(@PathVariable String cate_large) {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("product/hotlist");
        mav.addObject("hotListCount", productDao.hotListCount(cate_large));

        // 기존 메서드에서 사용한 로직

        List<Map<String, Object>> hotlist = productDao.hotList(cate_large);
        for (Map<String, Object> cont : hotlist) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }
        mav.addObject("hotList", hotlist);
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

    //신규 리스트 매핑
    @RequestMapping("category/{cate_large}/new")
    public ModelAndView newList(@PathVariable String cate_large) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("product/newlist");
        mav.addObject("newListCount", productDao.newListCount(cate_large));

        // 기존 메서드에서 사용한 로직

        List<Map<String, Object>> newlist = productDao.newList(cate_large);
        for (Map<String, Object> cont : newlist) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }
        mav.addObject("newList", newlist);
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


    //해빈 리뷰 담당
    //리뷰보여주기
    @GetMapping("/products/reviews")
    public String showReviewList(@RequestParam("cont_no")int cont_no, Model model,@RequestParam(value = "filter",defaultValue = "new")String filter){
        log.info("cont_no={}",cont_no);
        if(filter.equals("new")) {
            List<ReviewDTO> reviewList = productDao.getReviewList(cont_no);
            log.info("reviewList={}", reviewList);
            model.addAttribute("reviewList", reviewList);
        }else {
            List<ReviewDTO> reviewListByStar = productDao.getReviewListByStar(cont_no);
            log.info("reviewStar={}",reviewListByStar);
            model.addAttribute("reviewList",reviewListByStar);
        }
        return "etc/review";
    }

    //리뷰삭제->상태변화
    @DeleteMapping("/products/reviewDel")
    @ResponseBody
    public String delReview(@RequestParam("review_no") int review_no){
        log.info("review_no={}",review_no);
        int status = productDao.changeReviewStatus(review_no);

        if(status!=0){
            return "OK";
        }
        return "NOK";
    }

    //리뷰 필터링
    @GetMapping("/products/reviews/filter")
    @ResponseBody
    public List<ReviewDTO>  reviewsFilter(@RequestParam("filter")String filter, @RequestParam("cont_no")int cont_no){
        if(filter.equals("new")){
            List<ReviewDTO> reviewList = productDao.getReviewList(cont_no);
            log.info("reviewNuew={}",reviewList);
            return reviewList;
        }
        //별점순 리스트 가져오기
        List<ReviewDTO> reviewListByStar = productDao.getReviewListByStar(cont_no);
        log.info("reviewStar={}",reviewListByStar);
        return reviewListByStar;

    }

    //==검색창
    @GetMapping("/search")
    public String showSearch(@RequestParam("recentSearch") String recent,HttpServletResponse res,HttpServletRequest req,Model model){

        int status=0;
        Cookie[] cookies= req.getCookies();
        for (Cookie cookie : cookies) {
            if(cookie.getName().contains("search")){
                if(status<=5) {
                    status++;
                }
            }
        }

        log.info("status={}",status);
        //검색어가 공백이 아닐때
        if(!recent.equals("")) {
            String check="";
            for (Cookie cookie : cookies) {
                if(cookie.getName().contains("search0")){
                    check=cookie.getValue();
                }
            }

            if(!check.equals(recent)) {
                if (status != 0) {
                    //검색어 쿠키가 이미 있을때

                    //최근검색어 6개까지 보여주기
                    if (status > 5) {
                        System.out.println("쿠키생성1");
                        //새로운 검색어
                        Cookie newcookie = new Cookie("search0", recent);
                        newcookie.setMaxAge(60 * 60 * 24 * 7);
                        newcookie.setPath("/");
                        res.addCookie(newcookie);

                        for (int i = 0; i < status - 1; i++) {

                            String cookieValue = "";
                            for (Cookie cookie : cookies) {
                                if (cookie.getName().contains("search" + i)) {
                                    cookieValue = cookie.getValue();
                                }
                            }

                            //첫번째 쿠키 삭제
                            //검색어 하나씩 뒤로
                            Cookie cookie = new Cookie("search" + (i + 1), cookieValue);
                            cookie.setMaxAge(60 * 60 * 24 * 7); //최근검색어 일주일
                            cookie.setPath("/");
                            res.addCookie(cookie);
                        }
                    } else {
                        System.out.println("쿠키생성2");
                        Cookie cookie = new Cookie("search" + (5-status), recent);
                        res.addCookie(cookie);
                    }

                } else {
                    //처음 검색어를 입력할때
                    Cookie newcookie = new Cookie("search5", recent);
                    newcookie.setMaxAge(60 * 60 * 24 * 7);
                    newcookie.setPath("/");
                    res.addCookie(newcookie);
                    System.out.println("쿠키생성3");
                }
            }
        }

        Cookie[] cookies2= req.getCookies();
        for (Cookie cookie : cookies2) {
            log.info("cookiename={}",cookie.getName()+"/"+cookie.getValue());
        }

        //검색어 테이블에 저장
        int insertSearch = productDao.insertSearch(recent.trim());

        if(insertSearch!=0){
            log.info("검색어 테이블 insert 성공");
        }else{
            log.info("검색어 테이블 insert 실패");
        }

        //검색페이지
        List<Integer> contNoForSearch = productDao.getContNoForSearch(recent.trim());
        log.info("cont={}",contNoForSearch);
        if(contNoForSearch.size()!=0){
            List<ProductDTO> contList = productDao.getContList(contNoForSearch);
            model.addAttribute("list",contList);
            log.info("list={}",contList);
        }

        return "product/search";
    }

    //인기검색어
    @GetMapping("/search/hotSearch")
    @ResponseBody
    public List<String> showHotSearch(){
        List<String> strings = productDao.showHotSearch();
        log.info("hotSearch={}",strings);
        return strings;
    }



}
