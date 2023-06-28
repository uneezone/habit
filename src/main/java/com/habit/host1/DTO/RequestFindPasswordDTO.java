package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter @Setter
public class RequestFindPasswordDTO {

    private String methodOfFine;
    private String methodValue;
    private String newPassword;
}
