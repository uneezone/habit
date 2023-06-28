package com.habit.cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class PayDAO {

    public PayDAO(){
        System.out.println("----PayDAO 객체 생성됨");
    }

    @Autowired
    SqlSession sqlSession;

    public String pay_no(String date){
        return sqlSession.selectOne("pay.pay_no", date);
    }

    public int payInsert(PayDTO payDTO){
        return sqlSession.insert("pay.pay_insert",payDTO);
    }

    public int paydInsert(PaydDTO paydDTO){
        return sqlSession.insert("pay.payd_insert", paydDTO);
    }


    public int cartDelete(HashMap<String, Object> map4){
        return sqlSession.delete("pay.cartDelete", map4);
    }

    public int getOneStock(String pro_no){
        return sqlSession.selectOne("pay.getOneStock", pro_no);
    }

    public int getOneRefn(String pro_no){
        return sqlSession.selectOne("pay.getOneRefn", pro_no);
    }

    public int updateOneStatus(String pro_no){
        return sqlSession.update("pay.updateOneStatus", pro_no);
    }

    public int getProdStock(String pro_no){
        return sqlSession.selectOne("pay.getProdStock", pro_no);
    }

    public int getProdRefn(String pro_no){
        return sqlSession.selectOne("pay.getProdRefn", pro_no);
    }

    public int updateProdStatus(String pro_no){
        return sqlSession.update("pay.updateProdStatus", pro_no);
    }


    public Map<String, Object> showPurchasedOneInfo(String pay_no){
        return sqlSession.selectOne("pay.showPurchasedOneInfo", pay_no);
    }


    public List<Map<String, Object>> getInfoForPayDonePage(String pay_no){
        return sqlSession.selectList("pay.getInfoForPayDonePage", pay_no);
    }




}
