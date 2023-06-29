package com.habit.host1.DTO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;
import java.util.Map;

@ToString
@Getter @Setter
public class RequestOptionDTO {
    private int cont_no;
    private String optionType;
    private List<Map<String, Object>> updateOption;
    private List<Map<String, Object>> newOption;
}
