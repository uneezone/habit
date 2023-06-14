package com.habit.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductDAO {

    public ProductDAO() {
        System.out.println("-----Product() 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;

    public List<Map<String, Object>> list() {
        return sqlSession.selectList("product.list");
    }

}
