package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@ToString
@Setter @Getter
public class RequestOptionDeleteDTO {
    private String optionType;
    private List<String> idList;
}
