package com.habit.host1.model;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class MemoryHostRepository1 implements HostRepository1{

    private final SqlSession sqlSession;

    // 카테고리 대분류 list 불러오기
    @Override
    public List<Map<String, Object>> cateList() {
        return sqlSession.selectList("product1.cateListLage");
    }

    // 대분류 선택에 따른 중분류 list 불러오기
    @Override
    public List<Map<String, Object>> selectCate(String cateLarge) {
        return sqlSession.selectList("product1.cateListMiddle", cateLarge);
    }

    // 카테고리코드 가져오기
    @Override
    public String selectCateNo(String cate_middle) {
        return sqlSession.selectOne("product1.selectCateNo", cate_middle);
    }

    // 콘텐츠 테이블 insert
    @Override
    public int insertCont(Map<String, Object> map) {
        return sqlSession.insert("product1.insertCont", map);
    }

    // 원데이 클래스 테이블 insert
    @Override
    public int insertOne(List<Map<String, String>> list) {
        return sqlSession.insert("product1.insertOne", list);
    }

    // 인원권, 회차권 테이블 insert
    @Override
    public int insertProd(List<Map<String, String>> list) {
        return sqlSession.insert("product1.insertProd", list);
    }
}
