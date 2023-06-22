package com.habit.Mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class MailService {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendMail(){
        //수신 대상을 담을 어레이리스트
        ArrayList<String> toUserList=new ArrayList<>();

        //수신대상추가
        toUserList.add("");

        //수신 대상 개수
        int toUserSize = toUserList.size();


        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

        //수신자 설정
        simpleMailMessage.setTo((String[]) toUserList.toArray(new String[toUserSize]));

        //메일 제목
        simpleMailMessage.setSubject("제목");

        //메일 내용
        simpleMailMessage.setText("내용");

        //메일 발송
        javaMailSender.send(simpleMailMessage);
    }
}
