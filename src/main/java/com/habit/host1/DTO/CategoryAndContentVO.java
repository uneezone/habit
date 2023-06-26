package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@ToString
@Getter @Setter
public class CategoryAndContentVO {
    private String cate_large;
    private String cate_middle;
    private String cont_name;
    private String cont_zip;
    private String cont_addr1;
    private String cont_addr2;
    private String cont_extaddr;
    private String cont_hashtag1;
    private String cont_hashtag2;
    private List<String> hashtag2;
    private String cont_hashtag3;
    private String cont_hashtag4;
    private List<String> hashtag4;
    private String cont_hashtag5;
    private String cont_endate;

    private String cont_stdate;
    private String cont_img;
    private List<String> imgs;
    private String cont_content;

    public void setCont_hashtag2(String cont_hashtag2) {
        this.hashtag2 = List.of(cont_hashtag2.trim().split("\\|"));
    }

    public void setCont_hashtag4(String cont_hashtag4) {
        this.hashtag4 = List.of(cont_hashtag4.trim().split("\\|"));
    }

    public void setCont_img(String cont_img) {
        this.imgs = List.of(cont_img.trim().split("\\|"));
    }

}
