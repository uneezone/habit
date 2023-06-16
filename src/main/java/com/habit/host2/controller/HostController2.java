package com.habit.host2.controller;

import com.habit.host2.entity.HostEditDTO;
import com.habit.host2.entity.HostInfoDTO;
import com.habit.host2.entity.NewHostDTO;
import com.habit.host2.entity.ProductDTO;
import com.habit.host2.service.HostService2;
import com.habit.host2.service.HostServiceImpl2;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequestMapping("/host")
@Slf4j
@RequiredArgsConstructor
@Controller
public class HostController2 {


    private final HostServiceImpl2 hostService;


    //호스트 홈으로
    @GetMapping("")
    public String showHostPage(@SessionAttribute(name = "userId",required = false)String userIds, Model model){

        String userId="user-3";
        //host인지 확인
        String userGrade = hostService.checkHost(userId);
        if(userGrade.equals("H")){
            model.addAttribute("hostId",userId);
            return "host/host_home";
        }

        return "host/host_newhost";
    }

    //호스트 가입
    @PostMapping("newHost")
    public String joinHost(@ModelAttribute NewHostDTO dto
                            , @SessionAttribute(name = "userId",required = false)String userIds, Model model
                            , @RequestParam MultipartFile Img
                            , HttpServletRequest req){


        //로그인세션 확인
        /*if(userId==null){
            return "member/login";
        }*/

        //임시
        String userId="user-3";

        //임시 host인지 확인
        String userGrade = hostService.checkHost(userId);
        System.out.println("userGrade = " + userGrade);
        if(userGrade.equals("H")){
            model.addAttribute("hostId",userId);
            return "host/host_home";
        }

        //전환번호
        String phoneNumber="";
        System.out.println(dto.getHostPhone1()+"/"+dto.getHostPhone2());
        if(dto.getHostPhone1()==null||dto.getHostPhone1().isEmpty()){
            phoneNumber = hostService.getPhoneNumber(userId);
            log.info("phoneNum={}",phoneNumber);
        }else{
            phoneNumber=dto.getHostPhone1()+"-"+dto.getHostPhone2()+"-"+dto.getHostPhone3();
        }
        dto.setHostPhone1(phoneNumber);

        //이메일
        String email=dto.getHostEmail1()+"@"+dto.getHostEmail2();
        dto.setHostEmail1(email);

        //프로필이미지 default
        if(Img == null || Img.isEmpty()){
            dto.setHostImg("defaulthostPro.png");
        }else{
            String filename=Img.getOriginalFilename();
            dto.setHostImg(filename);
            long filesize=Img.getSize();
            try {
                ServletContext application=req.getSession().getServletContext();
                String path=application.getRealPath("/storage");  //실제 물리적인 경로
                Img.transferTo(new File(path + "\\" + filename)); //파일저장

            }catch (Exception e) {
                e.printStackTrace(); //System.out.println(e);
            }
        }

        //host 아이디
        dto.setHostId(userId);

        log.info("newHostDTO={}",dto);
        hostService.newHostPro(dto,userId);
        model.addAttribute("hostId",dto.getHostId());

        return "host/host_home";
    }

    //프로필/정산정보 관리
    @GetMapping("/info")                             //나중에 true로 바꿔야함
    public String info(@SessionAttribute(name = "userId",required = false)String userIds, Model model){

        //임시
        String userId="user-3";

        //호스트 정보 가져오기
        HostInfoDTO hostInfoDTO = hostService.getHostInfo(userId);
        log.info("hostInfo={}",hostInfoDTO);
        model.addAttribute("hostInfo",hostInfoDTO);

        return "host/host_information";
    }

