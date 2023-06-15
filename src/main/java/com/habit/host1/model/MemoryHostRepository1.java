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
}
