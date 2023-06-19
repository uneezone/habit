package com.habit.host1.model;

import com.habit.host1.DTO.*;

import java.util.List;
import java.util.Map;

public interface HostRepository1 {

    List<Map<String, Object>> cateList();

    List<Map<String, Object>> selectCate(String keyword);

    String selectCateNo(String keyword);

    int insertCont(RequestContentInsertDTO rciDTO);

    int insertOne(List<OneEntity> list);
    int insertProd(List<ProdEntity> list);

    List<ResponseReviewDTO> reviewList(RequestReviewDTO reqReviewDTO);

    int totalCount(RequestReviewDTO reqReviewDTO);
}
