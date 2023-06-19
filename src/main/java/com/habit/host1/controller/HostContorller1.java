package com.habit.host1.controller;

//import com.habit.host1.DTO.RequestContentInsertDTO;
//import com.habit.host1.DTO.RequestReviewDTO;
//import com.habit.host1.DTO.ResponseReviewDTO;
import com.habit.host1.DTO.RequestContentInsertDTO;
import com.habit.host1.DTO.RequestReviewDTO;
import com.habit.host1.DTO.ResponseReviewDTO;
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
    public String contentInsert(@SessionAttribute(name = "userId", required = false) String userIdd, RequestContentInsertDTO rciDTO) throws IOException {
        String userId = "user-1"; //임시 세션 아이디
        rciDTO.setHost_id(userId);
        int result = hostService1.contentInsert(rciDTO);
        return "host/habit_list";
    }

    // [habit_review_control.jsp]
    @GetMapping("/review")
    public String reviewControl(@SessionAttribute(name = "userId", required = false) String userIdd) {
        return "host/habit_review_control";
    }

    @PostMapping("/review.do")
    @ResponseBody
    public List<ResponseReviewDTO> reviewSearch(@SessionAttribute(name = "userId", required = false) String userIdd, RequestReviewDTO reqReviewDTO) {
        //임시 세션 아이디
        String user_id = "user-1";
        reqReviewDTO.setHost_id(user_id);
        System.out.println("reqReviewDTO = " + reqReviewDTO);
        System.out.println(hostService1.reviewList(reqReviewDTO));
        return hostService1.reviewList(reqReviewDTO);
    }

    @GetMapping("/reviewPaging/{page}")
    @ResponseBody
    public List<ResponseReviewDTO> reviewPaging(@SessionAttribute(name = "userId", required = false) String userIdd, @PathVariable int page) {
        String user_id = "user-1";
        return null;
    }

    // [habit_inquiry_control.jsp]
    @GetMapping("/inquiry")
    public String inquiryControl() {
        return "host/habit_inquiry_control";
    }
}
