package com.habit.host2.service;

import com.habit.host2.entity.*;
import com.habit.host2.model.HostRepository2;
import com.habit.host2.model.MemoryHostRepository2;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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

    //새로운 하스트 가입 newHost메소드와 updateUserGrade메소드 합친거
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
    public int getProductsLength(SearchProDTO dto) {
        return repository.getProductsLength(dto);
    }

    @Override
    public List<ProductDTO> getProduct(SearchProDTO dto) {
        return repository.getProduct(dto);
    }

    @Override
    @Transactional
    public void updatePaydStatus(Long payd_no, String status) {
        repository.updatePaydStatus(payd_no,status);
    }

    @Override
    public String getPayNo(Long payd_no) {
        return repository.getPayNo(payd_no);
    }

    @Override
    public Long getRefnCount(String pay_no) {
        return repository.getRefnCount(pay_no);
    }

    @Override
    public String getPayMethod(String pay_no) {
        return repository.getPayMethod(pay_no);
    }

    @Override
    public Map<String, Object> getInfoByPaydNo(Long payd_no) {
        return repository.getInfoByPaydNo(payd_no);
    }

    @Override
    public void insertRefund(Map<String, Object> params) {
        repository.insertRefund(params);
    }

    @Override
    public Integer getRefundPoint(String pay_no) {
        return repository.getRefundPoint(pay_no);
    }

    @Override
    public void insertEnergy(Map<String, Object> params) {
        repository.insertEnergy(params);
    }

    @Override
    public List<Map<String, Object>> getProductNames(String host_id) {
        return repository.getProductNames(host_id);
    }

    @Override
    public List<Map<String, Object>> getProductOptions(Long cont_no) {
        return repository.getProductOptions(cont_no);
    }

    @Override
    public Map<String, Object> showUserInfo(String user_id) {
        return repository.showUserInfo(user_id);
    }

    //정산서

    @Override
    public List<AdjustInfoDTO> getAdjustList(String host_id) {
        return repository.getAdjustList(host_id);
    }
}
