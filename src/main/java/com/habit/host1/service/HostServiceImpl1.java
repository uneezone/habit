package com.habit.host1.service;

import com.habit.host1.model.MemoryHostRepository1;
import lombok.RequiredArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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

    //content insert service
    @Override
    public int contentInsert (Map<String, Object> map) {
        int result = 0;

        // 콘텐츠 저장
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
        if(map.get("cont_endate").equals("default")) {
            LocalDate now = LocalDate.now();
            now.plusMonths(1);
            map.put("cont_endate", now.plusMonths(1) + " 00:00:00");
        }

        // 이미지 파일 이름 저장 (중복 제거를 위해 UUID 사용)
        String cont_img = "";
        String Path = "src/main/webapp/storage";
        List<MultipartFile> imgs = (List) map.get("cont_img");
        for (int i=0; i<imgs.size(); i++) {
            UUID uuid = UUID.randomUUID();
            if (i == imgs.size() - 1) {
                cont_img += uuid + imgs.get(i).getOriginalFilename();
//                imgs.get(i).
            } else {
                cont_img += uuid + imgs.get(i).getOriginalFilename() + "|";
            }
        }
        map.put("cont_img", cont_img);
        System.out.println(map.get("cont_img"));

        // 옵션 저장
        // 판매유형에 따른 필요없는 옵션 삭제
        if(map.get("cont_no").equals("prod")) {
            map.remove("one_date");
            map.remove("one_maxqty");
            map.remove("one_price");
        } else if (map.get("cont_no").equals("one")) {
            map.remove("prod_name");
            map.remove("prod_qty");
            map.remove("prod_price");
        }
        System.out.println(map.get("cont_no"));
        System.out.println(map.get("prod_name"));
        System.out.println(map.get("one_date"));

        return 0;
    }
}
