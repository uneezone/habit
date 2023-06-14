package com.habit.host1.service;

import com.habit.host1.model.MemoryHostRepository1;
import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@org.springframework.stereotype.Service
public class HostServiceImpl1 implements HostService1 {

    private final MemoryHostRepository1 memoryHostRepository1;

    // 카테고리 목록 불러오기
    @Override
    public List<Map<String, Object>> cateList () {
        return memoryHostRepository1.cateList();
    }

    // 대분류에 따른 중분류 가져오기
    @Override
    public List<Map<String, Object>> selectCate(String keyword) {
        return memoryHostRepository1.selectCate(keyword);
    }

    //content insert service
    @Override
    public void contentInsert (String userId, Map<String, Object> map) {
    }
}
