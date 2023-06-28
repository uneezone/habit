package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReviewWriteDTO {

    private String cont_img;
    private String payd_date;
    private String cont_name;
    private String op_name;
    private int cont_no;
    private int payd_no;

    private String review_img;
    private int review_star;
    private String review_cont;
    private String review_feed;
    private String review_ask;
}
