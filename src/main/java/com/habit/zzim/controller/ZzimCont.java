package com.habit.zzim.controller;

import com.habit.zzim.model.ZzimDAO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*@Controller
@RequestMapping("/zzim")
@Slf4j*/
public class ZzimCont {


/*    //@Autowired
    ZzimDAO zzimDAO;

    private String user_id="user-3";

    @RequestMapping("/list")
    public ModelAndView list(HttpSession session, HttpServletRequest req) {

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


        ModelAndView mav=new ModelAndView();
        mav.setViewName("member/zzim");

        mav.addObject("zzimlist1", zzimDAO.zzimlist_one("user-3"));
        mav.addObject("zzimlist2", zzimlist2);
        //mav.addObject("zzimlist2_price", zzimDAO.min_prod_price("user-3"));

        return mav;

    }

    @PostMapping("/insert")
    @ResponseBody
    public String zzimInsert(@RequestParam(value = "cont_no") int cont_no){
        String user_id="user-3";
        Map<String,Object > zzimInsertInfo= new HashMap<>();
        zzimInsertInfo.put("user_id",user_id);
        zzimInsertInfo.put("cont_no",cont_no);

        zzimDAO.zzimInsert(zzimInsertInfo);
        //log.info("cont_no={}",cont_no);

        return "OK";

    }*/



}