    @PostMapping("/info")                                                       //나중에 true로 바꿔야함
    public String modifyInfo(@SessionAttribute(name = "userId",required = false)String userIds,@RequestParam MultipartFile Img, @ModelAttribute HostEditDTO dto,HttpServletRequest req){
        if(!(Img == null || Img.isEmpty())){

            String filename=Img.getOriginalFilename();
            log.info("filename={}",filename);
            long filesize=Img.getSize();
            dto.setHost_img(filename);

            try {
                ServletContext application=req.getSession().getServletContext();
                String path=application.getRealPath("/storage");  //실제 물리적인 경로
                Img.transferTo(new File(path + "\\" + filename)); //파일저장

            }catch (Exception e) {
                e.printStackTrace(); //System.out.println(e);
            }
        }

        //이메일 합치기
        String email= dto.getHost_email1()+"@"+dto.getHost_email2();
        dto.setHost_email1(email);

        //전화번호 합치기
        String phone=dto.getHost_phone1()+"-"+dto.getHost_phone2()+"-"+dto.getHost_phone3();
        dto.setHost_phone1(phone);


        //임시 Id
        String userId="user-3";
        dto.setHost_id(userId);

        //db에 수정사항 저장
        hostService.editHostInfo(dto);
        log.info("hostEdit={}",dto);
        return "redirect:";
    }

    //판매관리
    @GetMapping("/product")
    public String showProduct(@SessionAttribute(name = "userId",required = false)String userIds,Model model){
        //임시 Id
        String userId="user-2";

        //판매및 환불 상품 가져와
        List<ProductDTO> products = hostService.getProduct(userId);
        log.info("products={}",products);

        model.addAttribute("products",products);
        model.addAttribute("host_id",userId);
        return "host/habit_product_control";
    }

    //예약
    @GetMapping("/reserve")
    public String showReserve(@SessionAttribute(name = "userId",required = false)String userIds){
        //임시 Id
        String userId="user-3";
        return "host/habit_reservation_control";
    }

    //판매관리에서 상태 변경 ajax
    @PostMapping("/status")
    @ResponseBody
    public String changeStatus(@RequestParam(value = "payd_no") Long payd_no, @RequestParam(value = "status")String status){
        log.info("payd_no={}",payd_no);
        log.info("status={}",status);

        if(status.equals("Y")){
            //주문상세테이블 변경
            hostService.updatePaydStatus(payd_no,status);
            return "ROK";  //사용완료
            
        }else if(status.equals("C")){
            //주문상세테이블 변경
            hostService.updatePaydStatus(payd_no,status);

            //환불테이블 insert
            //주문서번호 기준으로 RO 혹은 NRO 있으면 에너지 환불 X

            //주문상세번호로 주문서번호 알아오기
            String payNo = hostService.getPayNo(payd_no);

            //주문서번호 기준으로 RO혹은 NRO가 있는지 확인
            Long refnCount = hostService.getRefnCount(payNo);

            //주문서번호로 결제수단 가져오기(해당 결제수단으로 환불해주기 위해서)
            String payMethod = hostService.getPayMethod(payNo);
            log.info("결제수단={}",payMethod);
            
            if(refnCount>=1){
                //에너지 환붍 X
                //주문상세번호 해당 제품의 금액과 수량,상품코드,유저아이디
                Map<String, Object> info = hostService.getInfoByPaydNo(payd_no);
                log.info("info={}",info.toString());

                //환불금액 계산
                int refundPrice=(Integer)info.get("payd_qty")*(Integer)info.get("payd_price");

                //환불테이블에 insert할 값들 모으기
                Map<String, Object> params = new HashMap<>();
                params.put("payd_no",payd_no);
                params.put("user_id",info.get("user_id"));
                params.put("pro_no",info.get("pro_no"));
                params.put("pay_qty",info.get("payd_qty"));
                params.put("refund_price",refundPrice);
                params.put("pay_method",payMethod);

                //환불테이블에 insert 하기
                hostService.insertRefund(params);
                log.info("환불테이블 insert 성공");

            }else{
                //에너지 환불 O
            }
            
            return "COK"; //취소완료
        }
        return "COK"; //취소완료
    }
}
