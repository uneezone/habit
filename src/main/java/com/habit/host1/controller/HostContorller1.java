package com.habit.host1.controller;

import com.habit.host1.service.HostService1;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostContorller1 {

    private final HostService1 hostService1;

    // 컨텐츠 생성 폼으로 이동 & 대분류 list 불러오기
    @GetMapping("/contentform")
    public String contentForm(Model model) {
        model.addAttribute("List",hostService1.cateList());
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

    ) {
        System.out.println(map);
        System.out.println("cont_hashtag2 = " + cont_hashtag2);
        System.out.println("cont_hashtag4 = " + cont_hashtag4);
        System.out.println("prod_name = " + prod_name);
        System.out.println("prod_qty = " + prod_qty);
        System.out.println("prod_price = " + prod_price);
        System.out.println("one_date = " + one_date);
        System.out.println("one_maxqty = " + one_maxqty);
        System.out.println("one_price = " + one_price);
        System.out.println("cont_img = " + cont_img);
//        hostService1.contentInsert(userId, map);
        return "host/habit_list";
    }
}
