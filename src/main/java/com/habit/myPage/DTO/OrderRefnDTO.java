package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OrderRefnDTO {

    private int refn_pay;
    private int refn_qty;
    private String refn_date;
    private int refn_point;
    private String refn_method;
}
