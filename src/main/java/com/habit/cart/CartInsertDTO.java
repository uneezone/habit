package com.habit.cart;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class CartInsertDTO {

    private String user_id;
    private String pro_no;
    private int cl_qty;
}
