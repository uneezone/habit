package com.habit.host2.model;

import com.habit.host2.entity.HostEditDTO;
import com.habit.host2.entity.HostInfoDTO;
import com.habit.host2.entity.NewHostDTO;
import com.habit.host2.entity.ProductDTO;

import java.util.List;
import java.util.Map;

public interface HostRepository2 {

    //유저가 호스트인지 확인
    String checkHost(String userId);

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

    //해당 호스트 회차권/인원권 판매 및 환불된거 가져오기
    List<ProductDTO> getProduct(String hostId);

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
}
