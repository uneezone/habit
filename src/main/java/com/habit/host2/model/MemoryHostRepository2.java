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
    public List<Integer> getContNoForHome(String userId) {
        return sqlSession.selectList("host2.getContNoForHome",userId);
    }

    @Override
    public Map<String,Object> getAllPriceForHome(List<String> pro_nos) {
        return sqlSession.selectOne("host2.getAllPriceForHome",pro_nos);
    }

    @Override
    public Long getMonthPriceForHome(List<String> pro_nos) {
        return sqlSession.selectOne("host2.getMonthPriceForHome",pro_nos);
    }

    @Override
    public Long getMonthCancel(List<String> pro_nos) {
        return sqlSession.selectOne("host2.getMonthCancel",pro_nos);
    }

    @Override
    public Map<String, Object> getReviewAndStar(List<Integer> cont_nos) {
        return sqlSession.selectOne("host2.getReviewAndStar",cont_nos);
    }

    @Override
    public Long getQuestionUserCount(List<Integer> cont_nos) {
        return sqlSession.selectOne("host2.getQuestionUserCount",cont_nos);
    }

    @Override
    public Long getQuestionHostCount(String host_id) {
        return sqlSession.selectOne("host2.getQuestionHostCount",host_id);
    }

    @Override
    public Map<String, Object> getHostImgAndName(String host_id) {
        return sqlSession.selectOne("host2.getHostImgAndName",host_id);
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
    public int checkAjustForProCon(int payd_no) {
        return sqlSession.selectOne("host2.checkAdjustForProCon",payd_no);
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
    public String getUserGradeForRefund(String user_id) {
        return sqlSession.selectOne("host2.getUserGrade",user_id);
    }

    @Override
    public int insertEnergyRefundByCont(Map<String, Object> params) {
        return sqlSession.insert("host2.insertEnergyRefund",params);
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
    public List<AdjustInfoDTO> getAdjustList(SearchAdjustDTO dto) {
        return sqlSession.selectList("host2.getAdjustList",dto);
    }

    @Override
    public Integer getAdjustListLength(SearchAdjustDTO dto){
        return sqlSession.selectOne("host2.getAdjustListLength",dto);
    }

    @Override
    public List<Map<String, Object>> getAdjustDetail(String calc_no) {
        return sqlSession.selectList("host2.getAdjustDetail",calc_no);
    }

    @Override
    public Map<String, Object> getCalcAccount(String calc_no) {
        return sqlSession.selectOne("host2.getCalcAccount",calc_no);
    }

    @Override
    public String getOptionName(Map<String,Object> params) {
        return sqlSession.selectOne("host2.getOptionName",params);
    }

    @Override
    public Map<String, Object> getHostAccount(String host_id) {
        return sqlSession.selectOne("host2.getHostAccount",host_id);
    }

    @Override
    public List<Integer> getContNoForAdjust(String host_id) {
        return sqlSession.selectList("host2.getConNoForAdjust",host_id);
    }

    @Override
    public void updateContStatus(int cont_no) {
        sqlSession.update("host2.updateContStatus",cont_no);
    }

    @Override
    public List<String> getOneProNo(int cont_no) {
        return sqlSession.selectList("host2.getOneProNo",cont_no);
    }

    @Override
    public void updateOneStatus(List<String> pro_no) {
        sqlSession.update("host2.updateOneStatus",pro_no);
    }

    @Override
    public List<String> getProdProNo(int cont_no) {
        return sqlSession.selectList("host2.getProdProNo",cont_no);
    }

    @Override
    public void updateProdStatus(List<String> pro_no) {
        sqlSession.update("host2.updateProdStatus",pro_no);
    }

    @Override
    public List<Integer> getPaydNo(List<String> pro_no) {
        return sqlSession.selectList("host2.getPaydNo",pro_no);
    }

    @Override
    public void updatePaydStatus(List<Integer> payd_no) {
        sqlSession.update("host2.updatePaydStatusForAdjust",payd_no);
    }

    @Override
    public List<String> getAdjustProNo(int cont_no) {
        return sqlSession.selectList("host2.getAdjustProNo",cont_no);
    }

    //판매된거 있는지 조회인데 필요없어짐 따로 구현함
    @Override
    public int checkSelled(String pro_no) {
        return sqlSession.selectOne("host2.checkSelled",pro_no);
    }

    @Override
    public List<AdjustPaydDTO> getAdjustPaydDTO(List<String> pro_nos) {
        return sqlSession.selectList("host2.getAdjustPaydDTO",pro_nos);
    }

    @Override
    public String findCalcNo(String date) {
        return sqlSession.selectOne("host2.findCalcNo",date);
    }

    @Override
    public AdjustContDTO getAdjustContDTO(int cont_no) {
        return sqlSession.selectOne("host2.getAdjustContDTO",cont_no);
    }

    @Override
    public int insertCalc(CalcDTO dto) {
        return sqlSession.insert("host2.insertCalc", dto);
    }

    @Override
    public int insertCalcD(CalcdDTO dto) {
        return sqlSession.insert("host2.insertCalcD",dto);
    }

    @Override
    public int checkAccount(String host_id) {
        return sqlSession.selectOne("host2.checkAccount",host_id);
    }

    @Override
    public void updateCalcStatus(String calc_no) {
        sqlSession.update("host2.updateCalcStatus",calc_no);
    }
}
