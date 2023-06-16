package com.habit.host1.model;

import com.habit.host1.entity.OneDTO;
import com.habit.host1.entity.ProdDTO;

import java.util.List;
import java.util.Map;

public interface HostRepository1 {

    List<Map<String, Object>> cateList();

    List<Map<String, Object>> selectCate(String keyword);

    String selectCateNo(String keyword);

    int insertCont(Map<String, Object> map);

    int insertOne(List<OneDTO> list);
    int insertProd(List<ProdDTO> list);
}
