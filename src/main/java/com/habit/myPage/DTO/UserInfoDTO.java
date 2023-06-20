package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString
public class UserInfoDTO {

    private String user_name;
    private String user_pw;
    private String user_email;
    private String user_phone;
    private String user_birth;
    private String user_img;
    private String user_id;
}
