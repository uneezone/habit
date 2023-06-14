package com.habit.host2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class HostInfoDTO {

    private String hostId;
    private String hostImg;
    private String hostName;
    private String hostEmail;
    private String hostPhone;
    private String hostIntro;
    private String hostBank;
    private String hostAccount;
    private String hostAcholder;

    public HostInfoDTO() {
    }
}
