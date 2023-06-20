package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class ResponseContentListDTO {
    private int cont_no;
    private String host_id;
    private String cont_name;
    private String cont_img;
    private String cont_endate;
    private String cont_hashtag1;
    private String cont_hashtag2;
    private String cont_hashtag3;
    private String cont_hashtag4;
    private String cont_hashtag5;
    private String cont_status;

    private String cate_middle;

    private String cate_large;
    private int totalCount;
}
