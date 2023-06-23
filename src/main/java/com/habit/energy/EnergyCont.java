package com.habit.energy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class EnergyCont {

    public EnergyCont(){
        System.out.println("----EnergyCont() 객체 생성됨");
    }

    @Autowired
    EnergyDAO energyDAO;

}
