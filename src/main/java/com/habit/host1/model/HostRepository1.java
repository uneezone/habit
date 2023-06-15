package com.habit.host1.model;

import java.util.List;
import java.util.Map;

public interface HostRepository1 {

    List<Map<String, Object>> cateList();

    List<Map<String, Object>> selectCate(String keyword);

    String selectCateNo(String keyword);

    int insertCont(Map<String, Object> map);

    int insertOne(List<Map<String, String>> list);
    int insertProd(List<Map<String, String>> list);
}
