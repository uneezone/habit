package com.habit.host1.model;

import com.habit.host1.DTO.*;
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
    public int insertCont(RequestContentInsertDTO rciDTO) {
        return sqlSession.insert("product1.insertCont", rciDTO);
    }

    // 원데이 클래스 테이블 insert
    @Override
    public int insertOne(List<OneEntity> list) {
        return sqlSession.insert("product1.insertOne", list);
    }

    // 인원권, 회차권 테이블 insert
    @Override
    public int insertProd(List<ProdEntity> list) {
        return sqlSession.insert("product1.insertProd", list);
    }

    // 리뷰 테이블 불러오기
    @Override
    public List<ResponseReviewDTO> reviewList(RequestReviewDTO reqReviewDTO) {
        return sqlSession.selectList("product1.reviewList", reqReviewDTO);
    }

    // 리뷰 검색 count 수 가져오기
    @Override
    public int totalCount(RequestReviewDTO reqReviewDTO) {
        return sqlSession.selectOne("product1.reviewCount", reqReviewDTO);
    }
}
