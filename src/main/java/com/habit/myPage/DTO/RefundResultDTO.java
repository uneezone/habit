package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class RefundResultDTO {

    private int refn_pay;
    private int refn_qty;
    private int refn_point;
    private String pay_method;
    private String refn_date;
    private String op_name;
    private String cont_img;
    private String cont_name;

}
