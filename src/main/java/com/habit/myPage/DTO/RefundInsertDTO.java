package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class RefundInsertDTO {

    private String payd_no;
    private String pro_no;
    private String refn_price;
    private String refn_point;
    private String refn_qty;
    private String pay_method;
    private String user_id;
}
