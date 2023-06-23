package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class ResponseReservationDTO {
    private String cont_name;
    private String one_date;
    private int cont_no;
    private String user_id;
    private String user_gender;
    private String user_phone;
    private int payd_no;
    private int payd_qty;
    private String payd_status;
    private String pro_no;
    private int totalCount;
}
