package com.habit.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {

    public PayDAO(){
        System.out.println("----PayDAO 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;



}
