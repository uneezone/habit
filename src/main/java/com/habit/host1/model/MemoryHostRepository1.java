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


    // table cate
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


    // table cont
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

    // habit update를 위한 값 가져오기
    @Override
    public CategoryAndContentDTO contentSelectOne(int cont_no) {
        return sqlSession.selectOne("host1.contentSelectOne", cont_no);
    }

    // 콘텐츠 테이블 insert
    @Override
    public int insertCont(RequestContentValueDTO rciDTO) {
        return sqlSession.insert("host1.insertCont", rciDTO);
    }

    // habit 삭제
    @Override
    public int deleteContent(int cont_no) {
        return sqlSession.delete("host1.deleteContent", cont_no);
    }

    // habit 수정
    @Override
    public int updateContent(RequestContentValueDTO reqContValDTO) {
        return sqlSession.update("host1.updateCont", reqContValDTO);
    }



    // table one
    // 원데이 클래스 list 조회
    @Override
    public List<OneEntity> oneList(int cont_no) {
        return sqlSession.selectList("host1.oneList", cont_no);
    }

    // 원데이 클래스 테이블 insert
    @Override
    public int insertOne(List<OneEntity> list) {
        return sqlSession.insert("host1.insertOne", list);
    }

    // 원데이 클래스 테이블 delete
    @Override
    public int deleteOne(int cont_no) {
        return sqlSession.delete("host1.deleteOne", cont_no);
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



    // table prod
    // 인원권, 회차권 list 조회
    @Override
    public List<ProdEntity> prodList(int cont_no) {
        return sqlSession.selectList("host1.prodList", cont_no);
    }

    // 인원권, 회차권 테이블 insert
    @Override
    public int insertProd(List<ProdEntity> list) {
        return sqlSession.insert("host1.insertProd", list);
    }

    // 인원권, 회차권 테이블 delete
    @Override
    public int deleteProd(int cont_no) {
        return sqlSession.delete("host1.deleteProd", cont_no);
    }




    // table payd
    // 환불 insert를 위한 주문서, 주문상세 select
    @Override
    public SelectPayDetailForInsertRefundDTO selectPayDetailForInsertRefund(int payd_no) {
        return sqlSession.selectOne("host1.selectPayDetailForInsertRefund", payd_no);
    }

    @Override
    public List<String> selectPayDetailStatus(int payd_no) {
        return sqlSession.selectList("host1.selectPayDetailStatus", payd_no);
    }



    // table refn
    @Override
    public int insertRefund(SelectPayDetailForInsertRefundDTO spdfirDTO) {
        return sqlSession.insert("host1.InsertRefund", spdfirDTO);
    }




    // table review
    // 리뷰 테이블 불러오기
    @Override
    public List<ResponseReviewDTO> reviewList(RequestReviewDTO reqReviewDTO) {
        return sqlSession.selectList("host1.reviewList", reqReviewDTO);
    }

    // 리뷰 검색 count 수 가져오기
    @Override
    public int totalReviewCount(RequestReviewDTO reqReviewDTO) {
        return sqlSession.selectOne("host1.reviewCount", reqReviewDTO);
    }

    // 리뷰 삭제 (상태변경)
    @Override
    public int reviewDelete(int review_no) {
        return sqlSession.update("host1.reviewDelete", review_no);
    }



    // table question
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

    // 호스트 이미지 가져오기
    @Override
    public String getHostImg(String host_id) {
        return sqlSession.selectOne("host2.getHostImg", host_id);
    }

    // 에너지 테이블 insert
    @Override
    public int insertEnergy(EnergyEntity energyEntity) {
        return sqlSession.insert("host1.insertEnergy", energyEntity);
    }
}
