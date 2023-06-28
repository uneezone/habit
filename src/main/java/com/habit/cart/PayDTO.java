package com.habit.cart;

public class PayDTO {

    private String pay_no; // 주문서번호
    private String user_id; // 유저아이디
    private int pay_total; // 할인 전 금액(총결제금액)
    private int pay_point; // 사용 에너지
    private String pay_method; //결제 수단
    private String pay_date; // 주문날짜
    private String pay_status; // 주문상태

//    private String pro_no; // 상품코드
//
//    private int payd_qty; // 주문수량
//    private int payd_price; // 구매 상세 상품별 구매 금액
    public PayDTO(){}

//    public int getPayd_price() {
//        return payd_price;
//    }
//
//    public void setPayd_price(int payd_price) {
//        this.payd_price = payd_price;
//    }

    public String getPay_no() {
        return pay_no;
    }

    public void setPay_no(String pay_no) {
        this.pay_no = pay_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getPay_total() {
        return pay_total;
    }

    public void setPay_total(int pay_total) {
        this.pay_total = pay_total;
    }

    public int getPay_point() {
        return pay_point;
    }

    public void setPay_point(int pay_point) {
        this.pay_point = pay_point;
    }

    public String getPay_method() {
        return pay_method;
    }

    public void setPay_method(String pay_method) {
        this.pay_method = pay_method;
    }

    public String getPay_date() {
        return pay_date;
    }

    public void setPay_date(String pay_date) {
        this.pay_date = pay_date;
    }

    public String getPay_status() {
        return pay_status;
    }

    public void setPay_status(String pay_status) {
        this.pay_status = pay_status;
    }

//    public String getPro_no() {
//        return pro_no;
//    }
//
//    public void setPro_no(String pro_no) {
//        this.pro_no = pro_no;
//    }
//
//    public int getPayd_qty() {
//        return payd_qty;
//    }
//
//    public void setPayd_qty(int payd_qty) {
//        this.payd_qty = payd_qty;
//    }
}
