package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class OrderAllDTO {

    private Long payd_no;
    private String pro_no;
    private Long payd_qty;
    private String refn_status;

    private String cont_name;
    private String cont_img;
    private String op_name;
    private Integer cont_no;
}
