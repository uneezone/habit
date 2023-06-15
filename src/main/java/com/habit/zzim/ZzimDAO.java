package com.habit.zzim;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ZzimDAO {

    public ZzimDAO(){
        System.out.println("----ZzimDAO() 객체생성됨");
    }//end

    @Autowired
    SqlSession sqlSession;

    //public List<ZzimDTO> list()


}
