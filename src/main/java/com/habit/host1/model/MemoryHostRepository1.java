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
        return sqlSession.selectList("product.cateListLage");
    }

    // 대분류 선택에 따른 중분류 list 불러오기
    @Override
    public List<Map<String, Object>> selectCate(String cateLarge) {
        return sqlSession.selectList("product.cateListMiddle", cateLarge);
    }

    // 카테고리코드 가져오기
    @Override
    public String selectCateNo(String cate_middle) {
        return sqlSession.selectOne("product.selectCateNo", cate_middle);
    }

    // 콘텐츠 insert
    @Override
    public int insertCont(Map<String, Object> map) {
        return sqlSession.insert("product.insertCont", map);
    }
}
