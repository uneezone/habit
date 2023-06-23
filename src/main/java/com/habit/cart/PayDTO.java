package com.habit.cart;

public class PayDTO {

    private String pay_no; // 주문서번호
    private String user_id; // 유저아이디
    private int pay_total; // 할인 전 금액
    private int pay_point; // 사용 에너지
    private String pay_method; //결제 수단
    private String pay_date; // 주문날짜
    private String pay_status; // 주문상태

    private String pro_no; // 상품코드

    private int payd_qty; // 주문수량

    public PayDTO(){}



}
