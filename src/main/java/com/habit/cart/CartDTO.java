package com.habit.cart;


public class CartDTO {

    private int cl_no; //장바구니코드
    private String user_id; //유저아이디
    private String pro_no; // 상품코드
    private int cl_qty; // 수량
    private String cl_date; // 장바구니 등록일
    private String cont_name; // 컨텐츠명
    private String cont_img; //컨텐츠 이미지
    private int one_price; // 상품 한개당 가격
    private int prod_price; //회차권인원권 가격

    private String prod_name; // 회차권인원권 세부이름(1회차, 10회차 등등의 옵션느낌)

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

    public int getOne_price() {
        return one_price;
    }

    public void setOne_price(int one_price) {
        this.one_price = one_price;
    }


    public int getProd_price() {
        return prod_price;
    }

    public void setProd_price(int prod_price) {
        this.prod_price = prod_price;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
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
                ", one_price=" + one_price +
                ", prod_price=" + prod_price +
                ", prod_name='" + prod_name + '\'' +
                '}';
    }
}
