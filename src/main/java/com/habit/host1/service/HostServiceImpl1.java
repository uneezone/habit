package com.habit.host1.service;

import com.habit.host1.DTO.*;
import com.habit.host1.model.MemoryHostRepository1;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;

@RequiredArgsConstructor
@org.springframework.stereotype.Service
public class HostServiceImpl1 implements HostService1 {

    private final MemoryHostRepository1 memoryHostRepository1;

    // 카테고리 대분류 list 불러오기
    @Override
    public List<Map<String, Object>> cateList () {
        return memoryHostRepository1.cateList();
    }

    // 대분류 선택에 따른 중분류 list 불러오기
    @Override
    public List<Map<String, Object>> selectCate(String cate_large) {
        return memoryHostRepository1.selectCate(cate_large);
    }

    // 해빗 등록 (insert)
    @Override
    public int contentInsert (RequestContentValueDTO rciDTO) throws IOException {

        int result = 0;

        // 콘텐츠 테이블에 insert 결과
        rciDTO = contentProcessing(rciDTO);
        int insertContResult = memoryHostRepository1.insertCont(rciDTO);

        // 판매유형에 따른 옵션 insert
        if(rciDTO.getCont_type().equals("prod")) { // 옵션이 회차권, 인원권이라면

            // 인원권, 회차권 옵션 테이블 insert
            List<ProdEntity> optionListP = prodProcessing(rciDTO);
            int insertProdResult = memoryHostRepository1.insertProd(optionListP);

        } else if (rciDTO.getCont_type().equals("one")) { // 옵션이 원데이 클래스 라면

            // 원데이 클래스 옵션 테이블 insert
            List<OneEntity> optionListO = oneProcessing(rciDTO);
            int insertOneResult = memoryHostRepository1.insertOne(optionListO);
        }

        return 0;
    }

    // 해빗 update
    @Override
    public int contentUpdate (RequestContentValueDTO rciDTO) throws IOException {

        int result = 0;
        rciDTO.setCont_endate_type("notDefault");

        // 콘텐츠 테이블에 insert 결과
        rciDTO = contentProcessing(rciDTO);

        System.out.println(memoryHostRepository1.updateContent(rciDTO));

        return memoryHostRepository1.updateContent(rciDTO);
    }

    // 리뷰 List 가져오기
    @Override
    public List<ResponseReviewDTO> reviewList(RequestReviewDTO reqReviewDTO) {
        return memoryHostRepository1.reviewList(reqReviewDTO);
    }

    // 리뷰 list Count 가져오기
    @Override
    public int totalReviewCount(RequestReviewDTO reqReviewDTO) {
        return memoryHostRepository1.totalReviewCount(reqReviewDTO);
    }

    // 리뷰 삭제 (상태 변경)
    @Override
    public int reviewDelete(int review_no) {
        return memoryHostRepository1.reviewDelete(review_no);
    }


    // 문의사항 리스트 가져오기
    @Override
    public List<ResponseInquiryDTO> inquiryList(RequestInquiryDTO reqInqDTO) {
        List<ResponseInquiryDTO> list = memoryHostRepository1.inquiryList(reqInqDTO);
        if (list.size() > 0) {
            int totalCount = memoryHostRepository1.inquiryCount(reqInqDTO);
            list.get(0).setTotalCount(totalCount);
        }
        return list;
    }

    // 해빗 리스트 가져오기
    @Override
    public List<ResponseContentListDTO> contentList(RequestContentListDTO reqContListDTO) {

        List<ResponseContentListDTO> list = memoryHostRepository1.contentList(reqContListDTO);
        if (list.size() > 0) {
            for (ResponseContentListDTO dto : list) {
                String cont_img = dto.getCont_img().trim().split("\\|")[0];
                dto.setCont_img(cont_img);

                Map<String, Object> map = new HashMap<>();
                map.put("host_id", dto.getHost_id());
                map.put("cont_no", dto.getCont_no());
                int result = memoryHostRepository1.contentPurchaseCheck(map);

                if (result > 0) {
                    // 삭제 불가를 위해 status에 기록 남기기
                    dto.setContentPurchaseStatus("N");
                }
            }
        }
        return list;
    }

    @Override
    public void contentListCount(RequestContentListDTO reqContListDTO) {
        int totalRecord = memoryHostRepository1.contentListCount(reqContListDTO);
        reqContListDTO.getVo().setTotalRecord(totalRecord);
    }

    // 해빗 삭제
    @Override
    public int deleteContent(int cont_no) {
        return memoryHostRepository1.deleteContent(cont_no);
    }

    // 수정전 해빗 값 가져오기

    // 원데이클래스 예약건 List 가져오기
    @Override
    public List<ResponseReservationDTO> reservationList(RequestReservationDTO reqReservDTO) {
        return memoryHostRepository1.reservationList(reqReservDTO);
    }

    // 원데이 클래스 예약건 List totalRecord
    @Override
    public int totalReservationCount(RequestReservationDTO requestReservationDTO) {
        return memoryHostRepository1.reservationListCount(requestReservationDTO);
    }

