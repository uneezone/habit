package com.habit.host2.service;

import com.habit.host2.entity.*;

import java.util.List;
import java.util.Map;

public interface HostService2 {


    String checkHost(String id);
    String getPhoneNumber(String id);
    //호스트 홈에 정보
    HostHomeDTO gethostHomeInfo(String id);

    String getHostImg(String id);



    //새로운 하스트 가입
    void newHostPro(NewHostDTO dto, String id);

    HostInfoDTO getHostInfo(String userId);

    void editHostInfo(HostEditDTO dto);

    int getProductsLength(SearchProDTO dto);
    List<ProductDTO> getProduct(SearchProDTO dto);

    String checkAjustForProCon(int payd_no);

    void updatePaydStatus(Long payd_no, String status);

    String getPayNo(Long payd_no);
    Long getRefnCount(String pay_no);

    String getPayMethod(String pay_no);

    Map<String, Object> getInfoByPaydNo(Long payd_no);

    void insertRefund(Map<String,Object> params);

    Integer getRefundPoint(String pay_no);

    void insertEnergy(Map<String,Object> params);

    List<Map<String, Object>> getProductNames(String host_id);
    List<Map<String, Object>> getProductOptions(Long cont_no);
    Map<String,Object> showUserInfo(String user_id);

    int checkWriteAccount(String host_id);
    List<AdjustInfoDTO> getAdjustList(SearchAdjustDTO dto);

    Integer getAdjustListLength(SearchAdjustDTO dto);
    List<Map<String, Object>> getAdjustDetail(String calc_no);

    Map<String, Object> getCalcAccount(String calc_no);

    String getOptionName(Map<String,Object> params);

    Map<String,Object> getHostAccount(String host_id);

    void calcMethod(String host_id);

    //List<Integer> updateForDonePro(String host_id);

    //Long adjustFee(List<Integer> contNos,String host_id);

    String checkAccount(String host_id,String calc_no);



}
