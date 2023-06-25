package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@ToString
@Getter @Setter
public class RequestContentValueDTO {
    private String host_id;
    private String cate_no;
    private int cont_no;
    private String cate_large;
    private String cate_middle;
    private String cont_name;
    private String cont_zip;
    private String cont_addr1;
    private String cont_addr2;
    private String cont_extaddr;
    private String cont_hashtag1;
    private List<String> cont_hashtag2;
    private String cont_hashtag3;
    private List<String> cont_hashtag4;
    private String cont_hashtag5;
    private String cont_endate_type;
    private String cont_endate;
    private String cont_stdate;
    private String cont_type;

    private List<Map<String, Object>> cate_list;
    private List<String> prod_name;
    private List<Integer> prod_qty;
    private List<Integer> prod_price;
    private List<String> one_date;
    private List<Integer> one_maxqty;
    private List<Integer> one_price;

    private List<MultipartFile> cont_imgs;
    private List<String> cont_img;
    private String cont_content;
}
