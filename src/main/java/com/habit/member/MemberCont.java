package com.habit.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
    public String welcome(@RequestParam Map<String, Object> map) {

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


        String user_email = map.get("user_email") + "@" + map.get("user_email2");
        map.put("user_email", user_email);

        String user_phone = map.get("user_phone") + "-" + map.get("user_phone2") + "-" + map.get("user_phone3");
        map.put("user_phone", user_phone);

        memberdao.insert(map);

        return "redirect:/";
    }

    //로그인
    @GetMapping("/login")
    public String login() {
        return "member/login";
    }
    @PostMapping("/login")
    public String login(MemberDTO dto, HttpSession session, HttpServletRequest req) {
        // 회원 정보 조회
        MemberDTO member = memberdao.login(dto);

        String user_id=req.getParameter("user_id");
        String user_pw=req.getParameter("user_pw");
        String user_name=member.getUser_name();


//        System.out.println(dto.getUser_id());
        //로그인 성공 여부 확인
        // 로그인 성공 여부 확인
        if(member != null) {
            // 세션에 정보를 저장
            session.setAttribute("s_id", user_id);
            session.setAttribute("s_name", user_name);


            return "redirect:/";
        } else {
            req.setAttribute("error", "로그인 실패");
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





















