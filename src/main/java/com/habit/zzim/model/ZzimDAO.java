package com.habit.zzim.model;

import com.habit.zzim.DTO.ZzimDTO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Iterator;
import java.util.List;
import java.util.Map;


@Repository
public class ZzimDAO {

    public ZzimDAO(){
        System.out.println("----ZzimDAO() 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;

    public List<Integer> getContNoForZzim(String user_id){
        return sqlSession.selectList("zzim.getContNoForZzim",user_id);
    }

    public List<ZzimDTO> getZzimList(List<Integer> cont_nos){
        return sqlSession.selectList("zzim.getZzimList",cont_nos);
    }

    public int zzimInsert(Map<String,Object> params){
        return sqlSession.insert("zzim.zziminsert",params);
    }

    public int zzimDel(Map<String, Object> params){
        return sqlSession.delete("zzim.zzimDel",params);
    }

    public List<Integer> zzimGet(String user_id){
        return sqlSession.selectList("zzim.zzimGet",user_id);
    }


}
