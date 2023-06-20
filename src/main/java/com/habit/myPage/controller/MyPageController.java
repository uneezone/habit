package com.habit.myPage.controller;

import com.habit.myPage.DTO.UserInfoDTO;
import com.habit.myPage.service.MyPageServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
public class MyPageController {

    private final MyPageServiceImpl myPageService;

    //임시 아이디
    private String userId="user-1";

    @GetMapping("")
    public String showMyPage(@SessionAttribute(name = "userId",required = false)String userIds, Model model){

        //임시아이디
        if(userId==null || userId ==""){
            return "member/login";
        }

        //임시아이디

        //유저이름이랑 이미지 가져오기
        Map<String, Object> userNameAndImg = myPageService.getUserNameAndImg(userId);

        //에너지랑 후기 갯수 가져오기
        Map<String, Object> myEnergyAndReview = myPageService.getMyEnergyAndReview(userId);


        model.addAttribute("nameImg",userNameAndImg);
        model.addAttribute("myInfo",myEnergyAndReview);
        return "member/mypage";
    }

    @GetMapping("/myedit")
    public String showMyPageEdit(@SessionAttribute(name = "userId",required = false)String userIds, Model model){
        //유저 수정할 수 있는 칼럼들 가져오기
        UserInfoDTO userInfo = myPageService.getUserInfo(userId);

        model.addAttribute("userInfo",userInfo);
        return "member/mypageEdit";
    }

    //ajax 비밀번호 체크
    @GetMapping("/checkpw")
    @ResponseBody
    public String checkPw(@SessionAttribute(name = "userId",required = false)String userIds,@RequestParam("pw")String pw){

        String status= myPageService.getPass(userId, pw);

        return status;
    }

    @GetMapping("/order")
    public String showOrderList(){
        return "order/order";
    }

    @GetMapping("/orderdetail")
    public String showOrderDetail(){
        return "order/orderdetail";
    }

    @GetMapping("/refund")
    public String showRefund(){
        return "order/refund";
    }

    @GetMapping("/refundfinish")
    public String showRefundFinish(){
        return "order/refundfinish";
    }

    @GetMapping("review")
    public String showReview(){
        return "etc/reviewwrite";
    }

}
