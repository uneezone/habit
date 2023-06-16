package com.habit.zzim;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zzim")
public class ZzimCont {

    public ZzimCont() {
        System.out.println("----ZzimCont() 객체 생성됨");
    }

    @Autowired
    ZzimDAO zzimDao;

    @RequestMapping("/list") //@RequestParam MultipartFile cont_img
    public ModelAndView list(HttpSession session, HttpServletRequest req){
        //@ModelAttribute ZzimDTO dto(요거 필요없음. 없어도 값 받아져있음)
        // @RequestParam Map<String, Object> map(요것도 필요없음. 값 잘 받아져있음)

        String user_id;
        user_id="user-3";
        //test
        List<Map<String, Object>> zzimlist = zzimDao.zzimlist(user_id);

        for (Map<String, Object> stringObjectMap : zzimlist) {
            System.out.println(stringObjectMap);
        }
        //test용 출력문
        /*
        for (Map<String, Object> stringObjectMap : zzimlist) {
            System.out.println("stringObjectMap = " + stringObjectMap);
            System.out.println("id"+stringObjectMap.get("user_id"));
            if(user_id.equals(stringObjectMap.get("user_id"))){
                real.add(stringObjectMap);
            }
        }
        */
        //System.out.println("real="+real.stream().toList());
        //zzimlist에 찜리스트 정보 몽땅 들어있음.
        /*
        HashMap<String, Object> map2=new HashMap<>();
        map2.put("user_id", user_id);
        map2.put("zzimlist", zzimDao.zzimlist());
*/
        /*for (String s : map2.keySet()) {
            System.out.println(s);
        }*/

        //System.out.println(map2.get("user_id"));
        //System.out.println(map2.get("zzimlist"));



        ModelAndView mav=new ModelAndView();
        mav.setViewName("member/zzim");
        mav.addObject("zzim", zzimlist);

        return mav;
    }

<<<<<<< HEAD
=======
//    public ZzimCont() {
//        System.out.println("----CartCont() 객체 생성됨");
//    }
//
//    @Autowired
//    ZzimDAO zzimDAO;
//
//    @RequestMapping("/list")
//    public ModelAndView list(HttpSession session, HttpServletRequest req){
//        String id="test";
//
//    }

>>>>>>> 3573ff8efb8dc57a7dbdc5af2e9d3a561e70d9da


}
