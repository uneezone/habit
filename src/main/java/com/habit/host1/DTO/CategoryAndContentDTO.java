package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter @Getter
public class CategoryAndContentDTO {
    private String cate_large;
    private String cate_middle;
    private String cont_name;
    private String cont_zip;
    private String cont_addr1;
    private String cont_addr2;
    private String cont_extaddr;
    private String cont_hashtag1;
    private String cont_hashtag2;
    private String cont_hashtag3;
    private String cont_hashtag4;
    private String cont_hashtag5;
    private String cont_endate;

    private String cont_stdate;
    private String cont_img;
    private String cont_content;
}
