package com.habit.host1.model;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class DAO {
    // repository
    private final SqlSession sqlSession;
}
