package com.habit.host2.model;

import com.habit.host2.entity.*;

import java.util.List;
import java.util.Map;

public interface HostRepository2 {

    //유저가 호스트인지 확인
    String checkHost(String userId);

    //==홈스트 홈 정보
    //호스트기준 콘텐츠 코드와 상품코드 가져오기
    List<Integer> getContNoForHome(String userId);

    //누적판매금액+전체건수 & 이번달 판매금액
    Map<String,Object> getAllPriceForHome(List<String> pro_nos);
    Long getMonthPriceForHome(List<String> pro_nos);

    //이번달 취소건
    Long getMonthCancel(List<String> pro_nos);

    //전체리뷰수, 이번달 평균별점
    Map<String,Object> getReviewAndStar(List<Integer> cont_nos);

    //문의률
    //유저 문읜건수
    Long getQuestionUserCount(List<Integer> cont_nos);

    //호스트응답률
    Long getQuestionHostCount(String host_id);




    //호스트가 가입시 전화번호 미입력하면 유저단에서 가져옴
    String getPhoneNumber(String userId);


    //유저 호스트 가입시키기
    void newHost(NewHostDTO dto);

    //유저테이블단에서 user_grade H로 바꾸기
    void updateUserGrade(String userId);

    //호스트 정보 가져오기
    HostInfoDTO getHostInfo(String userId);

    //호스트 정보 수정
    void editHostInfo(HostEditDTO dto);

    //필터링조건으로 전제상품갯수 조회
    int getProductsLength(SearchProDTO dto);

    //해당 호스트 회차권/인원권 판매 및 환불된거 가져오기
    List<ProductDTO> getProduct(SearchProDTO dto);

    //판매관리 상태 변경시 R-> Y
    void updatePaydStatus(Long payd_no, String status);

    //주문서번호 알아오기
    String getPayNo(Long payd_no);

    //주문서번호 기준으로 RO혹은 NRO있는지 확인
    Long getRefnCount(String pay_no);

    //환불을 위한 결제수단 가져오기
    String getPayMethod(String pay_no);

    //주문상세번호 기준 제품의 금액과 구매수량,상품코드,유저아이디
    Map<String, Object> getInfoByPaydNo(Long payd_no);

    //호스트가 취소시 환불테이블 추가
    void insertRefund(Map<String,Object> params);

    //환불할 에너지 값가져오기
    Integer getRefundPoint(String pay_no);

    //에너지 테이블에 로그남기기
    void insertEnergy(Map<String,Object> params);

    //필터링을 위한 것들
    List<Map<String, Object>> getProductNames(String host_id);

    //상품에대한 옵션들 가져오기
    List<Map<String, Object>> getProductOptions(Long cont_no);

    //상품구매한 회원들 정보 가져오기
    Map<String,Object> showUserInfo(String user_id);

    //===========정산서

    //정산tb리스트 가져오기
    List<AdjustInfoDTO> getAdjustList(SearchAdjustDTO dto);

    //정산갯수
    Integer getAdjustListLength(SearchAdjustDTO dto);

    //정산상세
    List<Map<String, Object>> getAdjustDetail(String calc_no);

    //정산에 입력된 계좌 가져오기
    Map<String,Object> getCalcAccount(String calc_no);

    //옵션명가져오기
    String getOptionName(Map<String,Object> params);


    //================= 정산insert
    //판매종료일기준 판매가 완료된 콘텐츠 테이블에서 정산테이블에 없는 콘텐츠 코드
    List<Integer> getContNoForAdjust(String host_id);

    //콘텐츠 코드 판매 상태 N으로
    void updateContStatus(int cont_no);

    //원데이 테이블 상태꾸기 위해 판매완료 옵션코드 알기
    List<String> getOneProNo(int cont_no);

    //원데이테이블 상태 바꾸기
    void updateOneStatus(String pro_no);

    //회차권 테이블 상태 바꾸기 위해 판매완료 옵션코드 알기
    List<String> getProdProNo(int cont_no);

    //회차권테이블 상태 바꾸기
    void updateProdStatus(String pro_no);

    //주문상세코드 가져오기
    List<Integer> getPaydNo(List<String> pro_no);

    //주문상세상태 바꾸기
    void updatePaydStatus(List<Integer> payd_no);

    //======정산서 인저트 진짜시작
    List<String> getAdjustProNo(int cont_no);

    //해당 상품이 판매가되었는지 확인
    int checkSelled(String pro_no);
    //주문상세에서 필요한 정보 다가져와
    List<AdjustPaydDTO> getAdjustPaydDTO(List<String> pro_nos);

    //정산코드 만들기
    String findCalcNo(String date);

    //컨텐츠 테이블에서 필요하나 내용 가져와
    AdjustContDTO getAdjustContDTO(int cont_no);

    //호스트 정산계좌 가져오기
    Map<String,Object> getHostAccount(String host_id);

    //정산테이블 insert
    void insertCalc(CalcDTO dto);

    //정산상세 insert
    void insertCalcD(CalcdDTO dto);

    //==========정산지급

    //지급전 정산계좌 입력했는지 확인
    int checkAccount(String host_id);
    void updateCalcStatus(String calc_no);


}
