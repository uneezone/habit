package com.habit.energy;

import com.habit.member.MemberDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class EnergyCont {

    public EnergyCont(){
        System.out.println("----EnergyCont() 객체 생성됨");
    }

    @Autowired
    EnergyDAO energyDAO;



    public void updateUserLevel(HttpSession session, String user_id){
        user_id="user-3";
        int accumulatedPurchasePrice= energyDAO.getAccumulatedPurchasePrice(user_id);
        System.out.println(accumulatedPurchasePrice);
    }

}
