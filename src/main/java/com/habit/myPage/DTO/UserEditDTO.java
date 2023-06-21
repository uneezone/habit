package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class UserEditDTO {

    private String user_name;
    private String user_img;
    private int user_phone1;
    private int user_phone2;
    private int user_phone3;
    private String user_email1;
    private String user_email2;
    private String user_pw;
    private String user_birth;
}
