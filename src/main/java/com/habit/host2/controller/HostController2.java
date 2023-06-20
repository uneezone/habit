package com.habit.host2.controller;

import com.habit.host2.entity.*;
import com.habit.host2.service.HostServiceImpl2;
import com.sun.jdi.LongType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequestMapping("/host")
@Slf4j
@RequiredArgsConstructor
@Controller
public class HostController2 {


    private final HostServiceImpl2 hostService;




    //호스트 홈으로
    @GetMapping("")
    public String showHostPage(@SessionAttribute(name = "userId",required = false)String userIds, Model model){

        String userId="user-5";
        //host인지 확인
        String userGrade = hostService.checkHost(userId);
        if(userGrade.equals("H")){
            //home관련 정보들 가져오기(누적금액, 이번달금액, 전체건수, 취소건수, 전레리뷰거스,별점)
            HostHomeDTO hostHomeDTO = hostService.gethostHomeInfo(userId);
            model.addAttribute("HomeInfo",hostHomeDTO);
            model.addAttribute("hostId",userId);
            return "host/host_home";
        }

        return "host/host_newhost";
    }

    //호스트 가입
    @PostMapping("newHost")
    public String joinHost(@ModelAttribute NewHostDTO dto
                            , @SessionAttribute(name = "userId",required = false)String userIds, Model model
                            , @RequestParam MultipartFile Img
                            , HttpServletRequest req){


        //로그인세션 확인
        /*if(userId==null){
            return "member/login";
        }*/

        //임시
        String userId="user-2";

        //임시 host인지 확인
        String userGrade = hostService.checkHost(userId);
        System.out.println("userGrade = " + userGrade);
        if(userGrade.equals("H")){
            model.addAttribute("hostId",userId);
            return "host/host_home";
        }

        //전환번호
        String phoneNumber="";
        System.out.println(dto.getHostPhone1()+"/"+dto.getHostPhone2());
        if(dto.getHostPhone1()==null||dto.getHostPhone1().isEmpty()){
            phoneNumber = hostService.getPhoneNumber(userId);
            log.info("phoneNum={}",phoneNumber);
        }else{
            phoneNumber=dto.getHostPhone1()+"-"+dto.getHostPhone2()+"-"+dto.getHostPhone3();
        }
        dto.setHostPhone1(phoneNumber);

        //이메일
        String email=dto.getHostEmail1()+"@"+dto.getHostEmail2();
        dto.setHostEmail1(email);

        //프로필이미지 default
        if(Img == null || Img.isEmpty()){
            dto.setHostImg("defaulthostPro.png");
        }else{
            String filename=Img.getOriginalFilename();
            dto.setHostImg(filename);
            long filesize=Img.getSize();
            try {
                ServletContext application=req.getSession().getServletContext();
                String path=application.getRealPath("/storage");  //실제 물리적인 경로
                Img.transferTo(new File(path + "\\" + filename)); //파일저장

            }catch (Exception e) {
                e.printStackTrace(); //System.out.println(e);
            }
        }

        //host 아이디
        dto.setHostId(userId);

        log.info("newHostDTO={}",dto);
        hostService.newHostPro(dto,userId);
        model.addAttribute("hostId",dto.getHostId());

        return "host/host_home";
    }

    //============호스트 로그아우
    @GetMapping("/logout")
    public String hostLogout(@SessionAttribute(name = "userId",required = false)String userIds, HttpSession session){

        //임시
        String host_id="user-2";

        session.removeAttribute("userId");
        return "redirect:/";
    }

    //===============프로필/정산정보 관리
    @GetMapping("/info")                             //나중에 true로 바꿔야함
    public String info(@SessionAttribute(name = "userId",required = false)String userIds, Model model){

        //임시
        String userId="user-2";

        //호스트 정보 가져오기
        HostInfoDTO hostInfoDTO = hostService.getHostInfo(userId);
        log.info("hostInfo={}",hostInfoDTO);
        model.addAttribute("hostInfo",hostInfoDTO);

        return "host/host_information";
    }

