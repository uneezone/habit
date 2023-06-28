package com.habit.product;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDTO {

    private String cont_name;
    private Long cont_no;
    private String cont_img;
    private String cont_addr1;
    private int price;
    private double review_avg;
    private int review_count;
}
