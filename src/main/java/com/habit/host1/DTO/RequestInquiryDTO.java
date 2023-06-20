package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class RequestInquiryDTO {
    private String host_id;
    private String searchStartDate;
    private String searchEndDate;

    private String searchKeywordType;
    private String searchKeyword;

    private int page;
    private int recordSize;

    public RequestInquiryDTO() {
        this.page = 1;
        this.recordSize = 5;
    }
}
