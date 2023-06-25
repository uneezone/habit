package com.habit.host1.service;
//import com.habit.host1.DTO.RequestContentInsertDTO;
//import com.habit.host1.DTO.RequestReviewDTO;
//import com.habit.host1.DTO.ResponseReviewDTO;

import com.habit.host1.DTO.*;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface HostService1 {

    List<Map<String, Object>> cateList ();
    List<Map<String, Object>> selectCate (String keyword);
    int contentInsert (RequestContentValueDTO rciDTO) throws IOException;
    int contentUpdate(RequestContentValueDTO rciDTO) throws IOException;

    List<ResponseReviewDTO> reviewList (RequestReviewDTO reqReviewDTO);
    int totalReviewCount(RequestReviewDTO requestReviewDTO);
    int reviewDelete(int no);

    List<ResponseInquiryDTO> inquiryList(RequestInquiryDTO requestInquiryDTO);



    List<ResponseContentListDTO> contentList (RequestContentListDTO requestContentListDTO);
    void contentListCount(RequestContentListDTO requestContentListDTO);




    List<ResponseReservationDTO> reservationList(RequestReservationDTO requestReservationDTO);
    int totalReservationCount(RequestReservationDTO requestReservationDTO);

    int reservationStatusChangeAndRefundInsert(RequestReservationStatusChangeDTO requestReservationStatusChangeDTO);
    int deleteContent(int no);
    RequestContentValueDTO contentSelectOne(int no);
    String getHostImg(String host_id);

}
