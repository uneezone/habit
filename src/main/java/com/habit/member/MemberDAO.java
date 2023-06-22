package com.habit.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class MemberDAO {
    // repository

    @Autowired
    private static SqlSession sqlSession;

    public MemberDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    // 회원 정보를 데이터베이스에 저장하는 메서드
    public  int insert(Map<String, Object> map) {

        return sqlSession.insert("member.insert", map);
    }
    //로그인
    public MemberDTO login(MemberDTO dto) {

        return sqlSession.selectOne("member.Login", dto);
    }

    //아이디 찾기
    public String findId(Map<String,Object> map) {

        return sqlSession.selectOne("member.findId", map);
    }


}





