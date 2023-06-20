package com.habit.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class DetailDAO {

    @Autowired
    SqlSession sqlSession;

    public Map<String, Object> hostprofile(int cont_no) {
        return sqlSession.selectOne("detail.hostprofile", cont_no);
    }

}
