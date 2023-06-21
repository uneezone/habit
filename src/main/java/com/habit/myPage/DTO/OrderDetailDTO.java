package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.bind.annotation.GetMapping;

@Getter @Setter @ToString
public class OrderDetailDTO {

    private String pro_no;
    private String refn_status;
    private int payd_qty;
    private int payd_price;
    private int payd_no;

    private String cont_name;
    private String cont_img;
    private String op_name;
    private Integer cont_no;

    private int refn_pay;
    private int refn_qty;
    private String refn_date;
    private int refn_point;
    private String refn_method;
}
