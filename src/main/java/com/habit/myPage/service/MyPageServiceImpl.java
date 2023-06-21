package com.habit.myPage.service;

import com.habit.myPage.DTO.OrderAllDTO;
import com.habit.myPage.DTO.OrderDetailDTO;
import com.habit.myPage.DTO.OrderRefnDTO;
import com.habit.myPage.DTO.UserInfoDTO;
import com.habit.myPage.model.MemoryMyPageRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
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

    @Override
    public String getPass(String user_id, String checkpw) {
        String realpass = repository.getPass(user_id);

        if(realpass.equals(checkpw)){
            return "OK";
        }

        return "NOK";
    }

    @Override
    public String updatePass(String user_id, String pw) {
        int i = repository.updatePass(user_id, pw);

        if(i==1){
            return "OK";
        }

        return "NOK";
    }

    @Override
    public String updateUserInfo(UserInfoDTO dto) {
        int i = repository.updateUserInfo(dto);

        if(i==0){
            return "NOK";
        }

        return "OK";
    }

    //결제내역
    @Override
    public List<Map<String,Object>> getOrderList(String user_id) {
        //pay_date, payno, 구매한 콘텐츠 수량
        List<Map<String, Object>> fromPayForOrder = repository.getFromPayForOrder(user_id);
        //log.info("frompayorder={}",fromPayForOrder);

        return fromPayForOrder;
    }

    @Override
    public List<OrderAllDTO> getPayDForOrder(String pay_no) {

        List<OrderAllDTO> payDForOrder = repository.getPayDForOrder(pay_no);
        for (OrderAllDTO orderAllDTO : payDForOrder) {
            if(orderAllDTO.getPro_no().startsWith("o")){
                Map<String, Object> oneForOrder = repository.getOneForOrder(orderAllDTO.getPro_no());
                orderAllDTO.setCont_img((String) oneForOrder.get("cont_img"));
                orderAllDTO.setCont_name((String) oneForOrder.get("cont_name"));
                orderAllDTO.setOp_name((String) oneForOrder.get("op_name"));
                orderAllDTO.setCont_no((Integer)oneForOrder.get("cont_no"));
            }else{
                Map<String, Object> proForOrder = repository.getProForOrder(orderAllDTO.getPro_no());
                orderAllDTO.setCont_img((String) proForOrder.get("cont_img"));
                orderAllDTO.setCont_name((String) proForOrder.get("cont_name"));
                orderAllDTO.setOp_name((String) proForOrder.get("op_name"));
                orderAllDTO.setCont_no((Integer) proForOrder.get("cont_no"));
            }
        }
        //log.info("OrderAllDTO={}",payDForOrder);

        return payDForOrder;
    }

    //결제상세내역
    @Override
    public Map<String, Object> getPayForOrderDetail(String pay_no) {
        Map<String, Object> fromPayForOrderDetail = repository.getFromPayForOrderDetail(pay_no);
        log.info("fromPayForOrderDetail={}",fromPayForOrderDetail);
        return fromPayForOrderDetail;

    }

    @Override
    public List<OrderDetailDTO> getPayDForOrderDetail(String pay_no) {
        List<OrderDetailDTO> payDForOrderDetail = repository.getPayDForOrderDetail(pay_no);
        log.info("orderDetailDTO1={}",payDForOrderDetail);
        for (OrderDetailDTO orderDetailDTO : payDForOrderDetail) {
            //상품설명
            String pro_no = orderDetailDTO.getPro_no();
            if(pro_no.startsWith("o")){
                Map<String, Object> oneForOrder = repository.getOneForOrder(pro_no);
                orderDetailDTO.setCont_img((String) oneForOrder.get("cont_img"));
                orderDetailDTO.setCont_name((String) oneForOrder.get("cont_name"));
                orderDetailDTO.setOp_name((String) oneForOrder.get("op_name"));
                orderDetailDTO.setCont_no((Integer)oneForOrder.get("cont_no"));
            }else{
                Map<String, Object> proForOrder = repository.getProForOrder(pro_no);
                orderDetailDTO.setCont_img((String) proForOrder.get("cont_img"));
                orderDetailDTO.setCont_name((String) proForOrder.get("cont_name"));
                orderDetailDTO.setOp_name((String) proForOrder.get("op_name"));
                orderDetailDTO.setCont_no((Integer)proForOrder.get("cont_no"));
            }



        }

        log.info("orderDetailDTO2={}",payDForOrderDetail);

        return payDForOrderDetail;
    }

    @Override
    public List<OrderRefnDTO> getRefnForOrderDetail( List<OrderDetailDTO> dto) {
        List<OrderRefnDTO> list= new ArrayList<>();
        for (OrderDetailDTO orderDetailDTO : dto) {
            int paydNo = orderDetailDTO.getPayd_no();
            OrderRefnDTO refnForOrderDetail = repository.getRefnForOrderDetail(paydNo);
            list.add(refnForOrderDetail);
        }

        log.info("refnInfo={}",list);

        return list;
    }
}
