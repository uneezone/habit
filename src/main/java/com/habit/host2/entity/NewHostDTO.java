package com.habit.host2.entity;

public class NewHostDTO {

    private String hostId;
    private String hostImg;
    private String hostName;
    private String hostEmail1;
    private String hostEmail2;
    private String hostPhone1;
    private String hostPhone2;
    private String hostPhone3;

    public NewHostDTO() {
    }

    public String getHostId() {
        return hostId;
    }

    public void setHostId(String hostId) {
        this.hostId = hostId;
    }

    public String getHostImg() {
        return hostImg;
    }

    public void setHostImg(String hostImg) {
        this.hostImg = hostImg;
    }

    public String getHostName() {
        return hostName;
    }

    public void setHostName(String hostName) {
        this.hostName = hostName;
    }

    public String getHostEmail1() {
        return hostEmail1;
    }

    public void setHostEmail1(String hostEmail1) {
        this.hostEmail1 = hostEmail1;
    }

    public String getHostEmail2() {
        return hostEmail2;
    }

    public void setHostEmail2(String hostEmail2) {
        this.hostEmail2 = hostEmail2;
    }

    public String getHostPhone1() {
        return hostPhone1;
    }

    public void setHostPhone1(String hostPhone1) {
        this.hostPhone1 = hostPhone1;
    }

    public String getHostPhone2() {
        return hostPhone2;
    }

    public void setHostPhone2(String hostPhone2) {
        this.hostPhone2 = hostPhone2;
    }

    public String getHostPhone3() {
        return hostPhone3;
    }

    public void setHostPhone3(String hostPhone3) {
        this.hostPhone3 = hostPhone3;
    }

    @Override
    public String toString() {
        return "NewHostDTO{" +
                "hostId='" + hostId + '\'' +
                ", hostImg='" + hostImg + '\'' +
                ", hostName='" + hostName + '\'' +
                ", hostEmail1='" + hostEmail1 + '\'' +
                ", hostEmail2='" + hostEmail2 + '\'' +
                ", hostPhone1='" + hostPhone1 + '\'' +
                ", hostPhone2='" + hostPhone2 + '\'' +
                ", hostPhone3='" + hostPhone3 + '\'' +
                '}';
    }
}
