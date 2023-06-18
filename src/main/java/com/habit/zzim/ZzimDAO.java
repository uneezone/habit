package com.habit.zzim;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


@Repository
public class ZzimDAO {

    public ZzimDAO(){
        System.out.println("----ZzimDAO() 객체생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> zzimlist(String user_id){
        return sqlSession.selectList("zzim.zzim_info", user_id);
    }


    /*public Map<String, Object> zzimlist2(){
        return sqlSession.selectMap("zzim.select_user_zzimlist");
    }*/


}
