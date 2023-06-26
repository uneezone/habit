package com.habit.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;


@Controller
public class MemberCont {

    @Autowired
    MemberDAO memberdao;


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

        return "redirect:/login";
    }

    //아이디 중복확인
    @PostMapping("/idCheck")
    @ResponseBody
    public int idCheck(String id) {
        int cnt = memberdao.idCheck(id);
        System.out.println("아이디 중복확인"+cnt);
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
            session.setAttribute("s_id", user_id);
            session.setAttribute("s_name", user_name);

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
    //아이디찾기
    @GetMapping("/resultFindId")
    public String resultFindId() {
        return "member/resultFindId";
    }


    //아이디 찾기
    @PostMapping("/findId.do")
    public ModelAndView findId(@RequestParam Map<String, Object> map) {
        // 회원 정보를 조회합니다.
        System.out.println(map.get("user_email"));
        System.out.println(map.get("user_email2"));

        String user_email = map.get("user_email") + "@" + map.get("user_email2");
        map.put("user_email", user_email);

        String user_id=memberdao.findId(map);
        ModelAndView mav = new ModelAndView();

        mav.addObject("user_id", user_id);
        mav.setViewName("member/resultFindId");
//
        return mav;
    }

    //비밀번호찾기
    @GetMapping("/resultFind")
    public String resultFindPw() {

        return "member/resultFind";
    }













}





















