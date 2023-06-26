package com.habit.myPage.service;

import com.habit.myPage.DTO.*;
import com.habit.myPage.model.MemoryMyPageRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@RequiredArgsConstructor
@Slf4j
@Transactional
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

        Iterator iterator= list.iterator();

        while (iterator.hasNext()){
            Object next = iterator.next();
            if(next==null){
                iterator.remove();
            }
        }

        log.info("refnInfo={}",list);

        return list;
    }

    @Override
    public ReviewWriteDTO getReview(int payd_no,String pro_no) {

        //리뷰 썻는지 확인
        int i = repository.checkReviewWrite(payd_no);

        //상품 명 가져오기
        Map<String,Object> params= new HashMap<>();
        params.put("payd_no",payd_no);
        params.put("pro_no",pro_no);
        ReviewWriteDTO contInfo = repository.getContInfo(params);


        if(i!=0){
            ReviewWriteDTO review = repository.getReview(payd_no);
            //log.info("reviewWrite={}",review);
            contInfo.setReview_img(review.getReview_img());
            contInfo.setReview_star(review.getReview_star());
            contInfo.setReview_cont(review.getReview_cont());
            contInfo.setReview_feed(review.getReview_feed());
            contInfo.setReview_ask(review.getReview_ask());
        }

        log.info("reveiwDTO={}",contInfo);
        return contInfo;
    }

    @Override
    public int updateOrInsertReview(ReviewInsertDTO dto, List<MultipartFile> imgs) throws IOException {

        //리뷰수정인지 새로운 것인지 체크
        int status = repository.checkReviewWrite(dto.getPayd_no());
        log.info("리뷰수정일까={}",status);

        //이미지 잇는지 확인 -> 있으면 파일명 변경
        List<String> imgNames = new ArrayList<>();
        for (int i=0;i<imgs.size();i++) {
            if(imgs.get(i).getSize()==0){
                log.info("사진 첨부  X");
            }else{
                String path = "src/main/webapp/storage/";

                SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddHHmmss");
                Date now = new Date();
                String nowTime = sdf1.format(now);

                String newFileName=nowTime+imgs.get(i).getOriginalFilename();

                File targetFile = new File(path + newFileName);
                InputStream filesStream = imgs.get(i).getInputStream();
                FileUtils.copyInputStreamToFile(filesStream, targetFile);
                imgNames.add(newFileName);
                dto.setReview_img(imgNames);
            }
        }

        log.info("reviewInsertDTO={}",dto);
        int resultstatus=0;
        //리뷰수정 ? 리뷰 새로운?
        if(status==0){
            //새로은 리뷰
            resultstatus = repository.insertReview(dto);
        }else{
            //리뷰수정
            resultstatus=repository.updateReview(dto);
        }
        return resultstatus;
    }

    @Override
    public int insertEnergy(EnergyDTO dto) {
        return repository.insertEnergy(dto);
    }

    @Override
    public RefundInfoDTO getForRefund(int payd_no) {
        RefundInfoDTO infoForRefund = repository.getInfoForRefund(payd_no);

        int checkForEnergyRefund = repository.getCheckForEnergyRefund(infoForRefund.getPay_no());

        //RO가 두개이상이면 에너지 환불 X
        if(checkForEnergyRefund>=2){
            infoForRefund.setPay_point(0);
        }


        return infoForRefund;
    }

    @Override
    public String insertRefund(RefundInsertDTO dto, String user_id) {
        String refn_price = dto.getRefn_price().replace(",", "");
        dto.setRefn_price(refn_price);

        String refn_point=dto.getRefn_point().replace("-","");
        dto.setRefn_point(refn_point);

        dto.setUser_id(user_id);
        int status = repository.insertRefund(dto);

        if(status!=0){
            log.info("payd_no={}",Integer.parseInt(dto.getPayd_no()));
            //내역상태바꾸기
            int changeStatus = repository.changeStatusPayd(Integer.parseInt(dto.getPayd_no()));


            //사용한 에너지 환불
            EnergyDTO energyDTO= new EnergyDTO();
            energyDTO.setUser_id(user_id);
            if(Integer.parseInt(dto.getRefn_point())!=0){
                energyDTO.setEnergy_sources("[결제]취소");
                energyDTO.setEnergy_saveuse(Integer.parseInt(dto.getRefn_point()));
                repository.insertEnergyRefund(energyDTO);
            }

            //가격대비 적립 포인트 빼기
            //회원등급확인
            String userGrade = repository.getUserGrade(user_id);
            int contRefnPoint=0;
            if(userGrade.equals("B")){
                contRefnPoint= (int) (Integer.parseInt(refn_price)*0.01);
            }else if (userGrade.equals("A")){
                contRefnPoint= (int) (Integer.parseInt(refn_price)*0.03);
            }else {
                contRefnPoint= (int) (Integer.parseInt(refn_price)*0.05);
            }

            energyDTO.setEnergy_saveuse(-contRefnPoint);
            energyDTO.setEnergy_sources("[결제]적립취소");
            repository.insertEnergyRefund(energyDTO);


            //유저 등급확인

            if(changeStatus!=0) {
                return "OK";
            }
            return "NOK";
        }

        return "NOK";
    }

    @Override
    public RefundResultDTO getResultRefund(int payd_no) {
        return repository.getResultRefund(payd_no);
    }
}
