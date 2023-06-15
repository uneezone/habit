package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductDTO {

    private String pro_no;
    private String prod_name;
    private String cont_name;
    private String user_id;
    private Long payd_no;
    private String pay_no;
    private Long payd_price;
    private Long payd_qty;
    private String payd_status;
    private String refn_status;
    private String payd_date;

}
