package com.habit.zzim;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;




@Repository
public class ZzimDAO {

    public ZzimDAO(){
        System.out.println("----ZzimDAO() 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;


    public List<Map<String, Object>> zzimlist_one(String user_id) {
        return sqlSession.selectList("zzim.zzimlist_one",user_id);
    }

    public List<Map<String, Object>> zzimlist_two(String user_id) {
        return sqlSession.selectList("zzim.zzimlist_two", user_id);
    }

    public List<Map<String, Integer>> min_prod_price(String user_id){
        return sqlSession.selectList("zzim.min_price", user_id);
    }

    public void zzimInsert(Map<String,Object> params){
        sqlSession.insert("zzim.zziminsert",params);
    }




}
