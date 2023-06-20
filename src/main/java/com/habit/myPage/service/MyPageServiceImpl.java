package com.habit.myPage.service;

import com.habit.myPage.DTO.UserInfoDTO;
import com.habit.myPage.model.MemoryMyPageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MyPageServiceImpl implements MyPageService{

    private final MemoryMyPageRepository repository;

    @Override
    public Map<String, Object> getUserNameAndImg(String user_id) {
        return repository.getUserNameAndImg(user_id);
    }

    @Override
    public Map<String, Object> getMyEnergyAndReview(String user_id) {
        int myEnergy = repository.getMyEnergy(user_id);
        int myReviewCount = repository.getMyReviewCount(user_id);

        Map<String,Object> info= new HashMap<>();
        info.put("energy",myEnergy);
        info.put("review",myReviewCount);

        return info;
    }

    @Override
    public UserInfoDTO getUserInfo(String user_id) {
        return repository.getUserInfo(user_id);
    }
}
