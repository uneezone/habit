package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@ToString
@Getter @Setter
public class RequestContentListDTO {
    private String filter;
    private String host_id;
    private String cont_name;
    private String searchDateType;
    private String searchStartDate;
    private String searchEndDate;
    private List<String> cont_status;
}
