package com.habit.host2.controller;

import com.habit.host2.entity.HostInfoDTO;
import com.habit.host2.entity.NewHostDTO;
import com.habit.host2.service.HostService2;
import com.habit.host2.service.HostServiceImpl2;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;


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
        if(dto.getHostPhone1()==""){
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
}
