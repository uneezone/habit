package com.habit.member;

import com.habit.host1.DTO.RequestFindPasswordDTO;
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

    public int inserEnery(String user_id){
        return sqlSession.insert("member.insertEnergy",user_id);
    }

    //아이디 중복확인
    public int idCheck(String user_id) {
        return sqlSession.selectOne("member.idCheck" , user_id);
    }
    //로그인
    public MemberDTO login(MemberDTO dto) {

        return sqlSession.selectOne("member.Login", dto);
    }

    //아이디 찾기
    public MemberDTO findId(String user_email) {

        return sqlSession.selectOne("member.findId", user_email);
    }

    //비밀번호 찾기
    public String findPw(MemberDTO dto){
        return  sqlSession.selectOne("member.findPw", dto);
    }

    // 비밀번호 update
    public int updatePW (RequestFindPasswordDTO reqFindPWDTO) {
        return sqlSession.update("member.updatePassword", reqFindPWDTO);
    }
}





