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
    public String login(MemberDTO dto, HttpSession session, HttpServletRequest req,@RequestParam(defaultValue = "/")String redirectURL) {
        // 회원 정보 조회
        MemberDTO member = memberdao.login(dto);
        //로그인 성공 여부 확인
        if (member != null) {
            //세션에 정보를 저장
            session.setAttribute("member", member);
            return "redirect:"+redirectURL;
        } else {
            req.setAttribute("error", "로그인 실패");
            return "member/login";
        }
    }


    @GetMapping("/findMember")
    public String findId() {
        return "member/findMember";
    }
    @GetMapping("/resultFindId")
    public String resultFindId() {
        return "member/resultFindId";
    }
    @GetMapping("/resultFind")
    public String resultFindPw() {
        return "member/resultFind";
    }

    //아이디 찾기
    @PostMapping("/findid.do")
    public String findId(@RequestParam Map<String, Object> map) {
        // 회원 정보를 조회합니다.
        System.out.println(map.get("user_email"));
        System.out.println(map.get("user_email2"));

//        MemberDTO member = memberdao.findId(dto);
//        System.out.println("dto = " + dto.getUser_id());
//        ModelAndView mav = new ModelAndView();

        // 회원 정보를 찾았으면 아이디를 resultFindId로 전송합니다.
//        if (member != null) {
//            mav.addObject("member", member.getUser_id());
//            return "member/resultFindId";
//        } else {
//            mav.addObject("error", "회원 정보를 찾을 수 없습니다.");
//            // ModelAndView 객체에 데이터를 추가한 후, "member/findMember" 뷰를 반환
//            return "member/findMember";
//        }
        return "member/findMember";
    }






}





















