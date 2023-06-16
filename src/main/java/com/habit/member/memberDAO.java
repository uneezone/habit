package com.habit.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class memberDAO {
    // repository

    @Autowired
    private static SqlSession sqlSession;

    public memberDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 회원 정보를 데이터베이스에 저장하는 메서드
    public static int insert(Map<String, Object> map) {
        return sqlSession.insert("member.insert", map);
    }


}






