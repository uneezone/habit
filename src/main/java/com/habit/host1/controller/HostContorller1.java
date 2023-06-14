package com.habit.host1.controller;

import com.habit.host1.service.HostService1;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostContorller1 {

    private final HostService1 hostService1;

    // 컨텐츠 생성 폼으로 이동
    @GetMapping("/contentform")
    public String contentForm(Model model) {
        model.addAttribute("List",hostService1.cateList());
        return "host/habit_create";
    }

    // 대분류 선택에 따른 중분류 list
    @GetMapping("/cate_middle.do")
    @ResponseBody
    public List<Map<String, Object>> selectCate(HttpServletRequest request) {
        String cate_large = request.getParameter("cate_large");
        System.out.println(cate_large);
        return hostService1.selectCate(cate_large);
    }

    // 생성된 컨텐츠 값 insert
    @PostMapping("/contentinsert")
    public String contentInsert(@SessionAttribute(name = "userId")String userId, @RequestParam Map<String, Object> map) {
        hostService1.contentInsert(userId, map);
        return "host/habit_list";
    }
}
