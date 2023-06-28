package com.habit.cart;

import com.habit.energy.EnergyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;




@Controller
public class PayCont {

    public PayCont(){
        System.out.println("----PayCont() 객체 생성됨");
    }

    @Autowired
    PayDAO payDAO;

    @Autowired
    CartDAO cartDAO;

    @Autowired
    EnergyDAO energyDAO;

    @RequestMapping("/order/payDone")
    public ModelAndView orderInsert(@ModelAttribute PayDTO payDTO, HttpSession session, HttpServletRequest req){


        PaydDTO paydDTO=new PaydDTO();
        ModelAndView mav=new ModelAndView();

        SimpleDateFormat sd=new SimpleDateFormat("yyyyMMddHHmmss");
        String date=sd.format(new Date());
        System.out.println(date);

        String pay_no=payDAO.pay_no(date);
        if(pay_no.equals("1")){
            pay_no='P'+date+"1";
        }else{
            int n=Integer.parseInt(pay_no.substring(14))+1;
            pay_no='P'+date+n;
        }

        System.out.println(pay_no);

        String user_id="user-3";

        payDTO.setPay_no(pay_no); // 주문서번호
        payDTO.setUser_id(user_id); // 유저아이디

        paydDTO.setPay_no(pay_no);
        paydDTO.setUser_id(user_id);

        //////////////////////////

        String payby=req.getParameter("payby");
        String cp_item=req.getParameter("cp_item");

        int useEnergy=Integer.parseInt(req.getParameter("useEnergy"));
        System.out.println(useEnergy);

        payDTO.setPay_method(payby); // 결제수단
        payDTO.setPay_point(useEnergy); // 사용에너지


        int num=Integer.parseInt(req.getParameter("num"));


        HashMap<String, Object> map4=new HashMap<>(); // 결제한 상품을 장바구니에서 삭제하기 위해 필요한 정보 담을 map 만든다.

        List<Integer> cl_nos=new ArrayList<>();
        int sumPerPurchase=0;
        for(int i=0; i<num; i++){

            int cl_noi=Integer.parseInt(req.getParameter("cl_no"+i));
            System.out.println(cl_noi);
            paydDTO.setPro_no(cartDAO.getProno(cl_noi)); // 상품코드
            cl_nos.add(cl_noi);
            System.out.println("map4에 담은 내용 : "+cl_noi);

            int cl_qty=Integer.parseInt(req.getParameter("cl_qty"+i));
            System.out.println("주문수량 : "+cl_qty);
            paydDTO.setPayd_qty(cl_qty);// 주문수량

            int pricei=Integer.parseInt(req.getParameter("price"+i));
            System.out.println("상품별 가격 : "+pricei);
            paydDTO.setPayd_price(pricei); // 할인전금액(상품 1개 가격)

            //payDTO.setPay_total(pricei*cl_qty);
            sumPerPurchase+=pricei*cl_qty;
            //System.out.println("가격 x 수량 : "+pricei*cl_qty);
            System.out.println("오류 잡기 : "+cartDAO.getProno(cl_noi));
            paydDTO.setPro_no(cartDAO.getProno(cl_noi));
            paydDTO.setPay_no(pay_no);

            System.out.println("주문상세 삽입 테스트 : "+payDAO.paydInsert(paydDTO));
        }
        System.out.println("한번 결제당 총 결제금액의 합 : "+sumPerPurchase);
        payDTO.setPay_total(sumPerPurchase);
        System.out.println("pay_no="+payDTO.getPay_no());
        System.out.println(payDAO.payInsert(payDTO));



        map4.put("cl_nos",cl_nos);
        map4.put("user_id", user_id);

        int result= payDAO.paydInsert(paydDTO);
        if(result!=0){
            payDAO.cartDelete(map4);
        }



        //사용에너지 차감
        Map<String, Object> map3=new HashMap<>();
        map3.put("user_id", user_id);
        map3.put("energyUse", -useEnergy);
        energyDAO.insertUseEnergy(map3);


        // 등급에 따라 실제 결제한 금액에 대한 에너지적립액 계산
        int energy_saveuse=0;
        Map<String, Object> realPay = energyDAO.getRealPay(pay_no);
        if(realPay.get("user_level")=="S"){
            energy_saveuse= (int)(Integer.parseInt((String)realPay.get("realPay"))*0.05);
        }else if(realPay.get("user_level")=="A"){
            energy_saveuse=(int)(Integer.parseInt((String)realPay.get("realPay"))*0.03);
        }else{
            energy_saveuse=(int)(Integer.parseInt(String.valueOf(realPay.get("realPay")))*0.01);
        }

        //실결제금액 에너지 적립
        Map<String, Object> map2=new HashMap<>();
        map2.put("user_id", user_id);
        map2.put("energy_saveuse", energy_saveuse);
        energyDAO.insertEnergy(map2);


        
        //누적금액 조회해서 회원 등급 조정
        int accumulatedPurchasePrice= energyDAO.getAccumulatedPurchasePrice(user_id);
        System.out.println(accumulatedPurchasePrice);

        if(accumulatedPurchasePrice>=1000000){
            energyDAO.updateUserLeveltoS(user_id);
        }else if(accumulatedPurchasePrice>=300000){
            energyDAO.updateUserLeveltoA(user_id);
        }


        //원데이클래스 상품 상품상태 조회 -> 품절이면 상품상태코드 변환
        int notConsiderRefn1=payDAO.getOneStock(paydDTO.getPro_no()); // 원데이클래스 총 수량-판매수량
        int refnStock1= payDAO.getOneRefn(paydDTO.getPro_no());//원데이클래스 환불수량
        int finalRemnant1=notConsiderRefn1+refnStock1;//원데이클래스 총 수량-판매수량+환불수량 (=현재재고갯수)
        if(finalRemnant1<=0){
            payDAO.updateOneStatus(paydDTO.getPro_no());
        }

        //회차권인원권 상품 상품상태 조회 -> 품절이면 상품상태코드 변환
        int notConsiderRefn2= payDAO.getProdStock(paydDTO.getPro_no());
        int refnStock2= payDAO.getProdRefn(paydDTO.getPro_no());
        int finalRemnant2=notConsiderRefn2+refnStock2;
        if(finalRemnant2<=0){
            payDAO.updateProdStatus(paydDTO.getPro_no());
        }

        System.out.println(energyDAO.getUserGrade(user_id));


        List<Map<String, Object>> payDoneInfos=payDAO.getInfoForPayDonePage(pay_no);
        mav.addObject("payDoneInfos", payDoneInfos);
        mav.setViewName("order/payDone");
        mav.addObject("payedPrice", sumPerPurchase-useEnergy);


        return mav;

    }




}
