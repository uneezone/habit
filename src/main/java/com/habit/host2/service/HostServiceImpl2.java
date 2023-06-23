package com.habit.host2.service;

import com.habit.host2.entity.*;
import com.habit.host2.model.MemoryHostRepository2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
@Slf4j
public class HostServiceImpl2 implements HostService2 {

    @Autowired
    private  MemoryHostRepository2 repository;



    @Override
    public String checkHost(String id) {
        return repository.checkHost(id);
    }

    @Override
    public String getPhoneNumber(String id) {
        return repository.getPhoneNumber(id);
    }

    @Override
    public HostHomeDTO gethostHomeInfo(String id) {

        HostHomeDTO hostHomeDTO= new HostHomeDTO();

        //cont_no가져오기
        List<Integer> contNoForHome = repository.getContNoForHome(id);
        log.info("cont_no={}",contNoForHome);
        Long allPrice=0L;
        Long monthPrice=0L;
        Long allCount=0L;
        Long monthCancelCount=0L;

        if(contNoForHome.size()!=0) {
            for (Integer cont_no : contNoForHome) {
                List<String> adjustProNo = repository.getAdjustProNo(cont_no);
                log.info("pro_no list={}",adjustProNo);

                //Iterator<String> iterator=adjustProNo.iterator();

                //해당 상품이 한번이라도 판매가 됬는지 확인
                /*while (iterator.hasNext()){
                    String pro_no = iterator.next();
                    int exist = repository.checkSelled(pro_no);

                    if(exist==0){
                        iterator.remove();
                    }
                }*/
                log.info("pro_no={}", adjustProNo);


                Map<String, Object> allPriceForHome = repository.getAllPriceForHome(adjustProNo);
                allPrice += Long.parseLong(String.valueOf(allPriceForHome.get("sum")));
                monthPrice += repository.getMonthPriceForHome(adjustProNo);
                allCount += Long.parseLong(String.valueOf(allPriceForHome.get("count")));
                monthCancelCount += repository.getMonthCancel(adjustProNo);

                log.info("누적판매금액={}", allPrice);
                log.info("이번달판매금액={}", monthPrice);
                log.info("전체건수={}", allCount);
                log.info("이번달취소건수={}", monthCancelCount);


            }

            //전체리뷰수, 이번달 평균별점
            Map<String, Object> reviewAndStar = repository.getReviewAndStar(contNoForHome);
            log.info("리뷰랑 평균별점={}",reviewAndStar);

            //문의률
            Long questionUserCount = repository.getQuestionUserCount(contNoForHome);
            log.info("유저문의={}",questionUserCount);
            Long questionHostCount = repository.getQuestionHostCount(id);
            log.info("호스트문의={}",questionHostCount);

            if(questionHostCount==0 || questionUserCount==0){
                hostHomeDTO.setResponse(0.0);
            }else{
                hostHomeDTO.setResponse((double) questionHostCount/questionUserCount);
            }

            //dto로 넘기기
            hostHomeDTO.setAllSalePrice(allPrice);
            hostHomeDTO.setMonthSalePrice(monthPrice);
            hostHomeDTO.setAllCase(allCount);
            hostHomeDTO.setCancelCase(monthCancelCount);
            hostHomeDTO.setAllReview(Long.parseLong(String.valueOf(reviewAndStar.get("count"))));
            hostHomeDTO.setAvgStar(Double.parseDouble(String.valueOf(reviewAndStar.get("avg"))));

        }

        log.info("hostHOmeDTO={}",hostHomeDTO);
        return hostHomeDTO;
    }

    //새로운 하스트 가입 newHost메소드와 updateUserGrade메소드 합친거
    @Transactional
    @Override
    public void newHostPro(NewHostDTO dto, String id) {
        repository.newHost(dto);
        repository.updateUserGrade(id);
    };

    //하스트 정보가져오기
    @Override
    public HostInfoDTO getHostInfo(String userId){
        return repository.getHostInfo(userId);
    }

    @Transactional
    @Override
    public void editHostInfo(HostEditDTO dto) {
        repository.editHostInfo(dto);
    }

    @Override
    public int getProductsLength(SearchProDTO dto) {
        return repository.getProductsLength(dto);
    }

