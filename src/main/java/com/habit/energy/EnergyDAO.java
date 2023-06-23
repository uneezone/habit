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
}
