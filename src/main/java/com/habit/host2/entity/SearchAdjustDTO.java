package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class SearchAdjustDTO {

    private String host_id;
    private String cont_date;
    private String start_date;
    private String end_date;

    //페이징
    //시작페이지
    private int startPaging;

    //보여줄 상품갯수
    private int showLength;


}
