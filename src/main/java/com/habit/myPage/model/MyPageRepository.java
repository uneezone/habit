package com.habit.myPage.model;

import com.habit.myPage.DTO.*;

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

    //=============리뷰쓰기
    //리뷰를 작성했는지 확인
    int checkReviewWrite(int payd_no);

    //리뷰페이지 보여줄 상풍명 가져오기
    ReviewWriteDTO getContInfo(int payd_no);

    //리뷰를 이미 작성했을 경우 수정으로
    ReviewWriteDTO getReview(int payd_no);

    //리뷰인저트
    int insertReview(ReviewInsertDTO dto);

    int insertEnergy(EnergyDTO dto);

    //리뷰업데이트
    int updateReview(ReviewInsertDTO dto);

    //환불페이지에 필요한 정보가져오기
    RefundInfoDTO getInfoForRefund(int payd_no);

    //RO가 있는지 확인해서 에너지 환불 체크
    int getCheckForEnergyRefund(String pay_no);

    //환불 테이블에 넣기
    int insertRefund(RefundInsertDTO dto);

    //환불 후 주문상세내역 테이블 주문상세상태, 환불상태 바꾸기
    int changeStatusPayd(int payd_no);

    //환불 에너지 있으면 환불시키기 and 상품적립포인트 빼기
    int insertEnergyRefund(EnergyDTO dto);

    //유저 등급알아내서 상품 적립포인트 빼기
    String getUserGrade(String user_id);

    //환불 완료 페이지
    RefundResultDTO getResultRefund(int payd_no);
}
