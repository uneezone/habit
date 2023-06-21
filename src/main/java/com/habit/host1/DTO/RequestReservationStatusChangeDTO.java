package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class RequestReservationStatusChangeDTO {
    private int payd_no;
    private String payd_status;
    private String refn_status;
}
