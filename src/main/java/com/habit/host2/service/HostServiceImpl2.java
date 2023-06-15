package com.habit.host2.service;

import com.habit.host2.entity.HostEditDTO;
import com.habit.host2.entity.HostInfoDTO;
import com.habit.host2.entity.NewHostDTO;
import com.habit.host2.entity.ProductDTO;
import com.habit.host2.model.HostRepository2;
import com.habit.host2.model.MemoryHostRepository2;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class HostServiceImpl2 implements HostService2 {

    @Autowired
    private  MemoryHostRepository2 repository;



    @Override
    public String checkHost(String id) {
        return repository.checkHost(id);
    }

    @Override
    public String getPhoneNumber(String id) {
        return repository.getPhoneNumber(id);
    }


    //없애도 됨
   @Transactional
    @Override
    public void newHost(NewHostDTO dto) {
        repository.newHost(dto);
    }

    @Override
    public void updateUserGrade(String id) {
        repository.updateUserGrade(id);
    }
    //없애도됨

    //새로운 하스트 가입
    @Transactional
    @Override
    public void newHostPro(NewHostDTO dto, String id) {
        repository.newHost(dto);
        repository.updateUserGrade(id);
    };

    //하스트 정보가져오기
    @Override
    public HostInfoDTO getHostInfo(String userId){
        return repository.getHostInfo(userId);
    }

    @Transactional
    @Override
    public void editHostInfo(HostEditDTO dto) {
        repository.editHostInfo(dto);
    }

    @Override
    public List<ProductDTO> getProduct(String hostId) {
        return repository.getProduct(hostId);
    }
}
