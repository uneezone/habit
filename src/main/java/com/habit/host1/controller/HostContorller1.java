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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/host")
public class HostContorller1 {

    private final HostService1 hostService1;

    // [habit_create.jsp] ==========================================================================================================================
    // 컨텐츠 생성 폼으로 이동 & 대분류 list 불러오기
    @GetMapping("/content/form")
    public String contentForm(@SessionAttribute(name = "s_id") String s_id, Model model) {
        model.addAttribute("host_id", s_id);
        model.addAttribute("List", hostService1.cateList());
        return "host/habit_create";
    }

    // 대분류 선택에 따른 중분류 list 불러오기
    @GetMapping("/cate_middle.do")
    @ResponseBody
    public List<Map<String, Object>> selectCate(String cate_large) {
        return hostService1.selectCate(cate_large);
    }

    // 생성된 컨텐츠 값 insert
    @PostMapping("/content/insert")
    public String contentInsert(@SessionAttribute(name = "s_id") String s_id, RequestContentValueDTO rciDTO) throws IOException {
        rciDTO.setHost_id(s_id);
        int result = hostService1.contentInsert(rciDTO);
        return "redirect:/host/content/list";
    }



    // [habit_list.jsp] ==========================================================================================================================
    // 해빗 페이징 (더보기)
    @PostMapping("/content/seemore.do")
    @ResponseBody
    public Map<String, Object> contentList (@SessionAttribute(name = "s_id") String s_id, int click, RequestContentListDTO reqContListDTO) {

        reqContListDTO.getVo().setClick(reqContListDTO.getClick());
        reqContListDTO.setHost_id(s_id);

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
    public Map<String, Object> contentList(@SessionAttribute(name = "s_id") String s_id, RequestContentListDTO reqContListDTO) {

        reqContListDTO.setHost_id(s_id);

        List<ResponseContentListDTO> list = hostService1.contentList(reqContListDTO);
        hostService1.contentListCount(reqContListDTO);

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedNow = now.format(formatter);

        Map<String, Object> map = new HashMap<>();
        map.put("now", formattedNow);
        map.put("vo", reqContListDTO.getVo());
        map.put("list", list);

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
    public Map<String, Object> contentUpdateBefore(@PathVariable int cont_no) {
        return hostService1.contentUpdateBefore(cont_no);
    }

    // 해빗 수정
    @PostMapping("/content/update/{cont_no}")
    public String contentUpdate(@PathVariable int cont_no, RequestContentValueDTO rciDTO) throws IOException {
        rciDTO.setCont_no(cont_no);
        hostService1.contentUpdate(rciDTO);
        return "redirect:/host/content/list";
    }

    // 해빗 리스트 조회
    @GetMapping("/content/list")
    public String contentList (@SessionAttribute(name = "s_id") String s_id, Model model) {

        RequestContentListDTO reqContListDTO = new RequestContentListDTO();
        reqContListDTO.setHost_id(s_id);
        List<ResponseContentListDTO> list = hostService1.contentList(reqContListDTO);
        hostService1.contentListCount(reqContListDTO);

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedNow = now.format(formatter);

        model.addAttribute("now", formattedNow);
        model.addAttribute("host_id", s_id);
        model.addAttribute("vo", reqContListDTO.getVo());
        model.addAttribute("list", list);

        return "host/habit_list";
    }

    // 옵션 삭제
    @PostMapping("/option/delete.do")
    @ResponseBody
    public int optionDelete (RequestOptionDeleteDTO reqOptDelDTO) {
        return hostService1.optionDelete(reqOptDelDTO);
    }

    // 옵션 update & insert
    @PostMapping("/option/update.do")
    @ResponseBody
    public int optionUpdate(RequestOptionDTO reqOptDTO) {
        return hostService1.optionUpdate(reqOptDTO);
    }

    // 옵션 detail 보기
    @GetMapping("/content/detail/{cont_no}")
    @ResponseBody
    public Map<String, Object> contentDetail (@PathVariable int cont_no) {
        return hostService1.contentUpdateBefore(cont_no);
    }



    // [habit_review_control.jsp] ==========================================================================================================================
    // 리뷰 리스트 조회
    @GetMapping("/review")
    public String reviewList(@SessionAttribute(name = "s_id") String s_id, Model model) {

        RequestReviewDTO reqReviewDTO = new RequestReviewDTO();
        reqReviewDTO.setHost_id(s_id);

        List<ResponseReviewDTO> list = hostService1.reviewList(reqReviewDTO);
        int totalCount = hostService1.totalReviewCount(reqReviewDTO);

        ResponsePageVO responsePageVO = new ResponsePageVO();
        responsePageVO.setTotalRecord(totalCount);

        model.addAttribute("host_id", s_id);
        model.addAttribute("list", list);
        model.addAttribute("paging", responsePageVO);

        return "host/habit_review_control";
    }

    @GetMapping("/review/{currentPage}")
    public String reviewList(@SessionAttribute(name = "s_id") String s_id, @PathVariable Integer currentPage, Model model) {

        RequestReviewDTO reqReviewDTO = new RequestReviewDTO();
        reqReviewDTO.setHost_id(s_id);
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
    public Map<String, Object> reviewSearchList(@SessionAttribute(name = "s_id") String s_id, RequestReviewDTO reqReviewDTO) {

        reqReviewDTO.setHost_id(s_id);

        List<ResponseReviewDTO> list = hostService1.reviewList(reqReviewDTO);
        int totalCount = hostService1.totalReviewCount(reqReviewDTO);

        ResponsePageVO responsePageVO = new ResponsePageVO();
        responsePageVO.setTotalRecord(totalCount);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("paging", responsePageVO);

        return map;
    }

    // 리뷰 리스트 필터 더보기
    @PostMapping("/review.do/{currentPage}")
    @ResponseBody
    public Map<String, Object> reviewSearchList(@SessionAttribute(name = "s_id") String s_id, @PathVariable Integer currentPage, RequestReviewDTO reqReviewDTO) {

        reqReviewDTO.setHost_id(s_id);
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
    public String reviewDelete(@PathVariable Integer review_no) {
        hostService1.reviewDelete(review_no);
        return "redirect:/host/review";
    }



    // [habit_reservation_control.jsp] ==========================================================================================================================
    // 예약 리스트 조회
    @GetMapping("/reservation")
    public String reservationList (@SessionAttribute(name = "s_id") String s_id, Model model) {

        RequestReservationDTO reqReservDTO = new RequestReservationDTO();
        reqReservDTO.setHost_id(s_id);

        List<ResponseReservationDTO> list = hostService1.reservationList(reqReservDTO);
        int totalCount = hostService1.totalReservationCount(reqReservDTO);

        ResponsePageVO responsePageVO = new ResponsePageVO();
        responsePageVO.setTotalRecord(totalCount);

        model.addAttribute("host_id", s_id);
        model.addAttribute("list", list);
        model.addAttribute("paging", responsePageVO);

        return "host/habit_reservation_control";
    }

    // 예약 리스트 페이징
    @GetMapping("/reservation/{currentPage}")
    public String reservationList (@SessionAttribute(name = "s_id") String s_id, @PathVariable Integer currentPage, Model model) {

        RequestReservationDTO reqReservDTO = new RequestReservationDTO();
        reqReservDTO.setHost_id(s_id);

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
    public Map<String, Object> reservationFilter (@SessionAttribute(name = "s_id") String s_id, RequestReservationDTO reqReservDTO) {

        reqReservDTO.setHost_id(s_id);

        List<ResponseReservationDTO> list = hostService1.reservationList(reqReservDTO);
        int totalCount = hostService1.totalReservationCount(reqReservDTO);

        ResponsePageVO responsePageVO = new ResponsePageVO();
        responsePageVO.setTotalRecord(totalCount);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("paging", responsePageVO);

        return map;
    }

    // 예약 리스트 필터 페이징
    @PostMapping("/reservation/filter.do/{currentPage}")
    @ResponseBody
    public Map<String, Object> reservationFilter (@SessionAttribute(name = "s_id") String s_id, @PathVariable Integer currentPage, RequestReservationDTO reqReservDTO) {

        reqReservDTO.setHost_id(s_id);

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



    // [habit_inquiry_control.jsp] ==========================================================================================================================
    @GetMapping("/inquiry")
    public String inquiryControl(@SessionAttribute(name = "s_id") String s_id, Model model) {
        model.addAttribute("host_id", s_id);
        return "host/habit_inquiry_control";
    }

    @PostMapping("/inquiry.do")
    @ResponseBody
    public List<ResponseInquiryDTO> inquiryList(@SessionAttribute(name = "s_id") String s_id, RequestInquiryDTO reqInqDTO) {

        reqInqDTO.setHost_id(s_id);
        return hostService1.inquiryList(reqInqDTO);
    }

}
