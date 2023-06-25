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
        int insertContResult = memoryHostRepository1.updateContent(rciDTO);

        // 판매유형에 따른 옵션 insert
        if(rciDTO.getCont_type().equals("prod")) { // 옵션이 회차권, 인원권이라면
            // cont_no에 따른 수정 전 옵션 삭제
            memoryHostRepository1.deleteProd(rciDTO.getCont_no());

            // 인원권, 회차권 옵션 테이블 insert
            List<ProdEntity> optionListP = prodProcessing(rciDTO);
            int insertProdResult = memoryHostRepository1.insertProd(optionListP);

        } else if (rciDTO.getCont_type().equals("one")) { // 옵션이 원데이 클래스 라면
            // cont_no에 따른 수정 전 옵션 삭제
            memoryHostRepository1.deleteOne(rciDTO.getCont_no());

            // 원데이 클래스 옵션 테이블 insert
            List<OneEntity> optionListO = oneProcessing(rciDTO);
            int insertOneResult = memoryHostRepository1.insertOne(optionListO);
        }

        return 0;
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
            int totalCount = memoryHostRepository1.contentListCount(reqContListDTO);
            for (ResponseContentListDTO dto : list) {
                String cont_img = dto.getCont_img().trim().split("\\|")[0];
                dto.setCont_img(cont_img);
            }
            list.get(0).setTotalCount(totalCount);
        }
        return list;
    }

    // 해빗 삭제
    @Override
    public int deleteContent(int cont_no) {
        return memoryHostRepository1.deleteContent(cont_no);
    }

    // 수정전 해빗 값 가져오기
    @Override
    public RequestContentValueDTO contentSelectOne(int cont_no) {

        CategoryAndContentDTO cateAndContDTO = memoryHostRepository1.contentSelectOne(cont_no);
        RequestContentValueDTO reqContInsDTO = new RequestContentValueDTO();
        if (cateAndContDTO != null) {

            // 카테고리 불러오기
            reqContInsDTO.setCate_list(memoryHostRepository1.cateList());
            reqContInsDTO.setCont_no(cont_no);
            reqContInsDTO.setCate_large(cateAndContDTO.getCate_large());
            reqContInsDTO.setCate_middle(cateAndContDTO.getCate_middle());
            reqContInsDTO.setCont_name(cateAndContDTO.getCont_name());
            reqContInsDTO.setCont_zip(cateAndContDTO.getCont_zip());
            reqContInsDTO.setCont_addr1(cateAndContDTO.getCont_addr1());
            reqContInsDTO.setCont_addr2(cateAndContDTO.getCont_addr2());
            reqContInsDTO.setCont_extaddr(cateAndContDTO.getCont_extaddr());
            reqContInsDTO.setCont_hashtag1(cateAndContDTO.getCont_hashtag1());
            reqContInsDTO.setCont_hashtag3(cateAndContDTO.getCont_hashtag3());
            reqContInsDTO.setCont_hashtag5(cateAndContDTO.getCont_hashtag5());
            reqContInsDTO.setCont_endate(cateAndContDTO.getCont_endate());
            reqContInsDTO.setCont_stdate(cateAndContDTO.getCont_stdate());
            reqContInsDTO.setCont_content(cateAndContDTO.getCont_content());

            // 해시태그2
            List<String> cont_hashtag2 = List.of(cateAndContDTO.getCont_hashtag2().trim().split("\\|"));
            reqContInsDTO.setCont_hashtag2(cont_hashtag2);

            // 해시태그4
            List<String> cont_hashtag4 = List.of(cateAndContDTO.getCont_hashtag4().trim().split("\\|"));
            reqContInsDTO.setCont_hashtag4(cont_hashtag4);

            // 이미지
            List<String> cont_imgs = List.of(cateAndContDTO.getCont_img().trim().split("\\|"));
            reqContInsDTO.setCont_img(cont_imgs);

            // 옵션값 가져오기
            List<OneEntity> oneEntities = memoryHostRepository1.oneList(cont_no);
            List<ProdEntity> prodEntities = memoryHostRepository1.prodList(cont_no);
            if (oneEntities.size() > 0) {
                List<String> one_date = new ArrayList<>();
                List<Integer> one_maxqty = new ArrayList<>();
                List<Integer> one_price = new ArrayList<>();
                reqContInsDTO.setCont_type("one");
                for (OneEntity oneEntity : oneEntities) {
                    one_date.add(oneEntity.getOne_date());
                    one_maxqty.add(oneEntity.getOne_maxqty());
                    one_price.add(oneEntity.getOne_price());
                }
                reqContInsDTO.setOne_date(one_date);
                reqContInsDTO.setOne_maxqty(one_maxqty);
                reqContInsDTO.setOne_price(one_price);

            } else if (prodEntities.size() > 0){
                List<String> prod_name = new ArrayList<>();
                List<Integer> prod_qty = new ArrayList<>();
                List<Integer> prod_price = new ArrayList<>();
                reqContInsDTO.setCont_type("prod");
                for (ProdEntity prodEntity : prodEntities) {
                    prod_name.add(prodEntity.getProd_name());
                    prod_qty.add(prodEntity.getProd_qty());
                    prod_price.add(prodEntity.getProd_price());
                }
                reqContInsDTO.setProd_name(prod_name);
                reqContInsDTO.setProd_qty(prod_qty);
                reqContInsDTO.setProd_price(prod_price);
            }

        }
        System.out.println("reqContInsDTO = " + reqContInsDTO);
        return reqContInsDTO;
    }

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
                    en.setUser_id(spdfirDTO.getUser_id());
                    en.setEnergy_saveuse(pay_point);
                    en.setEnergy_source("[결제]호스트취소");
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
}