    @Override
    public int reservationStatusChangeAndRefundInsert (RequestReservationStatusChangeDTO reqReservStatChg) {

        int result = 0;

        // 주문상세 상태변경
        String paydStatus = reqReservStatChg.getPayd_status();
        if (!paydStatus.equals("R")) {
            if (paydStatus.equals("Y")) { // 사용처리했을경우
                reqReservStatChg.setRefn_status("NRO");
            } else if (paydStatus.equals("C")) { // 취소처리했을경우
                reqReservStatChg.setRefn_status("HFRO");
            }
            result += memoryHostRepository1.reservationStatusChange(reqReservStatChg);
        }

        // 취소처리일 경우 환불 insert를 위한 주문서, 주문상세 select
        if (result > 1 && paydStatus.equals("C")) {
            int payd_no = reqReservStatChg.getPayd_no();
            SelectPayDetailForInsertRefundDTO spdfirDTO = memoryHostRepository1.selectPayDetailForInsertRefund(payd_no);
            if (spdfirDTO != null) { // select한 값이 존재한다면

                // 환불액 계산, 환불 포인트 계산
                List<String> paydStatusList = memoryHostRepository1.selectPayDetailStatus(payd_no);
                int yCount = 0;
                int rCount = 0;
                for (String status : paydStatusList) {
                    if (status.equals("Y")) {
                        yCount++;
                    } else if (status.equals("R")) {
                        rCount++;
                    }
                }
                int payd_price = spdfirDTO.getPayd_price();
                if (yCount > 0) {
                    spdfirDTO.setRefn_pay(payd_price);
                    spdfirDTO.setRefn_point(0);
                }
                if (yCount == 0 && rCount == 1) {
                    int pay_point = spdfirDTO.getPay_point();
                    int refn_pay = payd_price - pay_point;
                    spdfirDTO.setRefn_pay(refn_pay);
                    spdfirDTO.setRefn_point(pay_point);

                    // 에너지 테이블 insert(에너지 환불)
                    EnergyEntity en = new EnergyEntity();
                    String user_id = spdfirDTO.getUser_id();
                    en.setUser_id(user_id);
                    en.setEnergy_saveuse(pay_point);
                    en.setEnergy_source("[결제]호스트취소");
                    memoryHostRepository1.insertEnergy(en);

                    String level = memoryHostRepository1.selectUserLevel(user_id);
                    if (level.equals("S")) {
                        en.setEnergy_saveuse((int) (refn_pay * 0.05));
                    } else if (level.equals("A")) {
                        en.setEnergy_saveuse((int) (refn_pay * 0.03));
                    } else if (level.equals("B")) {
                        en.setEnergy_saveuse((int) (refn_pay * 0.01));
                    }
                    en.setEnergy_source("[결제]적립취소");
                    memoryHostRepository1.insertEnergy(en);
                }

                // 환불 테이블 insert
                result += memoryHostRepository1.insertRefund(spdfirDTO);
            }
        }

        return result;
    }


    private RequestContentValueDTO contentProcessing (RequestContentValueDTO rciDTO) throws IOException {
        ContentEntity contentEntity = new ContentEntity();

        // 콘텐츠 저장
        // 카테고리 코드 가져오기
        String cate_no = memoryHostRepository1.selectCateNo(rciDTO.getCate_middle());
        rciDTO.setCate_no(cate_no);

        // 판매 종료일 저장
        if(rciDTO.getCont_endate_type().equals("default")) {
            LocalDate now = LocalDate.now();
            rciDTO.setCont_endate(now.plusMonths(1) + " 00:00:00");
        }

        // 이미지 파일명 변경하여 저장 (중복 제거를 위해 날짜 사용)
        String path = "src/main/webapp/storage/";
        List<MultipartFile> imgs = rciDTO.getCont_imgs();
        List<String> imgNames = new ArrayList<>();
        for (int i=0; i<imgs.size(); i++) {
            long nano = System.currentTimeMillis();
            String now = new SimpleDateFormat("SSSssmmHHddMMYY").format(nano);
            String newFileName = now + imgs.get(i).getOriginalFilename();
            File targetFile = new File(path + newFileName);
            InputStream filesStream = imgs.get(i).getInputStream();
            FileUtils.copyInputStreamToFile(filesStream, targetFile);
            imgNames.add(newFileName);
        }
        rciDTO.setCont_img(imgNames);

        return rciDTO;
    }

    private List<ProdEntity> prodProcessing (RequestContentValueDTO rciDTO) {
        List<ProdEntity> optionListP = new ArrayList<>();

        // 각 옵션 리스트 얻기
        List<String> prod_names = rciDTO.getProd_name();
        List<Integer> prod_qtys = rciDTO.getProd_qty();
        List<Integer> prod_prices = rciDTO.getProd_price();

        // map 타입으로 저장하여 옵션리스트에 저장
        for (int i = 0; i < prod_names.size(); i++) {
            ProdEntity prodEntity = new ProdEntity();
            prodEntity.setCont_no(rciDTO.getCont_no());
            prodEntity.setProd_name(prod_names.get(i));
            prodEntity.setProd_qty(prod_qtys.get(i));
            prodEntity.setProd_price(prod_prices.get(i));
            optionListP.add(prodEntity);
        }
        return optionListP;
    }

