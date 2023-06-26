package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@ToString
@Getter
@Setter
public class RequestReviewDTO {

    private ResponsePageVO vo;
    private String filter;
    private String host_id;
    private List<Integer> starScore;
    private String reviewContKeyword;
    private String searchUserId;

    public RequestReviewDTO() {
        vo = new ResponsePageVO();
    }
}
