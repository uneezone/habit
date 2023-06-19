package com.habit.zzim;

import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zzim")
public class ZzimCont {

    public ZzimCont(){
        System.out.println("----ZzimCont() 객체생성됨");
    }

    @Autowired
    ZzimDAO zzimDAO;


    @RequestMapping("/list")
    public ModelAndView list(HttpSession session, HttpServletRequest req) {

        String user_id = "user-3";
        List<Map<String, Object>> zzimlist = new ArrayList<>(); // List<>는 인터페이스, ArrayList는 클래스.
        List<Map<String, Object>> zzimlist1 = zzimDAO.zzimlist_one(user_id);//찜한 원데이클래스 상품의 정보들
        List<Map<String, Object>> zzimlist2 = zzimDAO.zzimlist_two(user_id);//찜한 회차권인원권 상품의 정보들(가격 제외)
        List<Map<String, Integer>> zzimlist2_price = zzimDAO.min_prod_price(user_id);
        //System.out.println("zzimlist2"+zzimlist2.stream().toList());
        //System.out.println("가격"+zzimlist2_price.stream().toList());

        // 원데이 클래스 상품 정보들 잘 가져왔는지 확인
        for (Map<String, Object> stringObjectMap1 : zzimlist1) {
            //System.out.println(stringObjectMap1);
        }

        for (Map<String, Object> objectMap : zzimlist2) {
            for (Map<String, Integer> priceMap : zzimlist2_price) {
                if(objectMap.get("cont_no").equals(priceMap.get("cont_no"))){
                    int price=priceMap.get("min_price");
                    objectMap.put("price",price);
                }
            }
        }

        for (Map<String, Object> stringObjectMap : zzimlist2) {
            if(stringObjectMap.get("avg")==null){
                stringObjectMap.put("avg",0);
            }
            System.out.println("확인 stringObjectMap = " + stringObjectMap);
        }
/*
       int i=-1, j;

        // 회차권인원권 상품정보
        for (Map<String, Object> stringObjectMap2 : zzimlist2) {
            ++i;
            j=-1;
            //System.out.println(stringObjectMap2);
            for (Map<String, Integer> stringIntegerMap : zzimlist2_price) {
                ++j;
                //System.out.println(stringIntegerMap);
                if(i==j){
                    String price=zzimlist2_price.get(j).toString().substring(10);
                    stringObjectMap2.put("prod_price",Integer.parseInt(price.toString().substring(1, price.length()-1)));
                }
            }
            //System.out.println(stringObjectMap2);

        }

        //회차권인원권 가격정보
//        for (Map<String, Integer> stringIntegerMap : zzimlist2_price) {
//            System.out.println(stringIntegerMap);
//        }

//*/
//        for (Map<String, Object> map1: zzimlist1) {
//            //System.out.println(map1);
//            zzimlist.add(map1);
//        }
//
//        for (Map<String, Object> map2 : zzimlist2) {
//            //System.out.println(map2);
//            zzimlist.add(map2);
//        }

//        for (Map<String, Object> map : zzimlist) {
//            System.out.println(map);
//
//        }

        //System.out.println(zzimDAO.zzimlist_two("user-3"));



        ModelAndView mav=new ModelAndView();
        mav.setViewName("member/zzim");

        mav.addObject("zzimlist1", zzimDAO.zzimlist_one("user-3"));
        mav.addObject("zzimlist2", zzimlist2);
        //mav.addObject("zzimlist2_price", zzimDAO.min_prod_price("user-3"));

        return mav;

    }
}
