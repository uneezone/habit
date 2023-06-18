package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class AdjustInfoDTO {

    private String calc_no;
    private String host_id;
    private String calc_date;
    private String calc_title;
    private int calc_ttlprice;
    private int calc_fee;
    private String calc_status;
    private String calc_addate;
}
