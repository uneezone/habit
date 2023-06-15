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


    public  List<Map<String, Object>> category() {
        return sqlSession.selectList("product.category");
    }

    public  List<Map<String, Object>> list(String cate_large) {
        return sqlSession.selectList("product.list", cate_large);
    }

    public  List<Map<String, Object>> middle(String cate_large) {
        return sqlSession.selectList("product.middle", cate_large);
    }

    public Map<String, Object> detail(int cont_no) {
         return sqlSession.selectOne("product.detail", cont_no);
    }


}
