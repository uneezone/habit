package com.habit.host1.service;

import com.habit.host1.entity.ContentDTO;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

public interface HostService1 {
    void contentInsert (String userId, ContentDTO dto);
}
