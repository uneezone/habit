package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class EnergyEntity {
    private int energy_no;
    private String user_id;
    private int energy_saveuse;
    private String energy_date;
    private String energy_source;
}
