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

// 아이템 리스트
    public  List<Map<String, Object>> list(String cate_large) {
        return sqlSession.selectList("product.list", cate_large);
    }

//    리스트와 리뷰 연결 (위/아래)
    public List<Integer> contNoList(String cate_large) {
    return sqlSession.selectList("product.contNoList", cate_large);
}

// 리뷰
    public  Map<String, Object> star(int cont_no) {
        return sqlSession.selectOne("product.star", cont_no);
    }

//  가격
    public  Map<String, Object> price(int cont_no) {
    return sqlSession.selectOne("product.price", cont_no);
}

// 중분류
     public  List<Map<String, Object>> middle(String cate_large) {
        return sqlSession.selectList("product.middle", cate_large);
    }

//    상품상세
    public Map<String, Object> detail(int cont_no) {
         return sqlSession.selectOne("product.detail", cont_no);
    }


}
