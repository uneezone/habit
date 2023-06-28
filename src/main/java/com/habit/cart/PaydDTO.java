package com.habit.cart;

public class PaydDTO {

    private int payd_no; // 주문상세번호
    private String pay_no; // 주문서 번호
    private String user_id; // 유저 아이디
    private String pro_no;// 상품 코드
    private String refn_status; // 환불상태
    private int payd_price; // 금액
    private int payd_qty; // 주문수량
    private int payd_status; // 주문상세상태
    private String payd_date; // 주문날짜

    public PaydDTO(){}

    public int getPayd_no() {
        return payd_no;
    }

    public void setPayd_no(int payd_no) {
        this.payd_no = payd_no;
    }

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

    public String getPro_no() {
        return pro_no;
    }

    public void setPro_no(String pro_no) {
        this.pro_no = pro_no;
    }

    public String getRefn_status() {
        return refn_status;
    }

    public void setRefn_status(String refn_status) {
        this.refn_status = refn_status;
    }

    public int getPayd_price() {
        return payd_price;
    }

    public void setPayd_price(int payd_price) {
        this.payd_price = payd_price;
    }

    public int getPayd_qty() {
        return payd_qty;
    }

    public void setPayd_qty(int payd_qty) {
        this.payd_qty = payd_qty;
    }

    public int getPayd_status() {
        return payd_status;
    }

    public void setPayd_status(int payd_status) {
        this.payd_status = payd_status;
    }

    public String getPayd_date() {
        return payd_date;
    }

    public void setPayd_date(String payd_date) {
        this.payd_date = payd_date;
    }
}
