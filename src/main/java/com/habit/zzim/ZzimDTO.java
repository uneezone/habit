package com.habit.zzim;

public class ZzimDTO {

    private int cont_no;
    private String cont_name;
    private int pro_no;
    private int one_price;
    private int pro_no2;
    private int prod_price;
    private double starpoint;
    private int num_of_review;
    private String cont_place;
    private String cont_img;
    private int zzim_no;
    private String user_id;

    public ZzimDTO(){}

    public int getZzim_no() {
        return zzim_no;
    }

    public void setZzim_no(int zzim_no) {
        this.zzim_no = zzim_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getCont_no() {
        return cont_no;
    }

    public void setCont_no(int cont_no) {
        this.cont_no = cont_no;
    }
}
