package com.habit;

import com.habit.product.ProductDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @Autowired
    private ProductDAO productDAO;


    @GetMapping("/")
    public String intro(Model model){

        List<Map<String, Object>> introViewTopList = productDAO.introViewTop();
        for (Map<String, Object> cont : introViewTopList) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }

        List<Map<String, Object>> introReviewTopList = productDAO.introReviewTop();
        for (Map<String, Object> cont : introReviewTopList) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }

        List<Map<String, Object>> introDateTopList = productDAO.introDateTop();
        for (Map<String, Object> cont : introDateTopList) {
            String cont_img = (String) cont.get("cont_img");
            cont_img = cont_img.trim().split("\\|")[0];
            cont.put("cont_img", cont_img);
        }

        addStarAndPriceInfo(introViewTopList);
        addStarAndPriceInfo(introReviewTopList);
        addStarAndPriceInfo(introDateTopList);

        model.addAttribute("introViewTopList", introViewTopList);
        model.addAttribute("introReviewTopList", introReviewTopList);
        model.addAttribute("introDateTopList", introDateTopList);

        return "intro";
    }

    private void addStarAndPriceInfo(List<Map<String, Object>> productList) {
        for (Map<String, Object> product : productList) {
            int cont_no = (int) product.get("cont_no");
            Map<String, Object> starInfo = productDAO.star(cont_no);
            Map<String, Object> priceInfo = productDAO.price(cont_no);

            product.put("starInfo", starInfo);
            product.put("priceInfo", priceInfo);
        }
    }


    @GetMapping("/order/pay")
    public String show1(){
        return "/order/payPage";
    }

    @GetMapping("/order/payDone")
    public String show2(){
        return "/order/payDone";
    }

}
