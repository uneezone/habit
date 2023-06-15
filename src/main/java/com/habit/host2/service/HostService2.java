package com.habit.host2.service;

import com.habit.host2.entity.HostEditDTO;
import com.habit.host2.entity.HostInfoDTO;
import com.habit.host2.entity.NewHostDTO;
import com.habit.host2.entity.ProductDTO;

import java.util.List;

public interface HostService2 {


    String checkHost(String id);
    String getPhoneNumber(String id);

    void newHost(NewHostDTO dto);

    void updateUserGrade(String id);

    //새로운 하스트 가입
    void newHostPro(NewHostDTO dto, String id);

    HostInfoDTO getHostInfo(String userId);

    void editHostInfo(HostEditDTO dto);

    List<ProductDTO> getProduct(String hostId);
}
