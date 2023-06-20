package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class HostHomeDTO {

    private Long allSalePrice;
    private Long monthSalePrice;
    private Long allCase;
    private Long cancelCase;
    private Long allReview;
    private double avgStar;
    private double response;
}
