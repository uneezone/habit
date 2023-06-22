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
    public List<Map<String, Object>> selectCate(String keyword) {
        return memoryHostRepository1.selectCate(keyword);
    }

    // 해빗 등록 (insert)
    @Override
    public int contentInsert (RequestContentInsertDTO rciDTO) throws IOException {
        int result = 0;

        ContentEntity contentEntity = new ContentEntity();

        // 콘텐츠 저장
        // 카테고리 코드 가져오기
        String cate_no = memoryHostRepository1.selectCateNo(rciDTO.getCate_middle());
        rciDTO.setCate_no(cate_no);

        // 판매 종료일 저장
        if(rciDTO.getCont_endate_type().equals("default")) {
            LocalDate now = LocalDate.now();
            now.plusMonths(1);
            rciDTO.setCont_endate(now.plusMonths(1) + " 00:00:00");
        }

        // 이미지 파일명 변경하여 저장 (중복 제거를 위해 UUID 사용)
//        String cont_img = "";
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

        // 콘텐츠 테이블에 insert 결과
        int insertContResult = memoryHostRepository1.insertCont(rciDTO);


        // 판매유형에 따른 옵션 insert
        List<ProdEntity> optionListP = new ArrayList<>();
        List<OneEntity> optionListO = new ArrayList<>();
        if(rciDTO.getCont_type().equals("prod")) { // 옵션이 회차권, 인원권이라면

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

            // 인원권, 회차권 옵션 테이블 insert
            int insertProdResult = memoryHostRepository1.insertProd(optionListP);

        } else if (rciDTO.getCont_type().equals("one")) { // 옵션이 원데이 클래스 라면

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

            // 원데이 클래스 옵션 테이블 insert
            int insertOneResult = memoryHostRepository1.insertOne(optionListO);
        }

        return 0;
    }

    // 리뷰 List 가져오기

    @Override
    public List<ResponseReviewDTO> reviewList(RequestReviewDTO reqReviewDTO) {
        List<ResponseReviewDTO> reviewList = memoryHostRepository1.reviewList(reqReviewDTO);
        if (reviewList.size() > 0) {
            int totalCount = memoryHostRepository1.totalCount(reqReviewDTO);
            reviewList.get(0).setTotalCount(totalCount);
        }
        return reviewList;
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
            int totalCount = memoryHostRepository1.contentListCount(reqContListDTO);
            list.get(0).setTotalCount(totalCount);
        }
        return list;
    }

    // 원데이클래스 예약건 List 가져오기
    @Override
    public List<ResponseReservationDTO> reservationList(RequestReservationDTO reqReservDTO) {
        List<ResponseReservationDTO> list = memoryHostRepository1.reservationList(reqReservDTO);
        if (list.size() > 0) {
            int totalCount = memoryHostRepository1.reservationListCount(reqReservDTO);
            list.get(0).setTotalCount(totalCount);
        }
        return list;
    }

    @Override
    public int reservationStatusChangeAndRefundInsert (RequestReservationStatusChangeDTO reqReservStatChg) {
        int returnResult = 0;

        String paydStatus = reqReservStatChg.getPayd_status();
        if (paydStatus.equals("Y")) {
            reqReservStatChg.setRefn_status("NRO");
        } else if (paydStatus.equals("C")) {
            reqReservStatChg.setRefn_status("HFRO");
        }
        // 주문상세 상태변경
        int result = memoryHostRepository1.reservationStatusChange(reqReservStatChg);

        // 환불 insert를 위한 주문서, 주문상세 select
        if (result == 1) {
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
                }

                // 환불 테이블 insert
                returnResult = memoryHostRepository1.insertRefund(spdfirDTO);
            }
        }

        return returnResult;
    }
}
