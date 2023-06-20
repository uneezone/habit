package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class AdjustPaydDTO {

    private Long payd_no;
    private String pro_no;
    private int payd_price;
    private int payd_qty;
    private String refn_status;
    private String payd_date;
}
