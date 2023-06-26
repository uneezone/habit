package com.habit.host1.controller;

import com.habit.host1.DTO.RequestContentValueDTO;
import com.habit.host1.DTO.RequestReviewDTO;
import com.habit.host1.DTO.ResponseReviewDTO;
import com.habit.host1.DTO.*;
import com.habit.host1.service.HostService1;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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
    @GetMapping("/content/form")
    public String contentForm(@SessionAttribute(name = "userId", required = false) String userIdd, Model model) {
        String userId = "user-1"; //임시 세션 아이디
        String host_img = hostService1.getHostImg(userId);

        model.addAttribute("host_id", userId);
        model.addAttribute("host_img", host_img);
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
    @PostMapping("/content/insert")
    public String contentInsert(@SessionAttribute(name = "userId", required = false) String userIdd, RequestContentValueDTO rciDTO) throws IOException {
        //임시 세션 아이디
        String userId = "user-1";
        rciDTO.setHost_id(userId);
        int result = hostService1.contentInsert(rciDTO);
        return "redirect:/host/content/list";
    }










    // [habit_list.jsp]
    // 해빗 리스트 조회
    @GetMapping("/content/list")
    public String contentList (@SessionAttribute(name = "userId", required = false) String userIdd, Model model) {
        //임시 세션 아이디
        String userId = "user-1";
        RequestContentListDTO reqContListDTO = new RequestContentListDTO();
        reqContListDTO.setHost_id(userId);
        String host_img = hostService1.getHostImg(userId);

        List<ResponseContentListDTO> list = hostService1.contentList(reqContListDTO);
        hostService1.contentListCount(reqContListDTO);
        model.addAttribute("host_id", userId);
        model.addAttribute("host_img", host_img);
        model.addAttribute("vo", reqContListDTO.getVo());
        model.addAttribute("list", list);

        return "host/habit_list";
    }

    // 해빗 페이징 (더보기)
    @GetMapping("/content/seemore.do")
    @ResponseBody
    public Map<String, Object> contentList (int click, Model model) {
        //임시 세션 아이디
        String userId = "user-1";
        RequestContentListDTO reqContListDTO = new RequestContentListDTO();
        reqContListDTO.getVo().setClick(click);
        reqContListDTO.setHost_id(userId);

        List<ResponseContentListDTO> list = hostService1.contentList(reqContListDTO);
        hostService1.contentListCount(reqContListDTO);

        Map<String, Object> map = new HashMap<>();
        map.put("vo", reqContListDTO.getVo());
        map.put("list", list);

        return map;
    }

    // 해빗 리스트 필터 조회
    @PostMapping("/content/list.do")
    @ResponseBody
    public Map<String, Object> contentList (@SessionAttribute(name = "userId", required = false) String userIdd, RequestContentListDTO reqContListDTO) {
        //임시 세션 아이디
        String userId = "user-1";
        reqContListDTO.setHost_id(userId);

        List<ResponseContentListDTO> list = hostService1.contentList(reqContListDTO);
        hostService1.contentListCount(reqContListDTO);


        Map<String, Object> map = new HashMap<>();
        map.put("vo", reqContListDTO.getVo());
        map.put("list", list);

        System.out.println("map.get(\"vo\") = " + map.get("vo"));
        System.out.println("map.get(\"list\") = " + map.get("list"));
        return map;
    }

    // 해빗 삭제
    @GetMapping("/content/delete/{cont_no}")
    public String contentDelete(@PathVariable int cont_no) {
        hostService1.deleteContent(cont_no);
        return "redirect:/host/content/list";
    }

    // 해빗 수정 폼
    @GetMapping("/content/updateform/{cont_no}")
    @ResponseBody
    public RequestContentValueDTO contentUpdateBefore(@PathVariable int cont_no, Model model) {
        return hostService1.contentSelectOne(cont_no);
    }

    // 해빗 수정
    @PostMapping("/content/update/{cont_no}")
    public String contentUpdate(@PathVariable int cont_no, RequestContentValueDTO rciDTO) throws IOException {
        rciDTO.setCont_no(cont_no);
        hostService1.contentUpdate(rciDTO);
        return "redirect:/host/content/list";
    }

    // [habit_review_control.jsp]
    // 리뷰 리스트 조회
    @GetMapping("/review")
    public String reviewList(@SessionAttribute(name = "userId", required = false) String userIdd, Model model) {
        //임시 세션 아이디
        String userId = "user-1";
        RequestReviewDTO reqReviewDTO = new RequestReviewDTO();
        reqReviewDTO.setHost_id(userId);

        List<ResponseReviewDTO> list = hostService1.reviewList(reqReviewDTO);
        int totalCount = hostService1.totalReviewCount(reqReviewDTO);

        ResponsePageVO responsePageVO = new ResponsePageVO();
        responsePageVO.setTotalRecord(totalCount);

        String host_img = hostService1.getHostImg(userId);
        model.addAttribute("host_id", userId);
        model.addAttribute("host_img", host_img);
        model.addAttribute("list", list);
        model.addAttribute("paging", responsePageVO);

        return "host/habit_review_control";
    }

    @GetMapping("/review/{currentPage}")
    public String reviewList(@SessionAttribute(name = "userId", required = false) String userIdd, @PathVariable Integer currentPage, Model model) {
        //임시 세션 아이디
        String userId = "user-1";
        RequestReviewDTO reqReviewDTO = new RequestReviewDTO();
        reqReviewDTO.setHost_id(userId);
        ResponsePageVO responsePageVO = new ResponsePageVO(currentPage);
        reqReviewDTO.setVo(responsePageVO);

        List<ResponseReviewDTO> list = hostService1.reviewList(reqReviewDTO);
        int totalCount = hostService1.totalReviewCount(reqReviewDTO);
        responsePageVO.setTotalRecord(totalCount);

        model.addAttribute("list", list);
        model.addAttribute("paging", responsePageVO);

        return "host/habit_review_control";
    }

    // 리뷰 리스트 필터 조회
    @PostMapping("/review.do")
    @ResponseBody
    public Map<String, Object> reviewSearchList(@SessionAttribute(name = "userId", required = false) String userIdd, RequestReviewDTO reqReviewDTO) {
        //임시 세션 아이디
        String userId = "user-1";
        reqReviewDTO.setHost_id(userId);

        List<ResponseReviewDTO> list = hostService1.reviewList(reqReviewDTO);
        int totalCount = hostService1.totalReviewCount(reqReviewDTO);

        ResponsePageVO responsePageVO = new ResponsePageVO();
        responsePageVO.setTotalRecord(totalCount);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("paging", responsePageVO);

        return map;
    }

    @PostMapping("/review.do/{currentPage}")
    @ResponseBody
    public Map<String, Object> reviewSearchList(@SessionAttribute(name = "userId", required = false) String userIdd, @PathVariable Integer currentPage, RequestReviewDTO reqReviewDTO) {
        //임시 세션 아이디
        String userId = "user-1";
        reqReviewDTO.setHost_id(userId);
        ResponsePageVO responsePageVO = new ResponsePageVO(currentPage);
        reqReviewDTO.setVo(responsePageVO);

        List<ResponseReviewDTO> list = hostService1.reviewList(reqReviewDTO);
        int totalCount = hostService1.totalReviewCount(reqReviewDTO);
        responsePageVO.setTotalRecord(totalCount);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("paging", responsePageVO);

        return map;
    }

    // 리뷰 삭제 (상태 변경)
    @GetMapping("/review/delete/{review_no}")
    public String reviewDelete(@SessionAttribute(name = "userId", required = false) String userIdd, @PathVariable Integer review_no) {
        hostService1.reviewDelete(review_no);
        return "redirect:/host/review";
    }


    // [habit_reservation_control.jsp]
    // 예약 리스트 조회
    @GetMapping("/reservation")
    public String reservationList (@SessionAttribute(name = "userId", required = false) String userIdd, Model model) {
        //임시 세션 아이디
        String userId = "user-1";
        RequestReservationDTO reqReservDTO = new RequestReservationDTO();
        reqReservDTO.setHost_id(userId);

        List<ResponseReservationDTO> list = hostService1.reservationList(reqReservDTO);
        int totalCount = hostService1.totalReservationCount(reqReservDTO);

        ResponsePageVO responsePageVO = new ResponsePageVO();
        responsePageVO.setTotalRecord(totalCount);

        String host_img = hostService1.getHostImg(userId);
        model.addAttribute("host_id", userId);
        model.addAttribute("host_img", host_img);
        model.addAttribute("list", list);
        model.addAttribute("paging", responsePageVO);

        return "host/habit_reservation_control";
    }

    @GetMapping("/reservation/{currentPage}")
    public String reservationList (@SessionAttribute(name = "userId", required = false) String userIdd, @PathVariable Integer currentPage, Model model) {
        //임시 세션 아이디
        String userId = "user-1";
        RequestReservationDTO reqReservDTO = new RequestReservationDTO();
        reqReservDTO.setHost_id(userId);

        ResponsePageVO responsePageVO = new ResponsePageVO(currentPage);
        reqReservDTO.setVo(responsePageVO);

        List<ResponseReservationDTO> list = hostService1.reservationList(reqReservDTO);
        int totalCount = hostService1.totalReservationCount(reqReservDTO);
        responsePageVO.setTotalRecord(totalCount);

        model.addAttribute("list", list);
        model.addAttribute("paging", responsePageVO);

        return "host/habit_reservation_control";
    }

    // 예약 리스트 필터 조회
    @PostMapping("/reservation/filter.do")
    @ResponseBody
    public Map<String, Object> reservationFilter (@SessionAttribute(name = "userId", required = false) String userIdd, RequestReservationDTO reqReservDTO) {

        //임시 세션 아이디
        String userId = "user-1";
        reqReservDTO.setHost_id(userId);

        List<ResponseReservationDTO> list = hostService1.reservationList(reqReservDTO);
        int totalCount = hostService1.totalReservationCount(reqReservDTO);

        ResponsePageVO responsePageVO = new ResponsePageVO();
        responsePageVO.setTotalRecord(totalCount);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("paging", responsePageVO);

        return map;
    }

    @PostMapping("/reservation/filter.do/{currentPage}")
    @ResponseBody
    public Map<String, Object> reservationFilter (@SessionAttribute(name = "userId", required = false) String userIdd, @PathVariable Integer currentPage, RequestReservationDTO reqReservDTO) {
        //임시 세션 아이디
        String userId = "user-1";
        reqReservDTO.setHost_id(userId);

        ResponsePageVO responsePageVO = new ResponsePageVO(currentPage);
        reqReservDTO.setVo(responsePageVO);

        List<ResponseReservationDTO> list = hostService1.reservationList(reqReservDTO);
        int totalCount = hostService1.totalReservationCount(reqReservDTO);
        responsePageVO.setTotalRecord(totalCount);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("paging", responsePageVO);

        return map;
    }


    // 예약 상태 변경
    @PostMapping("/reservation/statuschange.do")
    @ResponseBody
    public int reservationStatusChange (RequestReservationStatusChangeDTO reqReservStatChg) {
        return hostService1.reservationStatusChangeAndRefundInsert(reqReservStatChg);
    }


    // [habit_inquiry_control.jsp]
    @GetMapping("/inquiry")
    public String inquiryControl(@SessionAttribute(name = "userId", required = false) String userIdd, Model model) {
        //임시 세션 아이디
        String userId = "user-1";
        String host_img = hostService1.getHostImg(userId);

        model.addAttribute("host_id", userId);
        model.addAttribute("host_img", host_img);
        return "host/habit_inquiry_control";
    }

    @PostMapping("/inquiry.do")
    @ResponseBody
    public List<ResponseInquiryDTO> inquiryList(@SessionAttribute(name = "userId", required = false) String userIdd, RequestInquiryDTO reqInqDTO) {
        //임시 세션 아이디
        String userId = "user-1";
        reqInqDTO.setHost_id(userId);
        return hostService1.inquiryList(reqInqDTO);
    }

}
