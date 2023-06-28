package com.habit.energy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class EnergyDAO {

    public EnergyDAO(){
        System.out.println("----EnergyDAO 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;


    // 현재 가지고 있는 에너지 포인트 값 가져오기
    public int getSavedEnergy(String user_id) {
        int energy=sqlSession.selectOne("energy.getSavedEnergyPoint", user_id);
        return energy;
    }


    // 누적 금액 구하기
    public int getAccumulatedPurchasePrice(String user_id){
        int accumulatedPurchasePrice=sqlSession.selectOne("energy.getAccumulatedPrice", user_id);
        return accumulatedPurchasePrice;
    }

    // 회원등급 수정
    public int updateUserLeveltoA(String user_id){
        return sqlSession.update("energy.updateUserLeveltoA", user_id);
    }

    public int updateUserLeveltoS(String user_id){
        return sqlSession.update("energy.updateUserLeveltoS", user_id);
    }


    // 회원등급 조회
    public String getUserGrade(String user_id){
        return sqlSession.selectOne("energy.getUserGrade", user_id);
    }

    // 실제 결제한 금액, 유저아이디, 유저등급 주문서번호로 조회해서 가져오기
    public Map<String, Object> getRealPay(String pay_no){
        return sqlSession.selectOne("energy.getRealPay", pay_no);
    }

    public int insertEnergy(Map<String, Object> map){
        return sqlSession.insert("energy.insertEnergy", map);
    }

    public int insertUseEnergy(Map<String, Object> map3){
        return sqlSession.insert("energy.insertUseEnergy", map3);
    }



}
