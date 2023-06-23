package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class SelectPayDetailForInsertRefundDTO {

    private int refn_point;
    private int refn_pay;
    private int payd_no;
    private String user_id;
    private String pro_no;
    private int payd_price;
    private int payd_qty;
    private int pay_point;
    private String pay_method;

}
