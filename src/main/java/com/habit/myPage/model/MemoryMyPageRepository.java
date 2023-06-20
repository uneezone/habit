package com.habit.myPage.model;

import com.habit.myPage.DTO.UserInfoDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