    @Override
    public List<ProductDTO> getProduct(SearchProDTO dto) {
        return repository.getProduct(dto);
    }

    @Override
    public void updatePaydStatus(Long payd_no, String status) {
        repository.updatePaydStatus(payd_no,status);
    }

    @Override
    public String getPayNo(Long payd_no) {
        return repository.getPayNo(payd_no);
    }

    @Override
    public Long getRefnCount(String pay_no) {
        return repository.getRefnCount(pay_no);
    }

    @Override
    public String getPayMethod(String pay_no) {
        return repository.getPayMethod(pay_no);
    }

    @Override
    public Map<String, Object> getInfoByPaydNo(Long payd_no) {
        return repository.getInfoByPaydNo(payd_no);
    }

    @Override
    public void insertRefund(Map<String, Object> params) {
        repository.insertRefund(params);
    }

    @Override
    public Integer getRefundPoint(String pay_no) {
        return repository.getRefundPoint(pay_no);
    }

    @Override
    public void insertEnergy(Map<String, Object> params) {
        repository.insertEnergy(params);
    }

    @Override
    public List<Map<String, Object>> getProductNames(String host_id) {
        return repository.getProductNames(host_id);
    }

    @Override
    public List<Map<String, Object>> getProductOptions(Long cont_no) {
        return repository.getProductOptions(cont_no);
    }

    @Override
    public Map<String, Object> showUserInfo(String user_id) {
        return repository.showUserInfo(user_id);
    }

    //정산서


    @Override
    public int checkWriteAccount(String host_id) {
        return repository.checkAccount(host_id);
    }

    @Override
    public List<AdjustInfoDTO> getAdjustList(SearchAdjustDTO dto) {
        return repository.getAdjustList(dto);
    }

    @Override
    public Integer getAdjustListLength(SearchAdjustDTO dto) {
        return repository.getAdjustListLength(dto);
    }

    @Override
    public List<Map<String, Object>> getAdjustDetail(String calc_no) {
        return repository.getAdjustDetail(calc_no);
    }

    @Override
    public Map<String, Object> getCalcAccount(String calc_no) {
        return repository.getCalcAccount(calc_no);
    }

    @Override
    public String getOptionName(Map<String,Object> params) {
        return repository.getOptionName(params);
    }

    @Override
    public Map<String, Object> getHostAccount(String host_id) {
        return repository.getHostAccount(host_id);
    }

    @Override
    @Transactional
    public List<Integer> updateForDonePro(String host_id) {

        //판매종료일기준 판매가 완료된 콘텐츠 테이블에서 정산테이블에 없는 콘텐츠 코드
        List<Integer> contNoForAdjust = repository.getContNoForAdjust(host_id);

        List<String> one_proNo = new ArrayList<>();
        List<String> prod_proNo = new ArrayList<>();
        for (Integer cont_no : contNoForAdjust) {
            //콘텐츠 코드 판매 상태 N으로
            repository.updateContStatus(cont_no);
            //원데이 테이블 상태꾸기 위해 판매완료 옵션코드 알기
            List<String> oneProNo = repository.getOneProNo(cont_no);
            //회차권 테이블 상태 바꾸기 위해 판매완료 옵션코드 알기
            List<String> prodProNo = repository.getProdProNo(cont_no);

            //상품옵션코드 각각 한 곳에 모으기
            one_proNo.addAll(oneProNo);
            prod_proNo.addAll(prodProNo);
        }
        //log.info("onePro={}",one_proNo);
        //log.info("prodPro={}",prod_proNo);

        for (String one : one_proNo) {
            //원데이테이블 상태 바꾸기
            repository.updateOneStatus(one);
        }

        for (String prod : prod_proNo) {
            //회차권테이블 상태 바꾸기
            repository.updateProdStatus(prod);
        }

        //상품 옵션코드들 하나로 모으기
        List<String> proNo= new ArrayList<>();
        proNo.addAll(one_proNo);
        proNo.addAll(prod_proNo);

        //log.info("pro_no={}",proNo);
        //주문상세코드 가져오기
        List<Integer> paydNo;
        //정산해야할 상품코드가 있다면...
        if(proNo.size()>=1) {
            paydNo = repository.getPaydNo(proNo);
            //log.info("payd_no={}", paydNo);
            //주문상세상태 바꾸기
            repository.updatePaydStatus(paydNo);
        }


        return contNoForAdjust;
    }

