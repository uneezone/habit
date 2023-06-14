package com.habit.host1.entity;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OneDTO {
    public OneDTO() {}

    private String pro_no;
    private int cont_no;
    private String one_date;
    private int one_maxqty;
    private int one_price;
    private int one_status;
}
