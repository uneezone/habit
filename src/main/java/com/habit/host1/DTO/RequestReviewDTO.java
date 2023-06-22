package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@ToString
@Getter @Setter
public class RequestReviewDTO {
    private String filter;
    private String host_id;
    private List<Integer> starScore;
    private String reviewContKeyword;
    private String searchUserId;
    private int page;
    private int recordSize;

    public RequestReviewDTO() {
        this.page = 1;
        this.recordSize = 5;
    }
}
