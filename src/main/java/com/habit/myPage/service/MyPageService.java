package com.habit.myPage.service;

import com.habit.myPage.DTO.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface MyPageService {

    Map<String,Object> getUserNameAndImg(String user_id);

    Map<String,Object> getMyEnergyAndReview(String user_id);

    UserInfoDTO getUserInfo(String user_id);

    String getPass(String user_id,String checkpw);

    String  updatePass(String user_id,String pw);

    //유정정보 수정
    String updateUserInfo(UserInfoDTO dto);

    List<Map<String,Object>> getOrderList(String user_id);

    List<OrderAllDTO> getPayDForOrder(String pay_no);

    Map<String, Object> getPayForOrderDetail(String pay_no);

    List<OrderDetailDTO> getPayDForOrderDetail(String pay_no);

    //환불정보
    List<OrderRefnDTO> getRefnForOrderDetail( List<OrderDetailDTO> dto);

    //리뷰쓰기
    ReviewWriteDTO getReview(int payd_no,String pro_no);

    //리뷰 에너지 넣기
    int insertEnergy(EnergyDTO dto);

    //리뷰 수정 또는 리뷰 인저트
    int updateOrInsertReview(ReviewInsertDTO dto, List<MultipartFile> imgs) throws IOException;

    //환불시작
    RefundInfoDTO getForRefund(int payd_no);

    //환불 넣기
    String insertRefund(RefundInsertDTO dto, String user_id);

    //환불완료 페이지
    RefundResultDTO getResultRefund(int payd_no);


}
