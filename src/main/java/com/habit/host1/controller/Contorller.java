package com.habit.host1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/host")
public class Contorller {

    @GetMapping("/content")
    public String contentCreateForm() {
        return "host/habit_create";
    }
}