    @PostMapping("/info")                                                       //나중에 true로 바꿔야함
    public String modifyInfo(@SessionAttribute(name = "userId",required = false)String userIds,@RequestParam MultipartFile Img, @ModelAttribute HostEditDTO dto,HttpServletRequest req){
        if(!(Img == null || Img.isEmpty())){

            String filename=Img.getOriginalFilename();
            log.info("filename={}",filename);
            long filesize=Img.getSize();
            dto.setHost_img(filename);

            try {
                ServletContext application=req.getSession().getServletContext();
                String path=application.getRealPath("/storage");  //실제 물리적인 경로
                Img.transferTo(new File(path + "\\" + filename)); //파일저장

            }catch (Exception e) {
                e.printStackTrace(); //System.out.println(e);
            }
        }

        //이메일 합치기
        String email= dto.getHost_email1()+"@"+dto.getHost_email2();
        dto.setHost_email1(email);

        //전화번호 합치기
        String phone=dto.getHost_phone1()+"-"+dto.getHost_phone2()+"-"+dto.getHost_phone3();
        dto.setHost_phone1(phone);


        //임시 Id
        String userId="user-2";
        dto.setHost_id(userId);

        //db에 수정사항 저장
        hostService.editHostInfo(dto);
        log.info("hostEdit={}",dto);
        return "redirect:/host/info";
    }



    //=======================판매관리 시작======================

    @GetMapping("/product")
    public String showProduct(@SessionAttribute(name = "userId",required = false) String userIds
                            , Model model
                            , @ModelAttribute SearchProDTO searchdto
                            , @RequestParam(value = "paging", defaultValue = "1") Long paging){
        //임시 Id
        String userId="user-2";
        searchdto.setHost_id(userId);

        //아이디 공백체크
        if(searchdto.getUser_id()!=null) {
            searchdto.setUser_id(searchdto.getUser_id().trim());
        }

        //=========등록한 해빗 상품명과 옵션들
        List<Map<String, Object>> productNames = hostService.getProductNames(userId);
        log.info("proname={}",productNames.stream().toList());


        //=========페이징
        //등록한 상품 전체갯수
        int productsLength = hostService.getProductsLength(searchdto);
        searchdto.setAllProductsLength((long) productsLength);
        //보여질 상품들수(행수)
        Long showProductsLength=5L;
        //pagin index 갯수
        int pagingIndex= (int) (Math.ceil(productsLength/(double)showProductsLength));
        searchdto.setPagingIndex(pagingIndex);


        //sql문 limit 값
        Long startPaging=showProductsLength*(paging-1);
        searchdto.setStartPaging(startPaging);
        searchdto.setShowLength(showProductsLength);

        log.info("SearchDTO={}", searchdto);

        //============판매및 환불 상품 가져오기(필터링)
        List<ProductDTO> products = hostService.getProduct(searchdto);
        log.info("products={}",products);
        log.info("products Length={}",products.size());


        model.addAttribute("searchFilter",searchdto);
        model.addAttribute("products",products);
        model.addAttribute("productNames",productNames);
        return "host/habit_product_control";
    }

    //예약
    @GetMapping("/reserve")
    public String showReserve(@SessionAttribute(name = "userId",required = false)String userIds){
        //임시 Id
        String userId="user-3";
        return "host/habit_reservation_control";
    }

