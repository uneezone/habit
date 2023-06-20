package com.habit.myPage.model;

import com.habit.myPage.DTO.UserInfoDTO;

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
}
