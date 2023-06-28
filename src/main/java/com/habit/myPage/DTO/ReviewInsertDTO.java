package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Getter @Setter @ToString
public class ReviewInsertDTO {

    private String user_id;
    private String review_star;
    private String review_cont;
    private List<String> review_img;
    private int cont_no;
    private int payd_no;
    private String review_feed;
    private String review_ask;
}
