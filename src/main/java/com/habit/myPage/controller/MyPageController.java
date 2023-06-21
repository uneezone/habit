package com.habit.myPage.controller;

import com.habit.myPage.DTO.OrderAllDTO;
import com.habit.myPage.DTO.UserEditDTO;
import com.habit.myPage.DTO.UserInfoDTO;
import com.habit.myPage.service.MyPageServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mypage")
@RequiredArgsConstructor
@Slf4j
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

    @PostMapping("/myedit")
    public String editMyPageEdit(@SessionAttribute(name = "userId",required = false)String userIds
                                    , @ModelAttribute UserEditDTO dto, @RequestParam MultipartFile img, HttpServletRequest req) {

        //프로필이미지 storage 저장방식
        if (img != null && !img.isEmpty()) {

            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
            Date now = new Date();
            String nowTime = sdf1.format(now);

            String filename = img.getOriginalFilename();
            int findIndex = filename.lastIndexOf(".");
            String extension = filename.substring(findIndex + 1, filename.length());
            filename=filename.substring(0,findIndex);
            filename = "U" + filename + nowTime+"."+extension;
            log.info("filename={}",filename);
            dto.setUser_img(filename);
            long filesize = img.getSize();

            try {
                ServletContext application = req.getSession().getServletContext();
                String path = application.getRealPath("/storage");  //실제 물리적인 경로
                img.transferTo(new File(path + "\\" + filename)); //파일저장

            } catch (Exception e) {
                e.printStackTrace(); //System.out.println(e);

            }

        }

        //프로필수정 update
        UserInfoDTO userInfoDTO= new UserInfoDTO();
        userInfoDTO.setUser_name(dto.getUser_name());
        userInfoDTO.setUser_phone(dto.getUser_phone1()+"-"+dto.getUser_phone2()+"-"+ dto.getUser_phone3());
        userInfoDTO.setUser_email(dto.getUser_email1()+"@"+dto.getUser_email2());
        userInfoDTO.setUser_birth(dto.getUser_birth().replace("-",""));
        userInfoDTO.setUser_img(dto.getUser_img());
        userInfoDTO.setUser_id(userId);

        String status = myPageService.updateUserInfo(userInfoDTO);

        if(status.equals("NOK")){
            log.info("유저정보수정실패 확인 바람");
        }

        return "redirect:/mypage/myedit";

    }

    //ajax 비밀번호 체크
    @GetMapping("/checkpw")
    @ResponseBody
    public String checkPw(@SessionAttribute(name = "userId",required = false)String userIds,@RequestParam("pw")String pw){
        pw=pw.trim();
        String status= myPageService.getPass(userId, pw);

        return status;
    }

    @PostMapping("/changepw")
    @ResponseBody
    public Map<String,String> changepw(@SessionAttribute(name = "userId",required = false)String userIds,@RequestParam("pw")String pw){

        pw=pw.trim();
        String status = myPageService.updatePass(userId, pw);
        Map<String,String> params= new HashMap<>();
        params.put("status",status);
        params.put("pw",pw);

        return params;
    }

    @GetMapping("/order")
    public String showOrderList(@SessionAttribute(name = "userId",required = false)String userIds, Model model){
        List<Map<String, Object>> orderList = myPageService.getOrderList(userId);
        model.addAttribute("payList",orderList);
        return "order/order";
    }

    @GetMapping("/order/detail")
    @ResponseBody
    public List<OrderAllDTO> showOrderAll(@RequestParam(value = "pay_no") String pay_no){
        List<OrderAllDTO> payDForOrder = myPageService.getPayDForOrder(pay_no);

        return payDForOrder;
    }

    @GetMapping("/orderdetail")
    public String showOrderDetail(@RequestParam(value = "payno") String payno,Model model){

        log.info("payno={}",payno);


        return "order/orderdetail";
    }

    @GetMapping("/refund")
    public String showRefund(@RequestParam(value = "paydNo")int paydNo){
        log.info("paydNO={}",paydNo);
        return "order/refund";
    }

    @GetMapping("/refundfinish")
    public String showRefundFinish(){
        return "order/refundfinish";
    }

    @GetMapping("/review")
    public String showReview(@RequestParam(value = "contNo")int cont_no){
        log.info("contNo={}",cont_no);
        return "etc/reviewwrite";
    }

}
