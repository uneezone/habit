package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class HostEditDTO {

    private String host_id;
    private String host_img;
    private String host_name;
    private String host_email1;
    private String host_email2;
    private String host_phone1;
    private String host_phone2;
    private String host_phone3;
    private String host_intro;
    private String host_bank;
    private String host_acholder;
    private Long host_account;
}
