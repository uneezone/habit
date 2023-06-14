package com.habit.host2.model;

import com.habit.host2.entity.HostInfoDTO;
import com.habit.host2.entity.NewHostDTO;

import java.util.List;

public interface HostRepository2 {

    //유저가 호스트인지 확인
    String checkHost(String userId);

    //호스트가 가입시 전화번호 미입력하면 유저단에서 가져옴
    String getPhoneNumber(String userId);


    //유저 호스트 가입시키기
    void newHost(NewHostDTO dto);

    //유저테이블단에서 user_grade H로 바꾸기
    void updateUserGrade(String userId);

    HostInfoDTO getHostInfo(String userId);
}
