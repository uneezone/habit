package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@ToString
@Getter @Setter
public class RequestContentListDTO {
    private int click;
    private SeeMoreVO vo;
    private String filter;
    private String host_id;
    private String cont_name;
    private String searchDateType;
    private String searchStartDate;
    private String searchEndDate;
    private List<String> cont_status;
    public RequestContentListDTO() {
        this.vo = new SeeMoreVO();
    }
}
