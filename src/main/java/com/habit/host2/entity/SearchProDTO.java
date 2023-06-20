package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchProDTO {

    private String host_id;
    private Long cont_no;
    private String pro_no;
    private String user_id;
    private String payd_status;
    private String startDate;
    private String endDate;

    //페이징
    //시작페이지
    private Long startPaging;

    //보여줄 상품갯수
    private Long showLength;

    //전체상품 갯수
    private Long allProductsLength;

    //인덱스갯수
    private int pagingIndex;


}
