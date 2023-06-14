package com.habit.host1.controller;

import com.habit.host1.service.Service;
import com.habit.host1.service.SeviceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class Contorller {

    private final Service service;

    @GetMapping("/content")
    public String contentCreateForm() {
        return "host/habit_create";
    }
}
