package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class RefundInfoDTO {

    private String op_name;
    private String pro_no;
    private String pay_no;
    private String payd_no;
    private int payd_price;
    private int payd_qty;
    private String payd_date;
    private String pay_method;
    private int pay_point;
    private String  cont_img;
    private String cont_name;
}
