package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class ResponseReviewDTO {
    private int totalCount;
    private String host_id;
    private String user_id;
    private String cont_name;
    private int review_no;
    private int review_star;
    private String review_cont;
    private String review_date;
}
