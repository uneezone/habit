package com.habit.host1.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class ProdDTO {
        public ProdDTO() {}

        private String pro_no;
        private int cont_no;
        private String prod_name;
        private int prod_qty;
        private int prod_price;
        private int prod_status;
}
