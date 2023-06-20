package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class CalcdDTO {

    private String calc_no;
    private Long payd_no;
    private String pro_no;
    private int calcd_price;
    private int calcd_qty;
    private String calcd_status;
    private String calcd_date;

    public CalcdDTO() {
    }

    public CalcdDTO(String calc_no, Long payd_no, String pro_no, int calcd_price, int calcd_qty, String calcd_status, String calcd_date) {
        this.calc_no = calc_no;
        this.payd_no = payd_no;
        this.pro_no = pro_no;
        this.calcd_price = calcd_price;
        this.calcd_qty = calcd_qty;
        this.calcd_status = calcd_status;
        this.calcd_date = calcd_date;
    }
}
