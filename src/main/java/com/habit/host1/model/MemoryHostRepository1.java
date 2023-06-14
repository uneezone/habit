package com.habit.host1.model;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class MemoryHostRepository1 {
    // repository
    private final SqlSession sqlSession;
}
