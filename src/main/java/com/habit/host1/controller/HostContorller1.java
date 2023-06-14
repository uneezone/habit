package com.habit.host1.controller;

import com.habit.host1.entity.ContentDTO;
import com.habit.host1.service.HostService1;
import com.habit.host2.service.HostService2;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostContorller1 {

    private final HostService1 hostService1;

    // 컨텐츠 생성 폼으로 이동
    @GetMapping("/contentform")
    public String contentForm() {
        return "host/habit_create";
    }

    // 생성된 컨텐츠 값 insert
    @PostMapping("/contentinsert")
    public String contentInsert(Model model, @SessionAttribute(name = "userId")String userId, @ModelAttribute ContentDTO dto) {

        model.addAttribute("hostId",userId);
        model.addAttribute("ContentDTO", dto);
        hostService1.contentInsert(model);
        return "";
    }
}
