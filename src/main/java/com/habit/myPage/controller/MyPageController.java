package com.habit.myPage.controller;

import com.habit.myPage.DTO.*;
import com.habit.myPage.service.MyPageServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
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
    //private String userId="user-1";

    @GetMapping("")
    public String showMyPage(@SessionAttribute(name = "s_id",required = false)String userId, Model model){

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
    public String showMyPageEdit(@SessionAttribute(name = "s_id",required = false)String userId, Model model){
        //유저 수정할 수 있는 칼럼들 가져오기
        UserInfoDTO userInfo = myPageService.getUserInfo(userId);

        model.addAttribute("userInfo",userInfo);
        return "member/mypageEdit";
    }

    @PostMapping("/myedit")
    public String editMyPageEdit(@SessionAttribute(name = "s_id",required = false)String userId
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
                img.transferTo(new File(path, filename)); //파일저장

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
        log.info("userinfoUPdate={}",userInfoDTO);

        String status = myPageService.updateUserInfo(userInfoDTO);

        if(status.equals("NOK")){
            log.info("유저정보수정실패 확인 바람");
        }

        return "redirect:/mypage/myedit";

    }

    //ajax 비밀번호 체크
    @GetMapping("/checkpw")
    @ResponseBody
    public String checkPw(@SessionAttribute(name = "s_id",required = false)String userId,@RequestParam("pw")String pw){
        pw=pw.trim();
        String status= myPageService.getPass(userId, pw);

        return status;
    }

    @PostMapping("/changepw")
    @ResponseBody
    public Map<String,String> changepw(@SessionAttribute(name = "s_id",required = false)String userId,@RequestParam("pw")String pw){

        pw=pw.trim();
        String status = myPageService.updatePass(userId, pw);
        Map<String,String> params= new HashMap<>();
        params.put("status",status);
        params.put("pw",pw);

        return params;
    }

    @GetMapping("/order")
    public String showOrderList(@SessionAttribute(name = "s_id",required = false)String userId, Model model){
        List<Map<String, Object>> orderList = myPageService.getOrderList(userId);
        model.addAttribute("payList",orderList);
        return "order/order";
    }

    @GetMapping("/order/detail")
    @ResponseBody
    public List<OrderAllDTO> showOrderAll(@RequestParam(value = "pay_no") String pay_no){
        List<OrderAllDTO> payDForOrder = myPageService.getPayDForOrder(pay_no);
        log.info("payDForOrder={}",payDForOrder);
        return payDForOrder;
    }

    @GetMapping("/orderdetail")
    public String showOrderDetail(@RequestParam(value = "payno") String payno,Model model){

        log.info("payno={}",payno);
        //주문내역에서 구매수량,결제 날짜
        Map<String, Object> payForOrderDetail = myPageService.getPayForOrderDetail(payno);

        //주문상세내역과 상품테이블에서 필요한거 GET
        List<OrderDetailDTO> payDForOrderDetail = myPageService.getPayDForOrderDetail(payno);

        //환불확인
        List<OrderRefnDTO> refnForOrderDetail = myPageService.getRefnForOrderDetail(payDForOrderDetail);

        model.addAttribute("refn",refnForOrderDetail);
        model.addAttribute("bigOrder",payForOrderDetail);
        model.addAttribute("smallOrder",payDForOrderDetail);
        return "order/orderdetail";
    }


    @GetMapping("/review")
    public String showReview(@RequestParam(value = "paydNo")int payd_no,Model model){
        //리뷰작성했는지 확인
        log.info("payd_no={}",payd_no);

        ReviewWriteDTO review = myPageService.getReview(payd_no);

        model.addAttribute("reviewDTO",review);
        return "etc/reviewwrite";
    }

    @PostMapping("/review")
    public String insertReview(@SessionAttribute(name = "s_id",required = false)String userId,@ModelAttribute ReviewInsertDTO reviewInsertDTO,@RequestParam List<MultipartFile> review_imgs) throws IOException {
        //리뷰 수정인지 새로인지 확인

        //파ㅇ;ㄹ
        log.info("imgs={}",review_imgs.size());
        log.info("ReviewInsertDTO={}",reviewInsertDTO);
        reviewInsertDTO.setUser_id(userId);
        String reviewUpdateOrInsert = myPageService.updateOrInsertReview(reviewInsertDTO, review_imgs);

        //에너지 적립
        int insertEnergy=0;
        if(reviewUpdateOrInsert.contains("new")) {
            EnergyDTO energyDTO = new EnergyDTO();
            energyDTO.setEnergy_saveuse(500);
            energyDTO.setEnergy_sources("[리뷰]적립");
            energyDTO.setUser_id(userId);

            insertEnergy = myPageService.insertEnergy(energyDTO);
        }

        if(reviewUpdateOrInsert!=""&& insertEnergy!=0){
            log.info("insertEnergy={}",insertEnergy);
            return "redirect:/products/reviews?cont_no="+reviewInsertDTO.getCont_no();
        }

        return "redirect:/products/reviews?cont_no="+reviewInsertDTO.getCont_no();
    }

    @GetMapping("/refund")
    public String showRefund(@RequestParam(value = "paydNo")int paydNo, Model model){
        log.info("paydNO={}",paydNo);
        RefundInfoDTO forRefund = myPageService.getForRefund(paydNo);
        log.info("refund={}",forRefund);
        model.addAttribute("refundInfo",forRefund);
        return "order/refund";
    }

    @PostMapping("/refund")
    public String InsertRefund(@ModelAttribute RefundInsertDTO dto, @SessionAttribute(name = "s_id",required = false)String userId, RedirectAttributes redirectAttributes){
        log.info("refundInsert={}",dto);
        String status = myPageService.insertRefund(dto, userId);

        log.info("refn_status={}",status);

        redirectAttributes.addAttribute("payd_no",Integer.parseInt(dto.getPayd_no()));
        return "redirect:/mypage/refundfinish";
    }

    @GetMapping("/refundfinish")
    public String showRefundFinish(@RequestParam("payd_no")int payd_no,Model model){
        log.info("payd_no={}",payd_no);

        RefundResultDTO resultRefund = myPageService.getResultRefund(payd_no);
        model.addAttribute("result",resultRefund);
        return "order/refundfinish";
    }

}