    //판매관리에서 상태 변경 ajax
    @PostMapping("/status")
    @ResponseBody
    public String changeStatus(@RequestParam(value = "payd_no") Long payd_no, @RequestParam(value = "status")String status){
        log.info("payd_no={}",payd_no);
        log.info("status={}",status);

        if(status.equals("Y")){
            //주문상세테이블 변경
            hostService.updatePaydStatus(payd_no,status);
            return "ROK";  //사용완료
            
        }else if(status.equals("C")){
            //주문상세테이블 변경
            hostService.updatePaydStatus(payd_no,status);

            //환불테이블 insert
            //주문서번호 기준으로 RO 혹은 NRO 있으면 에너지 환불 X

            //주문상세번호로 주문서번호 알아오기
            String payNo = hostService.getPayNo(payd_no);
            log.info("주문서번호={}",payNo);
            //주문서번호 기준으로 RO혹은 NRO가 있는지 확인
            Long refnCount = hostService.getRefnCount(payNo);

            //주문서번호로 결제수단 가져오기(해당 결제수단으로 환불해주기 위해서)
            String payMethod = hostService.getPayMethod(payNo);
            log.info("결제수단={}",payMethod);

            //환불에너지 선언
            Integer refundPoint=0;
            
            if(refnCount>=1){
                //에너지 환붍 X
                //주문상세번호 해당 제품의 금액과 수량,상품코드,유저아이디
                Map<String, Object> info = hostService.getInfoByPaydNo(payd_no);
                log.info("info={}",info.toString());

                //환불금액 계산
                int refundPrice=(Integer)info.get("payd_qty")*(Integer)info.get("payd_price");

                //환불테이블에 insert할 값들 모으기
                Map<String, Object> params = new HashMap<>();
                params.put("payd_no",payd_no);
                params.put("user_id",info.get("user_id"));
                params.put("pro_no",info.get("pro_no"));
                params.put("pay_qty",info.get("payd_qty"));
                params.put("refund_price",refundPrice);
                params.put("pay_method",payMethod);
                params.put("refn_point",refundPoint);

                //환불테이블에 insert 하기
                hostService.insertRefund(params);
                log.info("환불테이블 insert 성공1");

            }else{
                //에너지 환불 O
                //주문상세번호 해당 제품의 금액과 수량,상품코드,유저아이디
                Map<String, Object> info = hostService.getInfoByPaydNo(payd_no);
                log.info("info={}",info.toString());

                //환불금액 계산
                int refundPrice=(Integer)info.get("payd_qty")*(Integer)info.get("payd_price");

                //환불에너지 가져오기
                log.info("주문서번호={}",payNo);
                refundPoint = hostService.getRefundPoint(payNo);
                log.info("환불에너지={}",refundPoint);

                if(refundPoint==null) {
                    //에너지 로그안안남김
                    //환불테이블에 insert할 값들 모으기

                    refundPoint=0;

                    Map<String, Object> params = new HashMap<>();
                    params.put("payd_no",payd_no);
                    params.put("user_id",info.get("user_id"));
                    params.put("pro_no",info.get("pro_no"));
                    params.put("pay_qty",info.get("payd_qty"));
                    params.put("refund_price",refundPrice);
                    params.put("pay_method",payMethod);
                    params.put("refn_point",refundPoint);

                    //환불테이블에 insert 하기
                    hostService.insertRefund(params);
                    log.info("환불테이블 insert 성공2");

                }else{
                    //에너지 로그남기기
                    //환불테이블에 insert할 값들 모으기
                    Map<String, Object> params = new HashMap<>();
                    params.put("payd_no",payd_no);
                    params.put("user_id",info.get("user_id"));
                    params.put("pro_no",info.get("pro_no"));
                    params.put("pay_qty",info.get("payd_qty"));
                    params.put("refund_price",refundPrice);
                    params.put("pay_method",payMethod);
                    params.put("refn_point",refundPoint);

                    //환불테이블에 insert 하기
                    hostService.insertRefund(params);
                    log.info("환불테이블 insert 성공3");

                    //에너지테이블에 환불에너지 남기기
                    Map<String, Object> energyParams= new HashMap<>();
                    energyParams.put("user_id",info.get("user_id"));
                    energyParams.put("energy_saveuse",refundPoint);
                    energyParams.put("energy_sources","[결제]호스트취소");

                    hostService.insertEnergy(energyParams);
                }
            }
            
            return "COK"; //취소완료
        }
        return "COK"; //취소완료
    }

    //상품에 대한 옵션 ajax 가져오기
    @GetMapping("/option")
    @ResponseBody
    public List<Map<String, Object>> showOptions(@RequestParam("cont_no") Long cont_no){
        //log.info("컨텐츠 옵션={}",cont_no);
        List<Map<String, Object>> productOptions = hostService.getProductOptions(Long.valueOf(cont_no));
        //log.info("옵션들={}",productOptions.stream().toList());

        return productOptions;
    }

