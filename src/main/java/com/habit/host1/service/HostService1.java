package com.habit.host1.service;
import java.util.List;
import java.util.Map;

public interface HostService1 {

    List<Map<String, Object>> cateList ();
    List<Map<String, Object>> selectCate (String keyword);
    int contentInsert (Map<String, Object> map);
}
