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

    @Override
    public List<Map<String, Object>> cateList() {
        return sqlSession.selectList("product1.cateListLage");
    }

    @Override
    public List<Map<String, Object>> selectCate(String cateLarge) {
        return sqlSession.selectList("product1.cateListMiddle", cateLarge);
    }
}
