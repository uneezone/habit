package com.habit.product;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class ReviewDTO {

    private int review_no;
    private String review_date;
    private String review_cont;
    private String review_img;
    private double review_star;
    private int payd_no;
    private int cont_no;
    private String user_id;
    private String user_name;
    private String user_img;
    private String cont_name;
}
