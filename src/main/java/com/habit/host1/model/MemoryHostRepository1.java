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
        return sqlSession.selectList("host1.cateListLage");
    }

    // 대분류 선택에 따른 중분류 list 불러오기
    @Override
    public List<Map<String, Object>> selectCate(String cateLarge) {
        return sqlSession.selectList("host1.cateListMiddle", cateLarge);
    }

    // 카테고리코드 가져오기
    @Override
    public String selectCateNo(String cate_middle) {
        return sqlSession.selectOne("host1.selectCateNo", cate_middle);
    }

    // 콘텐츠 테이블 insert
    @Override
    public int insertCont(RequestContentInsertDTO rciDTO) {
        return sqlSession.insert("host1.insertCont", rciDTO);
    }

    // 원데이 클래스 테이블 insert
    @Override
    public int insertOne(List<OneEntity> list) {
        return sqlSession.insert("host1.insertOne", list);
    }

    // 인원권, 회차권 테이블 insert
    @Override
    public int insertProd(List<ProdEntity> list) {
        return sqlSession.insert("host1.insertProd", list);
    }

    // 리뷰 테이블 불러오기
    @Override
    public List<ResponseReviewDTO> reviewList(RequestReviewDTO reqReviewDTO) {
        return sqlSession.selectList("host1.reviewList", reqReviewDTO);
    }

    // 리뷰 검색 count 수 가져오기
    @Override
    public int totalCount(RequestReviewDTO reqReviewDTO) {
        return sqlSession.selectOne("host1.reviewCount", reqReviewDTO);
    }

    // 문의사항 검색 List
    @Override
    public List<ResponseInquiryDTO> inquiryList(RequestInquiryDTO reqInqDTO) {
        return sqlSession.selectList("host1.inquiryList", reqInqDTO);
    }

    // 문의사항 검색 결과 count
    @Override
    public int inquiryCount(RequestInquiryDTO reqInqDTO) {
        return sqlSession.selectOne("host1.inquiryCount", reqInqDTO);
    }

    // habit 목록 검색 List
    @Override
    public List<ResponseContentListDTO> contentList(RequestContentListDTO reqContListDTO) {
        return sqlSession.selectList("host1.contentList", reqContListDTO);
    }

    // habit 목록 검색 List count
    @Override
    public int contentListCount(RequestContentListDTO reqContListDTO) {
        return sqlSession.selectOne("host1.contentListCount", reqContListDTO);
    }

    // habit 삭제
    @Override
    public int deleteContent(int cont_no) {
        return sqlSession.delete("host1.deleteContent", cont_no);
    }

    // habit update를 위한 값 가져오기
    @Override
    public CategoryAndContentDTO contentSelectOne(int cont_no) {
        return sqlSession.selectOne("host1.contentSelectOne", cont_no);
    }

    @Override
    public List<OneEntity> oneList(int cont_no) {
        return sqlSession.selectList("host1.oneList", cont_no);
    }

    @Override
    public List<ProdEntity> prodList(int cont_no) {
        return sqlSession.selectList("host1.prodList", cont_no);
    }

    // 원데이 클래스 예약건 List 조회
    @Override
    public List<ResponseReservationDTO> reservationList(RequestReservationDTO reqReservDTO) {
        return sqlSession.selectList("host1.reservationList", reqReservDTO);
    }

    // 원데이클래스 예약건 List count
    @Override
    public int reservationListCount(RequestReservationDTO reqReservDTO) {
        return sqlSession.selectOne("host1.reservationListCount", reqReservDTO);
    }

    // 원데이클래스 예약 상태 변경
    @Override
    public int reservationStatusChange(RequestReservationStatusChangeDTO reqReservStatChg) {
        return sqlSession.update("host1.reservationStatusChange", reqReservStatChg);
    }

    // 환불 insert를 위한 주문서, 주문상세 select
    @Override
    public SelectPayDetailForInsertRefundDTO selectPayDetailForInsertRefund(int payd_no) {
        return sqlSession.selectOne("host1.selectPayDetailForInsertRefund", payd_no);
    }

    @Override
    public List<String> selectPayDetailStatus(int payd_no) {
        return sqlSession.selectList("host1.selectPayDetailStatus", payd_no);
    }

    @Override
    public int insertRefund(SelectPayDetailForInsertRefundDTO spdfirDTO) {
        return sqlSession.insert("host1.InsertRefund", spdfirDTO);
    }
}
