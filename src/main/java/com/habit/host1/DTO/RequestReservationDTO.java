package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@ToString
@Getter @Setter
public class RequestReservationDTO {
    private ResponsePageVO vo;
    private String filter;
    private String host_id;
    private String cont_name;
    private String searchStartDate;
    private String searchEndDate;
    private String searchType;
    private String searchKeyword;
    private List<String> payd_status;

    public RequestReservationDTO() {
        vo = new ResponsePageVO();
    }
}
