package com.habit.zzim.service;

import com.habit.zzim.DTO.ZzimDTO;
import com.habit.zzim.model.ZzimDAO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class ZzimService {

    private final ZzimDAO zzimDAO;

    public List<ZzimDTO> getZzimList(String user_id){
        List<Integer> contNoForZzim = zzimDAO.getContNoForZzim(user_id);

        if(contNoForZzim.size()!=0) {
            List<ZzimDTO> zzimList = zzimDAO.getZzimList(contNoForZzim);
            log.info("zzimList={}",zzimList);

            return zzimList;
        }

        return new ArrayList<>();
    }

    public String zzimInsert(Map<String,Object> params){
        int i = zzimDAO.zzimInsert(params);
        if(i==0){
            return "NOK";
        }

        return "OK";
    }

    public String zzimDel(Map<String, Object> params){
        int i = zzimDAO.zzimDel(params);

        if(i==0){
            return "NOK";
        }

        return "OK";
    }
}
