package com.habit.host1.model;

import com.habit.host1.DTO.*;

import java.util.List;
import java.util.Map;

public interface HostRepository1 {

    List<Map<String, Object>> cateList();
    List<Map<String, Object>> selectCate(String keyword);
    String selectCateNo(String keyword);
    int insertCont(RequestContentInsertDTO requestContentInsertDTO);
    int insertOne(List<OneEntity> list);
    int insertProd(List<ProdEntity> list);
    List<ResponseReviewDTO> reviewList(RequestReviewDTO requestReviewDTO);
    int totalCount(RequestReviewDTO requestReviewDTO);
    List<ResponseInquiryDTO> inquiryList(RequestInquiryDTO requestInquiryDTO);
    int inquiryCount(RequestInquiryDTO requestInquiryDTO);
    List<ResponseContentListDTO> contentList (RequestContentListDTO requestContentListDTO);

    int contentListCount(RequestContentListDTO requestContentListDTO);

    List<ResponseReservationDTO> reservationList(RequestReservationDTO requestReservationDTO);
    int reservationListCount(RequestReservationDTO requestReservationDTO);
    int reservationStatusChange(RequestReservationStatusChangeDTO requestReservationStatusChangeDTO);
    SelectPayDetailForInsertRefundDTO selectPayDetailForInsertRefund(int no);
    List<String> selectPayDetailStatus(int no);
    int insertRefund(SelectPayDetailForInsertRefundDTO selectPayDetailForInsertRefundDTO);
    int deleteContent(int no);

    CategoryAndContentDTO contentSelectOne(int no);

    List<OneEntity> oneList(int no);
    List<ProdEntity> prodList(int no);

}
