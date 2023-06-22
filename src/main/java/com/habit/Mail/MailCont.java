package com.habit.Mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailCont {

    @Autowired
    MailService mailService;


    @RequestMapping("test")
    public void test(){
        mailService.sendMail();
    }
}
