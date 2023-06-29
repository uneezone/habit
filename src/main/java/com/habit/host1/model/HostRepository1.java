package com.habit.host1.model;

import com.habit.host1.DTO.*;

import java.util.List;
import java.util.Map;

public interface HostRepository1 {

    // table cate
    List<Map<String, Object>> cateList();
    List<Map<String, Object>> selectCate(String keyword);
    String selectCateNo(String keyword);


    // table cont
    List<ResponseContentListDTO> contentList (RequestContentListDTO requestContentListDTO);
    int contentListCount(RequestContentListDTO requestContentListDTO);
    CategoryAndContentVO contentSelectOne(int no);
    int insertCont(RequestContentValueDTO requestContentValueDTO);
    int deleteContent(int no);
    int updateContent(RequestContentValueDTO requestContentValueDTO);
    int contentPurchaseCheck(Map<String, Object> map);

    // table one
    List<OneEntity> oneList(int no);
    int insertOne(List<OneEntity> list);
    int updateOne(Map<String, Object> updateList);
    int deleteOne(int no);

    List<ResponseReservationDTO> reservationList(RequestReservationDTO requestReservationDTO);
    int reservationListCount(RequestReservationDTO requestReservationDTO);
    int reservationStatusChange(RequestReservationStatusChangeDTO requestReservationStatusChangeDTO);

    int optionPurchaseCheck(String pro_no);
    int deleteOption(RequestOptionDeleteDTO requestOptionDeleteDTO);



    // table prod
    List<ProdEntity> prodList(int no);
    int insertProd(List<ProdEntity> list);
    int updateProd(Map<String, Object> updateList);

    int deleteProd(int no);



    // table payd
    SelectPayDetailForInsertRefundDTO selectPayDetailForInsertRefund(int no);
    List<String> selectPayDetailStatus(int no);


    // table refn
    int insertRefund(SelectPayDetailForInsertRefundDTO selectPayDetailForInsertRefundDTO);


    // table review
    List<ResponseReviewDTO> reviewList(RequestReviewDTO requestReviewDTO);
    int totalReviewCount(RequestReviewDTO requestReviewDTO);
    int reviewDelete(int no);


    // table question
    List<ResponseInquiryDTO> inquiryList(RequestInquiryDTO requestInquiryDTO);
    int inquiryCount(RequestInquiryDTO requestInquiryDTO);


    // table host
    String getHostImg(String id);


    // table energy
    int insertEnergy(EnergyEntity energyEntity);


    // table user
    String selectUserLevel(String id);


}
