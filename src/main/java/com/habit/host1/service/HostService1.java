package com.habit.host1.service;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

public interface HostService1 {

    List<Map<String, Object>> cateList ();
    List<Map<String, Object>> selectCate (String keyword);
    int contentInsert (Map<String, Object> map) throws IOException;
    List<Map<String, Object>> reviewList (Map<String, Object> map);
}
