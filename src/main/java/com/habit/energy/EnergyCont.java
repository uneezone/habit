package com.habit.energy;

import com.habit.cart.PayCont;
import com.habit.cart.PayDTO;
import com.habit.member.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EnergyCont {

    public EnergyCont(){
        System.out.println("----EnergyCont() 객체 생성됨");
    }

    @Autowired
    EnergyDAO energyDAO;









}
