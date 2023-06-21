package com.habit.myPage.model;

import com.habit.myPage.DTO.OrderAllDTO;
import com.habit.myPage.DTO.OrderDetailDTO;
import com.habit.myPage.DTO.OrderRefnDTO;
import com.habit.myPage.DTO.UserInfoDTO;

import java.util.List;
import java.util.Map;

public interface MyPageRepository {

    //유저이름가져오기
    Map<String,Object> getUserNameAndImg(String user_id);

    //유저에너지 남은거 가져오기
    int getMyEnergy(String user_id);

    //유저 리뷰쓴 거 카운트
    int getMyReviewCount(String user_id);

    //유저정보 가져오기
    UserInfoDTO getUserInfo(String user_id);

    //유저비밀번호 가져오기(비밀번호 바꾸기위해 비번 체크)
    String getPass(String user_id);

    //비번체크후 비번 바꾸기
    int updatePass(String user_id,String pw);

    //유저정보 수정
    int updateUserInfo(UserInfoDTO infoDTO);

    //=============결제내역
    List<Map<String,Object>> getFromPayForOrder(String user_id);

    //결제내역에 대한 상세를 위한 PAYD 탐색
    List<OrderAllDTO> getPayDForOrder(String pay_no);

    //결제내역에 보여줄 상품상세내용
    Map<String,Object> getOneForOrder(String pro_no);
    Map<String,Object> getProForOrder(String pro_no);

    //==========결제내역 상세
    //주문테이블에서 필요한거(결제날짜, 수량)
    Map<String ,Object> getFromPayForOrderDetail(String pay_no);

    //상품설명
    List<OrderDetailDTO> getPayDForOrderDetail(String pay_no);

    //환불상태확인
    OrderRefnDTO getRefnForOrderDetail(int payd_no);
}
