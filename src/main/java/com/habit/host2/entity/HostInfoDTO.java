package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class HostInfoDTO {

    private String host_id;
    private String host_img;
    private String host_name;
    private String host_email;
    private String host_phone;
    private String host_intro;
    private String host_bank;
    private String host_account;
    private String host_acholder;

    public HostInfoDTO() {
    }


}
