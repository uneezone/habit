package com.habit.cart;


public class CartDTO {

    private int cl_no; //장바구니코드
    private String user_id; //유저아이디
    private String pro_no; // 상품코드
    private int cl_qty; // 수량
    private String cl_date; // 장바구니 등록일
    private String cont_name; // 컨텐츠명
    private String cont_img; //컨텐츠 이미지
    private int price; // 상품 가격


    private String option; // 상품 옵션 정보
                           //원데이클래스 : 상품 실행일
                           //회차권인원권 : N회권


    public CartDTO(){}


    public int getCl_no() {
        return cl_no;
    }

    public void setCl_no(int cl_no) {
        this.cl_no = cl_no;
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

    public int getCl_qty() {
        return cl_qty;
    }

    public void setCl_qty(int cl_qty) {
        this.cl_qty = cl_qty;
    }

    public String getCl_date() {
        return cl_date;
    }

    public void setCl_date(String cl_date) {
        this.cl_date = cl_date;
    }

    public String getCont_name() {
        return cont_name;
    }

    public void setCont_name(String cont_name) {
        this.cont_name = cont_name;
    }

    public String getCont_img() {
        return cont_img;
    }

    public void setCont_img(String cont_img) {
        this.cont_img = cont_img;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    @Override
    public String toString() {
        return "CartDTO{" +
                "cl_no=" + cl_no +
                ", user_id='" + user_id + '\'' +
                ", pro_no='" + pro_no + '\'' +
                ", cl_qty=" + cl_qty +
                ", cl_date='" + cl_date + '\'' +
                ", cont_name='" + cont_name + '\'' +
                ", cont_img='" + cont_img + '\'' +
                ", price=" + price +
                ", option='" + option + '\'' +
                '}';
    }
}
