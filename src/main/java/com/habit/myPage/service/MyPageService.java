package com.habit.myPage.service;

import com.habit.myPage.DTO.UserInfoDTO;

import java.util.Map;

public interface MyPageService {

    Map<String,Object> getUserNameAndImg(String user_id);

    Map<String,Object> getMyEnergyAndReview(String user_id);

    UserInfoDTO getUserInfo(String user_id);

    String getPass(String user_id,String checkpw);
}
