package com.habit.energy;

public class EnergyDTO {

    private int energy_no;
    private String user_id;
    private int energy_saveuse;
    private String energy_date;
    private String energy_sources;

    public EnergyDTO(){}

    public int getEnergy_no() {
        return energy_no;
    }

    public void setEnergy_no(int energy_no) {
        this.energy_no = energy_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getEnergy_saveuse() {
        return energy_saveuse;
    }

    public void setEnergy_saveuse(int energy_saveuse) {
        this.energy_saveuse = energy_saveuse;
    }

    public String getEnergy_date() {
        return energy_date;
    }

    public void setEnergy_date(String energy_date) {
        this.energy_date = energy_date;
    }

    public String getEnergy_sources() {
        return energy_sources;
    }

    public void setEnergy_sources(String energy_sources) {
        this.energy_sources = energy_sources;
    }
}
