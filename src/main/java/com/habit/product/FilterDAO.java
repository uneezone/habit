package com.habit.product;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@Repository
public class FilterDAO {

    @Autowired
    SqlSession sqlSession;

    // 중분류 클릭 리스트
    public List<Map<String, Object>> midFilter(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.midFilter",params);
    }

    //중분류 선택 -> 인기 리스트 전체
    public List<Map<String, Object>> midHotList(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.midHotList", params);
    }

    //중분류 선택 -> 요약페이지 인기 상위 4개
    public List<Map<String, Object>> midHotTop(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.midHotTop", params);
    }

    //인기&전체 페이지 수량
    public Integer midHotListCount(String cate_large, String cate_middle){
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectOne("product.midHotListCount", params);
    }

    //신규 리스트
    public List<Map<String, Object>> midNewList(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.midNewList", params);
    }

    //요약페이지 신규 상위 4개
    public List<Map<String, Object>> midNewTop(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.midNewTop", params);
    }

    //신규 페이지 수량
    public Integer midNewListCount(String cate_large, String cate_middle){
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectOne("product.midNewListCount", params);
    }

    //중분류 -> 필터 모달

    public List<Map<String, Object>> selectMidByPopularity(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.selectMidByPopularity", params);
    }

    public List<Map<String, Object>> selectMidByDate(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.selectMidByDate", params);
    }

    public List<Map<String, Object>> selectMidByRating(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.selectMidByRating", params);
    }

    public List<Map<String, Object>> selectMidByHighPrice(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.selectMidByHighPrice", params);
    }

    public List<Map<String, Object>> selectMidByLowPrice(String cate_large, String cate_middle) {
        Map<String, String> params = new HashMap<>();
        params.put("cate_large", cate_large);
        params.put("cate_middle", cate_middle);
        return sqlSession.selectList("product.selectMidByLowPrice", params);
    }

}
