package com.habit.myPage.service;

import com.habit.myPage.DTO.OrderAllDTO;
import com.habit.myPage.DTO.OrderDetailDTO;
import com.habit.myPage.DTO.OrderRefnDTO;
import com.habit.myPage.DTO.UserInfoDTO;

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
}
