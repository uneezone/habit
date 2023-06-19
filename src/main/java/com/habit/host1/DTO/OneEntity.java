package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class OneEntity {
    public OneEntity() {}

    private String pro_no;
    private int cont_no;
    private String one_date;
    private int one_maxqty;
    private int one_price;
    private int one_status;
}
