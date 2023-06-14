package com.habit.host2.model;

import com.habit.host2.entity.HostInfoDTO;
import com.habit.host2.entity.NewHostDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class MemoryHostRepository2 implements HostRepository2 {

    @Autowired
    SqlSession sqlSession;
  /*  private final HostMapper hostMapper;


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
    }*/

    @Override
    public String checkHost(String userId) {
        return sqlSession.selectOne("host2.checkHost",userId);
    }

    @Override
    public String getPhoneNumber(String userId) {
        return sqlSession.selectOne("host2.getPhoneNumber",userId);
    }

    @Override
    public void newHost(NewHostDTO dto) {
        sqlSession.insert("host2.newHost",dto);
    }

    @Override
    public void updateUserGrade(String userId) {
        sqlSession.update("host2.updateUserGrade",userId);
    }

    @Override
    public HostInfoDTO getHostInfo(String userId) {
        return sqlSession.selectOne("host2.getHostInfo",userId);
    }
}
