package com.habit.host1.controller;

import com.habit.host1.service.HostService1;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostContorller1 {

    private final HostService1 hostService1;

    // [habit_create.jsp]
    // 컨텐츠 생성 폼으로 이동 & 대분류 list 불러오기
    @GetMapping("/contentform")
    public String contentForm(Model model) {
        model.addAttribute("List", hostService1.cateList());
        return "host/habit_create";
    }

    // 대분류 선택에 따른 중분류 list 불러오기
    @GetMapping("/cate_middle.do")
    @ResponseBody
    public List<Map<String, Object>> selectCate(HttpServletRequest request) {
        String cate_large = request.getParameter("cate_large");
        return hostService1.selectCate(cate_large);
    }

    // 생성된 컨텐츠 값 insert
    @PostMapping("/contentinsert")
    public String contentInsert(
            @SessionAttribute(name = "userId", required = false) String userIdd,
            @RequestParam Map<String, Object> map,
            @RequestParam List<String> cont_hashtag2,
            @RequestParam List<String> cont_hashtag4,
            @RequestParam List<String> prod_name,
            @RequestParam List<String> prod_qty,
            @RequestParam List<String> prod_price,
            @RequestParam List<String> one_date,
            @RequestParam List<String> one_maxqty,
            @RequestParam List<String> one_price,
            @RequestParam List<MultipartFile> cont_img
    ) throws IOException {
        System.out.println("map = " + map);
        String userId = "user-1"; //임시 세션 아이디
        map.put("host_id", userId);
        if (cont_hashtag2.size() != 0) {
            map.put("cont_hashtag2", cont_hashtag2);
        }
        if (cont_hashtag4.size() != 0) {
            map.put("cont_hashtag4", cont_hashtag4);
        }
        map.put("prod_name", prod_name);
        map.put("prod_qty", prod_qty);
        map.put("prod_price", prod_price);
        map.put("one_date", one_date);
        map.put("one_maxqty", one_maxqty);
        map.put("one_price", one_price);
        map.put("cont_img", cont_img);

        int result = hostService1.contentInsert(map);
        return "host/habit_list";
    }

    //[habit_review_control.jsp]
    @GetMapping("/review")
    public String reviewControl(@SessionAttribute(name = "userId", required = false) String userIdd) {
        return "host/habit_review_control";
    }

    @PostMapping("/review.do")
    @ResponseBody
    public List<Map<String, Object>> reviewSearch(@SessionAttribute(name = "userId", required = false) String userIdd, @RequestBody Map<String, Object> map) {
        //임시 세션 아이디
        Map<String, Object> map1 = new HashMap<>();
        String user_id = "user-1";
        map1.put("user_id", user_id);

        List<Integer> starScore = (List<Integer>) map.get("starScore");

        map1.put("reviewContKeyword", map.get("reviewContKeyword"));
        map1.put("searchUserId", map.get("searchUserId"));
        map1.put("starScore", starScore);

        System.out.println(map1.get("starScore"));

        System.out.println(hostService1.reviewList(map1));
        return hostService1.reviewList(map1);
    }
}