    @Override
    @Transactional
    public Long adjustFee(List<Integer> contNos,String host_id) {

        //호스트 계좌번호 조회
        Map<String, Object> hostAccount = repository.getHostAccount(host_id);

        for (Integer contNo : contNos) {

            //컨텐츠 정보
            AdjustContDTO adjustContDTO = repository.getAdjustContDTO(contNo);
            log.info("컨텐츠 정보={}",adjustContDTO);
            String calc_date=adjustContDTO.getCont_stdate()+" - "+adjustContDTO.getCont_endate();

            //상품옵션코드
            List<String> adjustProNo = repository.getAdjustProNo(contNo);
            log.info("contNo={}",contNo);
            log.info("pro-no={}",adjustProNo);


            //주문상세에서 뒤지기
            List<AdjustPaydDTO> adjustPaydDTO = repository.getAdjustPaydDTO(adjustProNo);
            log.info("paydDTO={}",adjustPaydDTO);

            //총지급액(수수료전)
            int adjustfee=0;
            for (AdjustPaydDTO paydDTO : adjustPaydDTO) {
                if(paydDTO.getRefn_status().equals("NRO")){
                    adjustfee+=paydDTO.getPayd_price()*paydDTO.getPayd_qty();
                }

            }
            //총 수수료
            int commision= (int) (adjustfee*0.2);
            log.info("adjustfee={}",adjustfee);
            log.info("commision={}",commision);

            //정산테이블 번호 생성
            String calcNo="";
            SimpleDateFormat sd= new SimpleDateFormat("yyyyMMddHHmmss");
            String date=sd.format(new Date());
            String findCalcNo = repository.findCalcNo(date);
            if(findCalcNo.equals("1")){
                calcNo="C"+date+1;
            }else {

                int lastno=Integer.parseInt(findCalcNo.substring(findCalcNo.length()-1));
                date+=(lastno+1);
                calcNo="C"+date;
            }

            log.info("정산번호={}",calcNo);

            //정산테이블에 인저트 해보자
            CalcDTO calcDTO= new CalcDTO();
            calcDTO.setCalc_no(calcNo);
            calcDTO.setHost_id(host_id);
            calcDTO.setCalc_date(calc_date);
            calcDTO.setCalc_title(adjustContDTO.getCont_name());
            calcDTO.setCalc_ttlprice(adjustfee);
            calcDTO.setCalc_fee(commision);
            calcDTO.setCont_no(Long.valueOf(contNo));
            calcDTO.setHost_account((Integer) hostAccount.get("host_account"));
            calcDTO.setHost_acholder((String) hostAccount.get("host_acholder"));
            calcDTO.setHost_bank((String) hostAccount.get("host_bank"));

            repository.insertCalc(calcDTO);

            //정산상세 하..
            for (AdjustPaydDTO paydDTO : adjustPaydDTO) {
                String calcd_status="";
                if(paydDTO.getRefn_status().equals("NRO")){
                    calcd_status="Y";
                }else if(paydDTO.getRefn_status().equals("HFRO")){
                    calcd_status="C";
                }else if (paydDTO.getRefn_status().equals("CFRO")) {
                    calcd_status="R";
                }

                CalcdDTO calcdDTO= new CalcdDTO(calcNo,paydDTO.getPayd_no(),paydDTO.getPro_no(),
                                                paydDTO.getPayd_price(),paydDTO.getPayd_qty(),calcd_status,paydDTO.getPayd_date());

                //insert
                repository.insertCalcD(calcdDTO);
            }

        }

        return 18L;
    }

    //정산요청할때 계좌정보있는지 확인후 지급
    @Override
    public String checkAccount(String host_id,String calc_no) {
        int i = repository.checkAccount(host_id);
        if(i==1){
            repository.updateCalcStatus(calc_no);
            return "OK";
        }else {
            return "NOK";
        }
    }

}
