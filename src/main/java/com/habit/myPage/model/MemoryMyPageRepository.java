package com.habit.myPage.model;

import com.habit.myPage.DTO.*;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class MemoryMyPageRepository implements MyPageRepository{

    private final SqlSession sqlSession;

    @Override
    public Map<String,Object> getUserNameAndImg(String user_id) {
        return sqlSession.selectOne("mypage.getUserName",user_id);
    }

    @Override
    public int getMyEnergy(String user_id) {
        return sqlSession.selectOne("mypage.getMyEnergy",user_id);
    }

    @Override
    public int getMyReviewCount(String user_id) {
        return sqlSession.selectOne("mypage.getMyReviewCount",user_id);
    }

    @Override
    public UserInfoDTO getUserInfo(String user_id) {
        return sqlSession.selectOne("mypage.getUserInfo",user_id);
    }

    @Override
    public String getPass(String user_id) {
        return sqlSession.selectOne("mypage.getPass",user_id);
    }

    @Override
    public int updatePass(String user_id, String pw) {
        Map<String,String> params= new HashMap<>();
        params.put("user_id",user_id);
        params.put("user_pw",pw);
        return sqlSession.update("mypage.updatePass",params);
    }

    @Override
    public int updateUserInfo(UserInfoDTO infoDTO) {
        return sqlSession.update("mypage.updateUserInfo",infoDTO);
    }

    @Override
    public List<Map<String, Object>> getFromPayForOrder(String user_id) {
        return sqlSession.selectList("mypage.getFromPayForOrder",user_id);
    }

    @Override
    public List<OrderAllDTO> getPayDForOrder(String pay_no) {
        return sqlSession.selectList("mypage.getPayDForOrder",pay_no);
    }

    @Override
    public Map<String, Object> getOneForOrder(String pro_no) {
        return sqlSession.selectOne("mypage.getOneForOrder",pro_no);
    }

    @Override
    public Map<String, Object> getProForOrder(String pro_no) {
        return sqlSession.selectOne("mypage.getProForOrder",pro_no);
    }

    @Override
    public Map<String, Object> getFromPayForOrderDetail(String pay_no) {
        return sqlSession.selectOne("mypage.getFromPayForOrderDetail",pay_no);
    }

    @Override
    public List<OrderDetailDTO> getPayDForOrderDetail(String pay_no) {
        return sqlSession.selectList("mypage.getPayDForOrderDetail",pay_no);
    }

    @Override
    public OrderRefnDTO getRefnForOrderDetail(int payd_no) {
        return sqlSession.selectOne("mypage.getRefnForOrderDetail",payd_no);
    }

    @Override
    public int checkReviewWrite(int payd_no) {
        return sqlSession.selectOne("mypage.checkReviewWrite",payd_no);
    }

    @Override
    public ReviewWriteDTO getContInfo(Map<String, Object> params) {
        return sqlSession.selectOne("mypage.getContInfo",params);
    }

    @Override
    public ReviewWriteDTO getReview(int payd_no) {
        return sqlSession.selectOne("mypage.getReview",payd_no);
    }

    @Override
    public int insertReview(ReviewInsertDTO dto) {
        return sqlSession.insert("mypage.insertReview" ,dto);
    }

    @Override
    public int insertEnergy(EnergyDTO dto) {
        return sqlSession.insert("mypage.insertEnergy", dto);
    }

    @Override
    public int updateReview(ReviewInsertDTO dto) {
        return sqlSession.update("mypage.updateReview",dto);
    }

    @Override
    public RefundInfoDTO getInfoForRefund(int payd_no) {
        return sqlSession.selectOne("mypage.getInfoForRefund",payd_no);
    }

    @Override
    public int getCheckForEnergyRefund(String pay_no) {
        return sqlSession.selectOne("mypage.getCheckForEnergyRefund",pay_no);
    }

    @Override
    public int insertRefund(RefundInsertDTO dto) {
        return sqlSession.insert("mypage.insertRefund",dto);
    }

    @Override
    public int changeStatusPayd(int payd_no) {
        return sqlSession.update("mypage.changeStatusPayd",payd_no);
    }

    @Override
    public int insertEnergyRefund(EnergyDTO dto) {
        return sqlSession.insert("mypage.insertEnergyRefund",dto);
    }

    @Override
    public String getUserGrade(String user_id) {
        return sqlSession.selectOne("mypage.getUserGrade",user_id);
    }

    @Override
    public RefundResultDTO getResultRefund(int payd_no) {
        return sqlSession.selectOne("mypage.getResultRefund",payd_no);
    }
}