    //회원에대한 정보 가져오기
    @GetMapping("/userInfo")
    @ResponseBody
    public Map<String, Object> showUserInfo(@RequestParam("user_id") String user_id){
        Map<String, Object> params = hostService.showUserInfo(user_id);
        return params;
    }

    //================정산서 view페이지
    @GetMapping("/adjust")
    public String showAdjust(@SessionAttribute(name = "userId",required = false)String userIds
                                ,Model model
                                ,@ModelAttribute SearchAdjustDTO dto
                                ,@RequestParam(value = "paging", defaultValue = "1") int paging){
        //임시
        String userid="user-2";
        dto.setHost_id(userid);

        //정산계좌 입력했는지 확인
        int check = hostService.checkWriteAccount(userid);
        

        if(check==0){
            return "redirect:/host/info";
        }

        //정산해라
        calcMethod(userid);

        //=====날짜 포맷 변경
        if(dto.getStart_date()!=null) {
            dto.setStart_date(dto.getStart_date().replace("-", "."));
            dto.setEnd_date(dto.getEnd_date().replace("-", "."));
        }
        log.info("search={}",dto);

        //====페이징
        Map<String ,Object> pagingMap= new HashMap<>();

        //보여줄 상품수
        int showAdjust=2;
        //sql문 limit 값
        int startPaging=showAdjust*(paging-1);
        //전체행갯수
        Integer adjustListLength = hostService.getAdjustListLength(dto);
        int index=(int)Math.ceil(adjustListLength/(double)showAdjust);
        log.info("index={}",index);
        pagingMap.put("listLength",adjustListLength);
        pagingMap.put("index",index);

        dto.setStartPaging(startPaging);
        dto.setShowLength(showAdjust);



        //======정산서 리스트가져오기
        List<AdjustInfoDTO> adjustList = hostService.getAdjustList(dto);
        log.info("adjustlist={}",adjustList);



        model.addAttribute("pagingMap",pagingMap);
        model.addAttribute("adjustList",adjustList);
        model.addAttribute("searchAdjust",dto);
        return "host/adjustment_control";
    }

    //정산서 디테일 ajax
    @GetMapping("/adjustDetail")
    @ResponseBody
    public List<Map<String,Object>> showAdjustDetail(@SessionAttribute(name = "userId",required = false)String userIds
                                    ,@RequestParam(value = "calc_no") String calc_no){
        //임시
        String user_id="user-3";
        List<Map<String, Object>> adjustDetail = hostService.getAdjustDetail(calc_no);

        //호스트계좌
        Map<String, Object> hostAccount = hostService.getCalcAccount(calc_no);
        log.info("호스트 계좌={}",hostAccount);

        for (Map<String, Object> stringObjectMap : adjustDetail) {
            //System.out.println("상품코드 "+stringObjectMap.get("pro_no"));
            Map<String,Object> params= new HashMap<>();
            String pro_no = (String)stringObjectMap.get("pro_no");
            String optionName="";
            if(pro_no.startsWith("p")){
                params.put("table","prod");
                params.put("pro_no",pro_no);
                optionName = hostService.getOptionName(params);
            }else{
                params.put("table","one");
                params.put("pro_no",pro_no);
                optionName = hostService.getOptionName(params);
            }

            stringObjectMap.put("name",optionName);

        }
        adjustDetail.add(hostAccount);

        return adjustDetail;
    }

    private void calcMethod(String host_id){

        List<Integer> contNos = hostService.updateForDonePro(host_id);
        Long result=0L;

        //정산해야할 것이 있다면 정산테이블 및 정산상셑테이블  insert 시작
        if(contNos.size()!=0) {
            result = hostService.adjustFee(contNos, host_id);

        }

    }

    @PostMapping("/adjustGive")
    @ResponseBody
    public String adjustGive(@SessionAttribute(name = "userId",required = false)String userIds,@RequestParam(value = "calc_no")String calc_no){
        //임시
        String host_id="user-3";

        String status = hostService.checkAccount(host_id, calc_no);

        return status;
    }


}
