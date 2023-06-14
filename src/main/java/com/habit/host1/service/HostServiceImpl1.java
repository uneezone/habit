package com.habit.host1.service;

import com.habit.host1.model.MemoryHostRepository1;
import lombok.RequiredArgsConstructor;
import org.springframework.ui.Model;

@RequiredArgsConstructor
@org.springframework.stereotype.Service
public class HostServiceImpl1 implements HostService1 {

    private final MemoryHostRepository1 memoryHostRepository1;

    //content insert service
    @Override
    public void contentInsert(Model model) {

    }
}