    private List<OneEntity> oneProcessing (RequestContentValueDTO rciDTO) {
        List<OneEntity> optionListO = new ArrayList<>();

        // 각 옵션 리스트 얻기
        List<String> one_dates = rciDTO.getOne_date();
        List<Integer> one_maxqties = rciDTO.getOne_maxqty();
        List<Integer> one_prices = rciDTO.getOne_price();

        // map 타입으로 저장하여 옵션리스트에 저장
        for (int i = 0; i < one_dates.size(); i++) {
            OneEntity oneEntity = new OneEntity();
            oneEntity.setCont_no(rciDTO.getCont_no());
            List str = List.of((one_dates.get(i)).split("T"));
            String oneDate = str.get(0) + " " + str.get(1) + ":00";
            oneEntity.setOne_date(oneDate);
            oneEntity.setOne_maxqty(one_maxqties.get(i));
            oneEntity.setOne_price(one_prices.get(i));
            optionListO.add(oneEntity);
        }
        return optionListO;
    }

    // 호스트 이미지 가져오기
    @Override
    public String getHostImg(String host_id) {
        return memoryHostRepository1.getHostImg(host_id);
    }





    // 수정전 해빗 값 가져오기1
    @Override
    public CategoryAndContentVO contentSelectOne(int cont_no) {

        return memoryHostRepository1.contentSelectOne(cont_no);
    }


    @Override
    public List<OneEntity> oneList(int cont_no) {
        return memoryHostRepository1.oneList(cont_no);
    }

    @Override
    public List<ProdEntity> prodList(int cont_no) {
        return memoryHostRepository1.prodList(cont_no);
    }

    @Override
    public Map<String, Object> contentUpdateBefore(int cont_no) {
        Map<String, Object> map = new HashMap<>();

        List<OneEntity> oneList = memoryHostRepository1.oneList(cont_no);
        List<ProdEntity> prodList = memoryHostRepository1.prodList(cont_no);
        List<Map<String, Object>> cateList = memoryHostRepository1.cateList();

        map.put("item", memoryHostRepository1.contentSelectOne(cont_no));
        map.put("cateList", cateList);

        if (oneList.size() > 0) {
            for (OneEntity entity : oneList) {
                String pro_no = entity.getPro_no();
                int result = memoryHostRepository1.optionPurchaseCheck(pro_no);
                if (result > 0) {
                    entity.setOne_status("N");
                }
            }
            map.put("option", oneList);
            map.put("optionType", "one");

        } else {
            for (ProdEntity entity : prodList) {
                String pro_no = entity.getPro_no();
                int result = memoryHostRepository1.optionPurchaseCheck(pro_no);
                if (result > 0) {
                    entity.setProd_status("N");
                }
            }
            map.put("option", prodList);
            map.put("optionType", "prod");
        }
        return map;
    }

    @Override
    public int optionDelete(RequestOptionDeleteDTO reqOptDelDTO) {
        return memoryHostRepository1.deleteOption(reqOptDelDTO);
    }

    @Override
    public int optionUpdate(RequestOptionDTO reqOptDTO) {
        int result = 0;
        String optionType = reqOptDTO.getOptionType();

        // 해빗 수정
        List<Map<String, Object>> updateOptionList = reqOptDTO.getUpdateOption();
        if (updateOptionList != null) {

            if (optionType.equals("prod")) {
                for (Map<String, Object> map : updateOptionList) {
                    result += memoryHostRepository1.updateProd(map);
                }
            } else if (optionType.equals("one")) {
                for (Map<String, Object> map : updateOptionList) {
                    result += memoryHostRepository1.updateOne(map);
                }
            }

            System.out.println("result = " + result);
        }

        List<Map<String, Object>> newOptionList = reqOptDTO.getNewOption();
        if (newOptionList != null) {

            if (optionType.equals("prod")) {

                List<ProdEntity> entityList = new ArrayList<>();
                for (Map<String, Object> map : newOptionList) {
                    ProdEntity entity = new ProdEntity();
                    entity.setProd_name((String) map.get("prod_name"));
                    entity.setProd_qty(Integer.parseInt((String) map.get("prod_qty")));
                    entity.setProd_price(Integer.parseInt((String) map.get("prod_price")));
                    entityList.add(entity);
                }
                result += memoryHostRepository1.insertProd(entityList);

            } else if (optionType.equals("one")) {

                List<OneEntity> entityList = new ArrayList<>();
                for (Map<String, Object> map : newOptionList) {
                    OneEntity entity = new OneEntity();
                    entity.setOne_date((String) map.get("one_date"));
                    entity.setOne_maxqty(Integer.parseInt((String) map.get("one_maxqty")));
                    entity.setOne_price(Integer.parseInt((String) map.get("one_price")));
                    entityList.add(entity);
                }
                result += memoryHostRepository1.insertOne(entityList);

            }

        }
        return result;
    }
}
