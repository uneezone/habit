package com.habit.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDAO {

    public CartDAO() {
        System.out.println("----CartDAO 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;

    public int cartInsert(CartDTO cartDTO) {
        return sqlSession.insert("cart.insert", cartDTO);
    }

    public List<CartDTO> oneday_list(String user_id) {
        return sqlSession.selectList("cart.list1", user_id);
    }

    public List<CartDTO> prod_list(String user_id) {
        return sqlSession.selectList("cart.list2", user_id);
    }


    public List<CartDTO> selectedItemsInfo(HashMap<String, Object> map){
        return sqlSession.selectList("cart.selectedItemsInfo", map);
    }


    public int cartDelete(HashMap<String, Object> map) {
        return sqlSession.delete("cart.delete", map);
    }

}
