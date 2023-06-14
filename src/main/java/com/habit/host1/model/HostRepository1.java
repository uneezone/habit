package com.habit.host1.model;

import java.util.List;
import java.util.Map;

public interface HostRepository1 {

    List<Map<String, Object>> cateList();

    List<Map<String, Object>> selectCate(String keyword);
}
