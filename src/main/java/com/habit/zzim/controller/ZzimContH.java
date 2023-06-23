package com.habit.zzim.controller;

import com.habit.zzim.DTO.ZzimDTO;
import com.habit.zzim.service.ZzimService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zzim")
@Slf4j
@RequiredArgsConstructor
public class ZzimContH {

    private final ZzimService zzimService;

    //private String user_id="user-3";

    @GetMapping("/list")
    public String showZzimList(@SessionAttribute(name = "s_id",required = false)String user_id, Model model){
        List<ZzimDTO> zzimList = zzimService.getZzimList(user_id);

        model.addAttribute("zzimList",zzimList);
        return "member/zzim";
    }

    @PostMapping("/insert")
    @ResponseBody
    public String zzimInsert(@SessionAttribute(name = "s_id",required = false)String user_id,@RequestParam(value = "cont_no") int cont_no){

        Map<String,Object > zzimInsertInfo= new HashMap<>();
        zzimInsertInfo.put("user_id",user_id);
        zzimInsertInfo.put("cont_no",cont_no);

        String status = zzimService.zzimInsert(zzimInsertInfo);
        //log.info("cont_no={}",cont_no);

        return status;

    }

    @PostMapping("/del")
    @ResponseBody
    public String zzimDel(@SessionAttribute(name = "s_id",required = false)String user_id,@RequestParam(value = "cont_no") int cont_no){
        Map<String,Object > zzimInsertInfo= new HashMap<>();
        zzimInsertInfo.put("user_id",user_id);
        zzimInsertInfo.put("cont_no",cont_no);

        String status = zzimService.zzimDel(zzimInsertInfo);

        return status;
    }

    @GetMapping("/getZzim")
    @ResponseBody
    public List<Integer> zzimGet(@RequestParam(name = "userId")String user_id){
        log.info("user-id={}",user_id);
        List<Integer> cont_nos = zzimService.zzimGet(user_id);

        return cont_nos;
    }

}
