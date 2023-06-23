package com.habit.energy;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
        int accumulatedPurchasePrice=sqlSession.selectOne("energy.getAccumulatedPurchasePrice", user_id);
        return accumulatedPurchasePrice;
    }




}
