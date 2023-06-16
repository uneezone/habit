package com.habit.host1.service;

import com.habit.host1.entity.ContentDTO;
import com.habit.host1.entity.OneDTO;
import com.habit.host1.entity.ProdDTO;
import com.habit.host1.model.MemoryHostRepository1;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
    public int contentInsert (Map<String, Object> map) throws IOException {
        int result = 0;

        ContentDTO contentDTO = new ContentDTO();

        // 콘텐츠 저장
        // 카테고리 코드 가져오기
        String cate_no = memoryHostRepository1.selectCateNo((String) map.get("cate_middle"));
        map.put("cate_no", cate_no);

        // 해시태그2 리스트 저장
        String cont_hashtag2 = "";
        List contHashtag2List = (List) map.get("cont_hashtag2");
        for (int i=0; i<contHashtag2List.size(); i++) {
            if(i == contHashtag2List.size()-1) {
                cont_hashtag2 += contHashtag2List.get(i);
            } else {
                cont_hashtag2 += contHashtag2List.get(i) + "|";
            }
        }
        map.put("cont_hashtag2", cont_hashtag2);

        // 해시태그3 리스트 저장
        String cont_hashtag4 = "";
        List contHashtag4List = (List) map.get("cont_hashtag4");
        for (int i=0; i<contHashtag4List.size(); i++) {
            if(i == contHashtag4List.size()-1) {
                cont_hashtag4 += contHashtag4List.get(i);
            } else {
                cont_hashtag4 += contHashtag4List.get(i) + "|";
            }
        }
        map.put("cont_hashtag4", cont_hashtag4);

        // 판매 종료일 저장
        if(map.get("cont_endate_type").equals("default")) {
            LocalDate now = LocalDate.now();
            now.plusMonths(1);
            map.put("cont_endate", now.plusMonths(1) + " 00:00:00");
        }

        // 이미지 파일명 변경하여 저장 (중복 제거를 위해 UUID 사용)
        String cont_img = "";
        String path = "src/main/webapp/storage/";
        List<MultipartFile> imgs = (List) map.get("cont_img");
        for (int i=0; i<imgs.size(); i++) {
            UUID uuid = UUID.randomUUID();
            String newFileName = uuid + imgs.get(i).getOriginalFilename();
            File targetFile = new File(path + newFileName);
            InputStream filesStream = imgs.get(i).getInputStream();
            FileUtils.copyInputStreamToFile(filesStream, targetFile);
            if (i == imgs.size() - 1) {
                cont_img += newFileName;
            } else {
                cont_img += newFileName + "|";
            }
        }
        map.put("cont_img", cont_img);

        // 콘텐츠 테이블에 insert 결과
        int insertContResult = memoryHostRepository1.insertCont(map);

        // 옵션 저장
        // insert된 콘텐츠 번호 가져오기
        int cont_no = (int) map.get("cont_no");
        System.out.println("cont_no = " + cont_no);

        // 판매유형에 따른 필요없는 옵션 삭제
        List<ProdDTO> optionListP = new ArrayList<>(); // 회차권, 인원권 옵션 리스트 저장 공간
        List<OneDTO> optionListO = new ArrayList<>(); // 회차권, 인원권 옵션 리스트 저장 공간
        if(map.get("cont_type").equals("prod")) { // 옵션이 회차권, 인원권이라면

            // 원데이클래스 옵션에 관한 map entity 삭제
            map.remove("one_date");
            map.remove("one_maxqty");
            map.remove("one_price");

            // 각 옵션 리스트 얻기
            List prod_name = (List) map.get("prod_name");
            List prod_qty = (List) map.get("prod_qty");
            List prod_price = (List) map.get("prod_price");
            System.out.println("prod_qty = " + prod_qty);
            System.out.println("prod_name = " + prod_name);
            System.out.println("prod_price = " + prod_price);

            // map 타입으로 저장하여 옵션리스트에 저장
            for (int i = 0; i < prod_name.size(); i++) {
                ProdDTO prodDTO = new ProdDTO();
                prodDTO.setCont_no(cont_no);
                prodDTO.setProd_name((String) prod_name.get(i));
                prodDTO.setProd_qty(Integer.parseInt((String) prod_qty.get(i)));
                prodDTO.setProd_price(Integer.parseInt((String) prod_price.get(i)));
                System.out.println("prodDTO = " + prodDTO);
                optionListP.add(prodDTO);
            }

            // 인원권, 회차권 옵션 테이블 insert
            int insertProdResult = memoryHostRepository1.insertProd(optionListP);

        } else if (map.get("cont_type").equals("one")) { // 옵션이 원데이 클래스 라면

            // 인원권, 회차권 옵션에 관한 map entity 삭제
            map.remove("prod_name");
            map.remove("prod_qty");
            map.remove("prod_price");

            // 각 옵션 리스트 얻기
            List one_date = (List) map.get("one_date");
            List one_maxqty = (List) map.get("one_maxqty");
            List one_price = (List) map.get("one_price");

            // map 타입으로 저장하여 옵션리스트에 저장
            for (int i = 0; i < one_date.size(); i++) {
                OneDTO oneDTO = new OneDTO();
                oneDTO.setCont_no(cont_no);

                List str = List.of(((String) one_date.get(i)).split("T"));
                String oneDate = str.get(0) + " " + str.get(1) + ":00";
                System.out.println("oneDate = " + oneDate);
                oneDTO.setOne_date(oneDate);

                oneDTO.setOne_maxqty(Integer.parseInt((String)one_maxqty.get(i)));
                oneDTO.setOne_price(Integer.parseInt((String)one_price.get(i)));
                optionListO.add(oneDTO);
            }

            // 원데이 클래스 옵션 테이블 insert
            int insertOneResult = memoryHostRepository1.insertOne(optionListO);
        }

        return 0;
    }

    // 리뷰 List 가져오기

    @Override
    public List<Map<String, Object>> reviewList(Map<String, Object> map) {
        return memoryHostRepository1.reviewList(map);
    }
}
