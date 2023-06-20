package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class ResponseInquiryDTO {
    private String id;
    private int cont_no;
    private String cont_name;
    private String q_question;
    private String q_bedate;
    private String q_div;
    private int q_group;
    private int totalCount;
    private String q_status;

}
