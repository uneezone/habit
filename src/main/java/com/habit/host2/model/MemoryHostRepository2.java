package com.habit.host2.model;

import com.habit.host2.entity.HostInfoDTO;
import com.habit.host2.entity.NewHostDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MemoryHostRepository2 implements HostRepository2 {

    private final HostMapper hostMapper;


    @Override
    public String checkHost(String userId) {
        return hostMapper.checkHost(userId);
    }

    @Override
    public String getPhoneNumber(String userId) {
        String phone = hostMapper.getPhoneNumber(userId);
        return phone;
    }

    @Override
    public void newHost(NewHostDTO dto) {
        hostMapper.newHost(dto);
    }

    @Override
    public void updateUserGrade(String userId) {
        hostMapper.updateUserGrade(userId);
    }

    @Override
    public HostInfoDTO getHostInfo(String userId) {
        return hostMapper.getHostInfo(userId);
    }
}
