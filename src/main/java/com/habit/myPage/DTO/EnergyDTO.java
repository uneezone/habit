package com.habit.myPage.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class EnergyDTO {

    private String user_id;
    private int energy_saveuse;
    private String energy_sources;

}
