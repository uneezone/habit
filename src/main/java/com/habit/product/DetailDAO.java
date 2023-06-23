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

    public List<Map<String, Object>> detailproduct(int cont_no) {
        return sqlSession.selectList("detail.detailproduct", cont_no);
    }

    public List<Map<String, Object>> contreview(int cont_no) {
        return sqlSession.selectList("detail.contreview", cont_no);
    }

    public Map<String, Object> contreviewcnt(int cont_no) {
        return sqlSession.selectOne("detail.contreviewcnt", cont_no);
    }

    public Map<String, Object> contzzim(int cont_no) {
        return sqlSession.selectOne("detail.contzzim", cont_no);
    }

    public Map<String, Object> hostcontcnt(String host_id) {
        return sqlSession.selectOne("detail.hostcontcnt", host_id);
    }

    public Map<String, Object> hostreviewcnt(String host_id) {
        return sqlSession.selectOne("detail.hostreviewcnt", host_id);
    }

    public Map<String, Object> hostzzimcnt(String host_id) {
        return sqlSession.selectOne("detail.hostzzimcnt", host_id);
    }


}
