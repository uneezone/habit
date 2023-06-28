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

    @Override
    public String getHostImg(String id) {
        return repository.getHostImg(id);
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
    public String checkAdjustForProCon(int payd_no) {
        int status = repository.checkAjustForProCon(payd_no);

        if(status!=0){
            return "AdjustOK";
        }

        return "AdjustNOK";
    }

    //판매관리에서 상태변경 ajax
    @Override
    @Transactional
    public String changeProStatusByHost(Long payd_no, String status){
        if(status.equals("Y")){
            //주문상세 테이블 변경
            repository.updatePaydStatus(payd_no,status);
            return "ROK";  //사용완료
        }else if(status.equals("C")){

            //주문상세테이블 변경
            repository.updatePaydStatus(payd_no,status);

            //환불테이블 insert
            //주문서번호 기준으로 RO 혹은 NRO 있으면 에너지 환불 X

            //주문상세번호로 주문서번호 알아오기
            String payNo = repository.getPayNo(payd_no);
            log.info("주문서번호={}",payNo);

            //주문서번호 기준으로 RO혹은 NRO가 있는지 확인
            Long refnCount = repository.getRefnCount(payNo);

            //주문서번호로 결제수단 가져오기(해당 결제수단으로 환불해주기 위해서)
            String payMethod = repository.getPayMethod(payNo);
            log.info("결제수단={}",payMethod);

            //환불에너지 선언
            Integer refundPoint=0;

            //환불금액 선언
            int refundPrice=0;

            //주문상세번호 해당 제품의 금액과 수량,상품코드,유저아이디
            Map<String, Object> info;

            if(refnCount>=1){
                //에너지 환붍 X
                //주문상세번호 해당 제품의 금액과 수량,상품코드,유저아이디
                info = repository.getInfoByPaydNo(payd_no);
                log.info("info={}",info.toString());

                //환불금액 계산
                refundPrice=(Integer)info.get("payd_qty")*(Integer)info.get("payd_price");

                //환불테이블에 insert할 값들 모으기
                Map<String, Object> params = new HashMap<>();
                params.put("payd_no",payd_no);
                params.put("user_id",info.get("user_id"));
                params.put("pro_no",info.get("pro_no"));
                params.put("pay_qty",info.get("payd_qty"));
                params.put("refund_price",refundPrice);
                params.put("pay_method",payMethod);
                params.put("refn_point",refundPoint);

                //환불테이블에 insert 하기
                repository.insertRefund(params);
                log.info("환불테이블 insert 성공1");


            }else{
                //에너지 환불 O
                //주문상세번호 해당 제품의 금액과 수량,상품코드,유저아이디
                info = repository.getInfoByPaydNo(payd_no);
                log.info("info={}",info.toString());

                //환불금액 계산
                refundPrice=(Integer)info.get("payd_qty")*(Integer)info.get("payd_price");

                //환불에너지 가져오기
                log.info("주문서번호={}",payNo);
                refundPoint = repository.getRefundPoint(payNo);
                log.info("환불에너지={}",refundPoint);

                if(refundPoint==0) {
                    //주문시 에너지 사용안했을때
                    //환불테이블에 insert할 값들 모으기


                    Map<String, Object> params = new HashMap<>();
                    params.put("payd_no",payd_no);
                    params.put("user_id",info.get("user_id"));
                    params.put("pro_no",info.get("pro_no"));
                    params.put("pay_qty",info.get("payd_qty"));
                    params.put("refund_price",refundPrice);
                    params.put("pay_method",payMethod);
                    params.put("refn_point",refundPoint);

                    //환불테이블에 insert 하기
                    repository.insertRefund(params);
                    log.info("환불테이블 insert 성공2");

                }else{
                    //주문시 에너지 사용했을때
                    //환불테이블에 insert할 값들 모으기
                    Map<String, Object> params = new HashMap<>();
                    params.put("payd_no",payd_no);
                    params.put("user_id",info.get("user_id"));
                    params.put("pro_no",info.get("pro_no"));
                    params.put("pay_qty",info.get("payd_qty"));
                    params.put("refund_price",refundPrice);
                    params.put("pay_method",payMethod);
                    params.put("refn_point",refundPoint);

                    //환불테이블에 insert 하기
                    repository.insertRefund(params);
                    log.info("환불테이블 insert 성공3");

                    //에너지테이블에 환불에너지 남기기
                    Map<String, Object> energyParams= new HashMap<>();
                    energyParams.put("user_id",info.get("user_id"));
                    energyParams.put("energy_saveuse",refundPoint);
                    energyParams.put("energy_sources","[결제]호스트취소");

                    repository.insertEnergy(energyParams);
                }


            }

            //호스트가 환불해주는 경우 회원등급확인해서 상품대비 적립금 빼기
            String userGrade = repository.getUserGradeForRefund(String.valueOf(info.get("user_id")));
            int contRefnPoint=0;
            if(userGrade.equals("B")){
                contRefnPoint= (int) (refundPrice*0.01);
            }else if (userGrade.equals("A")){
                contRefnPoint= (int) (refundPrice*0.03);
            }else {
                contRefnPoint= (int) (refundPrice*0.05);
            }

            Map<String,Object> refnPointByContPrice=new HashMap<>();
            refnPointByContPrice.put("energy_saveuse",(-contRefnPoint));
            refnPointByContPrice.put("energy_sources","[결제]적립취소");
            refnPointByContPrice.put("user_id",info.get("user_id"));

            int refnpointstatus = repository.insertEnergyRefundByCont(refnPointByContPrice);
            if(refnpointstatus==0){
                log.info("호스트 취소 : 상품대비 적립금 취소 실패");
            }else{
                log.info("호스트 취소 : 상품대비 적립금 취소 성공");
            }


            return "COK"; //취소완료
        }
        return "COK"; //취소완료
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
    public void calcMethod(String host_id){
        //판매종료일기준 판매가 완료된 콘텐츠 테이블에서 정산테이블에 없는 콘텐츠 코드
        List<Integer> contNoForAdjust = repository.getContNoForAdjust(host_id);
        log.info("contNoForAdjust={}",contNoForAdjust);

        if(contNoForAdjust.size()!=0) {
            List<String> one_proNo = new ArrayList<>();
            List<String> prod_proNo = new ArrayList<>();

            //콘텐츠, 상품옵션 상태들 바꾸기
            for (Integer cont_no : contNoForAdjust) {
                //콘텐츠 코드 판매 상태 N으로
                repository.updateContStatus(cont_no);

                //원데이 테이블 상태꾸기 위해 판매완료 옵션코드 알기
                List<String> oneProNo = repository.getOneProNo(cont_no);
                if(oneProNo.size()!=0){
                    repository.updateOneStatus(oneProNo);
                }


                //회차권 테이블 상태 바꾸기 위해 판매완료 옵션코드 알기
                List<String> prodProNo = repository.getProdProNo(cont_no);
                if(prodProNo.size()!=0){
                    //회차권테이블 상태 바꾸기
                    repository.updateProdStatus(prodProNo);
                }

                //상품옵션코드 각각 한 곳에 모으기
                one_proNo.addAll(oneProNo);
                prod_proNo.addAll(prodProNo);
            }//for end

            log.info("onePro={}", one_proNo);
            log.info("prodPro={}", prod_proNo);


            //상품 옵션코드들 하나로 모으기
            List<String> proNo = new ArrayList<>();
            proNo.addAll(one_proNo);
            proNo.addAll(prod_proNo);

            log.info("pro_no={}", proNo);
            //주문상세코드 가져오기
            List<Integer> paydNo;

            //정산해야할 상품코드가 있다면...
            if (proNo.size() >= 1) {
                paydNo = repository.getPaydNo(proNo);
                log.info("payd_no={}", paydNo);

                //주문상세상태 바꾸기(판매가 된 상품코드에 한해서만) + 정산,정산상세테이블 insert
                if (paydNo.size() != 0) {

                    //주문상태 바꾸기
                    repository.updatePaydStatus(paydNo);


                    //=====정산해야할 것이 있다면 정산테이블, 정산상세테이블에 insert 시작
                    //호스트 계좌번호 조회
                    Map<String, Object> hostAccount = repository.getHostAccount(host_id);
                    log.info("hostAccount={}", hostAccount);
                    for (Integer contNo : contNoForAdjust) {

                        //컨텐츠 정보 판매일과 종료일, 상품이름
                        AdjustContDTO adjustContDTO = repository.getAdjustContDTO(contNo);
                        log.info("컨텐츠 정보={}", adjustContDTO);
                        String calc_date = adjustContDTO.getCont_stdate() + " - " + adjustContDTO.getCont_endate();

                        //상품옵션코드
                        List<String> adjustProNo = repository.getAdjustProNo(contNo);
                        log.info("contNo={}", contNo);
                        log.info("pro-no={}", adjustProNo);


                        //주문상세에서 뒤지기
                        List<AdjustPaydDTO> adjustPaydDTO = repository.getAdjustPaydDTO(adjustProNo);
                        log.info("paydDTO={}", adjustPaydDTO);


                        //총지급액(수수료전)
                        int adjustfee = 0;
                        for (AdjustPaydDTO paydDTO : adjustPaydDTO) {
                            if (paydDTO.getRefn_status().equals("NRO")) {
                                adjustfee += paydDTO.getPayd_price() * paydDTO.getPayd_qty();
                            }

                        }
                        //총 수수료
                        int commision = (int) (adjustfee * 0.2);
                        log.info("adjustfee={}", adjustfee);
                        log.info("commision={}", commision);

                        //정산테이블 번호 생성
                        String calcNo = "";
                        SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
                        String date = sd.format(new Date());
                        String findCalcNo = repository.findCalcNo(date);
                        if (findCalcNo.equals("1")) {
                            calcNo = "C" + date + 1;
                        } else {

                            int lastno = Integer.parseInt(findCalcNo.substring(findCalcNo.length() - 1));
                            date += (lastno + 1);
                            calcNo = "C" + date;
                        }

                        log.info("정산번호={}", calcNo);

                        //정산테이블에 인저트 해보자
                        CalcDTO calcDTO = new CalcDTO();
                        calcDTO.setCalc_no(calcNo);
                        calcDTO.setHost_id(host_id);
                        calcDTO.setCalc_date(calc_date);
                        calcDTO.setCalc_title(adjustContDTO.getCont_name());
                        calcDTO.setCalc_ttlprice(adjustfee);
                        calcDTO.setCalc_fee(commision);
                        calcDTO.setCont_no(Long.valueOf(contNo));
                        calcDTO.setHost_account((String) hostAccount.get("host_account"));
                        calcDTO.setHost_acholder((String) hostAccount.get("host_acholder"));
                        calcDTO.setHost_bank((String) hostAccount.get("host_bank"));
                        log.info("calcDTO={}", calcDTO);
                        //정산인저트
                        int calcStatus = repository.insertCalc(calcDTO);

                        //정산상세 하..
                        for (AdjustPaydDTO paydDTO : adjustPaydDTO) {
                            String calcd_status = "";
                            if (paydDTO.getRefn_status().equals("NRO")) {
                                calcd_status = "Y";
                            } else if (paydDTO.getRefn_status().equals("HFRO")) {
                                calcd_status = "C";
                            } else if (paydDTO.getRefn_status().equals("CFRO")) {
                                calcd_status = "R";
                            }

                            CalcdDTO calcdDTO = new CalcdDTO(calcNo, paydDTO.getPayd_no(), paydDTO.getPro_no(),
                                    paydDTO.getPayd_price(), paydDTO.getPayd_qty(), calcd_status, paydDTO.getPayd_date());

                            //정산상세 insert
                            int calcdStatus = repository.insertCalcD(calcdDTO);

                            if (calcdStatus != 0 && calcStatus!=0) {
                                log.info("정산성공");
                            } else {
                                log.info("정산실패");
                            }

                        }//정산상세 잔복문 돌리기

                    }//for 문(정산해야할 cont_no 반복문 돌리기)
                }//주문상세상태변경 및 정산,정산상세  insert  end(판매가 된 상품에 한해서만)
            }//정산이 진행되어야할 pro_no

        }

        //======정산해야할 상품들이 없음====//

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
