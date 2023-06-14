package com.habit.host1.service;

import com.habit.host1.model.DAO;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@org.springframework.stereotype.Service
public class SeviceImpl implements Service {

    private final DAO dao;
}
