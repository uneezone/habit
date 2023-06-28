package com.habit.member;

import com.habit.host1.DTO.RequestFindPasswordDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.mail.javamail.JavaMailSender;

import javax.servlet.ServletContext;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;


@Controller
@Slf4j
public class MemberCont {

    @Autowired
    MemberDAO memberdao;
    @Autowired
    JavaMailSender javaMailSender;


    public MemberCont() {
        System.out.println("-----MemberCont() 생성");
    }

    //회원가입
    @RequestMapping("/newMember")
    public ModelAndView newMember() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("member/newMember");
        return mav;
    }//member() end


    @RequestMapping("/welcome.do")
    public String welcome(@RequestParam Map<String, Object> map, @RequestParam MultipartFile user_img,HttpServletRequest req) {

        System.out.println(map.get("user_id"));
        System.out.println(map.get("user_pw"));
        System.out.println(map.get("user_name"));
        System.out.println(map.get("user_email"));
        System.out.println(map.get("user_email2"));
        System.out.println(map.get("user_phone"));
        System.out.println(map.get("user_phone2"));
        System.out.println(map.get("user_phone3"));
        System.out.println(map.get("user_birth"));
        System.out.println(map.get("user_gender"));

        //프로필이미지 storage 저장방식
        String pro_img="defaultPro.png";
        if (user_img != null && !user_img.isEmpty()) {

            SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
            Date now = new Date();
            String nowTime = sdf1.format(now);

            String filename = user_img.getOriginalFilename();
            int findIndex = filename.lastIndexOf(".");
            String extension = filename.substring(findIndex + 1, filename.length());
            filename=filename.substring(0,findIndex);
            filename = "U" + filename + nowTime+"."+extension;
            long filesize = user_img.getSize();
            pro_img=filename;
            try {
                ServletContext application = req.getSession().getServletContext();
                String path = application.getRealPath("/storage");  //실제 물리적인 경로
                user_img.transferTo(new File(path + "\\" + filename)); //파일저장

            } catch (Exception e) {
                e.printStackTrace(); //System.out.println(e);

            }

        }
        map.put("user_img",pro_img);

        String user_email = map.get("user_email") + "@" + map.get("user_email2");
        map.put("user_email", user_email);

        String user_phone = map.get("user_phone") + "-" + map.get("user_phone2") + "-" + map.get("user_phone3");
        map.put("user_phone", user_phone);

        memberdao.insert(map);

        //회원가입 에너지 적립
        int energyStatus = memberdao.inserEnery(String.valueOf(map.get("user_id")));
        if(energyStatus!=0){
            log.info("회원가입 에너지 적립 성공");
        }else {
            log.info("회원가입 에너지 적립 실패");

        }


        return "redirect:/login";
    }

    //아이디 중복확인
    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(@RequestParam String id) {
        int cnt = memberdao.idCheck(id);
        return cnt;
    }

    //로그인
    @GetMapping("/login")
    public String login(@RequestParam(value = "redirectURL",required = false) String redirectURL, Model model) {
        model.addAttribute("redirectURL",redirectURL);
        return "member/login";
    }
    @PostMapping("/login")
    public String login(MemberDTO dto, HttpSession session, HttpServletRequest req,@RequestParam(value = "redirectURL",defaultValue = "/") String redirectURL) {
        // 회원 정보 조회
        MemberDTO member = memberdao.login(dto);

        String user_id=req.getParameter("user_id");
        String user_pw=req.getParameter("user_pw");



//        System.out.println(dto.getUser_id());
        //로그인 성공 여부 확인
        // 로그인 성공 여부 확인
        if(member != null) {
            String user_name=member.getUser_name();
            // 세션에 정보를 저장
            session.setAttribute("s_id", user_id); // 아이디
            session.setAttribute("s_name", user_name); // 닉네임

            System.out.println("redirectURL="+redirectURL);
            return "redirect:"+redirectURL;
        } else {
            req.setAttribute("redirectURL",redirectURL);
            req.setAttribute("error", "아이디 또는 비밀번호를 다시 입력해주세요.");
            return "member/login";
        }
    }
    @GetMapping("/logout.do")
    public String logout(HttpServletRequest req) {
        // 현재 세션을 무효화하여 모든 세션 정보를 삭제

        HttpSession session = req.getSession();

        session.invalidate();

        // 로그인 페이지로 리다이렉트
        return "redirect:login";

    }

    //아이디,비번 찾기
    @GetMapping("/findMember")
    public String findId() {
        return "member/findMember";
    }

    //아이디 찾기
    @PostMapping("/findid/result")
    public String findIdResult(@RequestParam String user_email, Model model) {

        // 회원 정보를 조회
        MemberDTO memberDTO = memberdao.findId(user_email);
        ModelAndView mav = new ModelAndView();

        model.addAttribute("user_id", memberDTO.getUser_id());
        return "member/resultFindId";
    }

    //비밀번호찾기
    @PostMapping("/findpw")
    public String resultFindPw(String user_email, Model model) {
        // 회원 정보를 조회
        MemberDTO memberDTO = memberdao.findId(user_email);
        if (memberDTO == null) {
            return "member/resultFindId";
        } else {
            model.addAttribute("user_email", user_email);
            model.addAttribute("user_phone", memberDTO.getUser_phone());
            return "member/findPassword";
        }
    }

    @PostMapping("/findpw/result")
    @ResponseBody
    public int findPasswordResult (RequestFindPasswordDTO reqFindPWDTO) throws MessagingException {

        int result = 0;

        if (reqFindPWDTO.getMethodOfFine().equals("user_email")) {
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage);

            //수신대상추가
            String email = reqFindPWDTO.getMethodValue();

            //수신자 설정
            helper.setTo(email);

            //메일 제목
            helper.setSubject("[habit] 임시 비밀번호 발급");

            //랜덤 임시비밀번호 발급 (숫자(0-9), 문자(a-z, A-Z))
            String newPw = "";
            boolean run = true;
            while (run) {
                int num = (int)((Math.random() * 124));
                if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
                    newPw += String.valueOf((char) num);
                }
                if (newPw.length() == 10) {
                    run = false;
                }
            }

            //임시 비밀번호 해당 user 비밀번호 update
            reqFindPWDTO.setNewPassword(newPw);
            result = memberdao.updatePW(reqFindPWDTO);

            if (result == 1) {
                MemberDTO memberDTO = memberdao.findId(email);
                String user_id = memberDTO.getUser_id();
                //메일 내용
                String htmlMessage = new StringBuffer()
                        .append("<p style='text-align: center'>안녕하세요. <strong>" + user_id + "</strong>님!</p>")
                        .append("<p style='text-align: center'><strong>" + user_id + "</strong> 님의 임시 비밀번호 10자리는 아래와 같습니다.</p>")
                        .append("<p style='text-align: center'>habit 로그인 후 비밀번호를 변경하시기 바랍니다.</p>")
                        .append("<p style='text-align: center'>임시 비밀번호 : <strong>" + newPw + "</strong></p>")
                        .toString();
                helper.setText(htmlMessage, true);
                //메일 발송
                javaMailSender.send(mimeMessage);
            }
        } else if (reqFindPWDTO.getMethodOfFine().equals("user_phone")) {
        }
        return result;
    }













}





















