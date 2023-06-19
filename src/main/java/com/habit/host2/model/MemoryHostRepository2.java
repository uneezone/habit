package com.habit.host2.model;

import com.habit.host2.entity.*;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class MemoryHostRepository2 implements HostRepository2 {

    @Autowired
    SqlSession sqlSession;
  /*  private final HostMapper hostMapper;


    @Override
    public String checkHost(String userId) {
        return hostMapper.checkHost(userId);
    }

    @Override
    public String getPhoneNumber(String userId) {
        String phone = hostMapper.getPhoneNumber(userId);
        return phone;
    }

    @Override
    public void newHost(NewHostDTO dto) {
        hostMapper.newHost(dto);
    }

    @Override
    public void updateUserGrade(String userId) {
        hostMapper.updateUserGrade(userId);
    }

    @Override
    public HostInfoDTO getHostInfo(String userId) {
        return hostMapper.getHostInfo(userId);
    }*/

    @Override
    public String checkHost(String userId) {
        return sqlSession.selectOne("host2.checkHost",userId);
    }

    @Override
    public String getPhoneNumber(String userId) {
        return sqlSession.selectOne("host2.getPhoneNumber",userId);
    }

    @Override
    public void newHost(NewHostDTO dto) {
        sqlSession.insert("host2.newHost",dto);
    }

    @Override
    public void updateUserGrade(String userId) {
        sqlSession.update("host2.updateUserGrade",userId);
    }

    @Override
    public HostInfoDTO getHostInfo(String userId) {
        return sqlSession.selectOne("host2.getHostInfo",userId);
    }

    @Override
    public void editHostInfo(HostEditDTO dto) {
        sqlSession.insert("host2.editHostInfo",dto);
    }


    @Override
    public int getProductsLength(SearchProDTO dto) {
        return sqlSession.selectOne("host2.getProductsLength",dto);
    }

    @Override
    public List<ProductDTO> getProduct(SearchProDTO dto) {
        return sqlSession.selectList("host2.getProduct",dto);
    }

    @Override
    public void updatePaydStatus(Long payd_no, String status) {
        Map<String,Object> params= new HashMap<>();
        params.put("payd_no",payd_no);
        params.put("status",status);
        sqlSession.update("host2.updatePaydStatus",params);
    }

    @Override
    public String getPayNo(Long payd_no) {
        return sqlSession.selectOne("host2.getPayNo",payd_no);
    }

    @Override
    public Long getRefnCount(String pay_no) {
        return sqlSession.selectOne("host2.getRefnCount",pay_no);
    }

    @Override
    public String getPayMethod(String pay_no) {
        return sqlSession.selectOne("host2.getPayMethod",pay_no);
    }

    @Override
    public Map getInfoByPaydNo(Long payd_no) {
        return sqlSession.selectOne("host2.getInfoByPaydNo",payd_no);
    }

    @Override
    public void insertRefund(Map<String,Object> params) {
        sqlSession.insert("host2.insertRefund",params);
    }

    @Override
    public Integer getRefundPoint(String pay_no) {
        return sqlSession.selectOne("host2.getRefundPoint",pay_no);
    }

    @Override
    public void insertEnergy(Map<String, Object> params) {
        sqlSession.insert("host2.insertEnergy",params);
    }

    @Override
    public List<Map<String, Object>> getProductNames(String host_id) {
        return sqlSession.selectList("host2.getProductNames",host_id);
    }

    @Override
    public List<Map<String, Object>> getProductOptions(Long cont_no) {
        return sqlSession.selectList("host2.getProductOptions",cont_no);
    }

    @Override
    public Map<String, Object> showUserInfo(String user_id) {
        return sqlSession.selectOne("host2.showUserInfo",user_id);
    }

    //=======정산서

    @Override
    public List<AdjustInfoDTO> getAdjustList(String host_id) {
        return sqlSession.selectList("host2.getAdjustList",host_id);
    }
}
