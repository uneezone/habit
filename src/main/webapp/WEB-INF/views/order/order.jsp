<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/css/order.css?after" />
<script src="/js/jquery.cookie.js"></script>
<script src="/js/order.js?after"></script>
<script src="/js/common.js?after"></script>

  <link rel="stylesheet" href="/css/reset.css?after">
  <link rel="stylesheet" href="/css/order.css?after">
  <script src="/js/order.js?after"></script>
  <link rel="stylesheet" href="/css/modal.css?after">

    <!-- 본문 시작 -->

    <div class="Home">
        <div>
            <div class="Home_order_sub">결제내역</div>
            <hr>
            <div>
                <!-- <div>
                    <div class="Home_btn">
                        <button class="Home_reserve_btn">예약 확정만 보기</button>
                    </div>
                    <div class="Home_btn">
                        <button class="Home_reserve_can">취소 내역 숨기기</button>
                    </div>
                </div> -->
                <!--버튼 끝-->

                <div>
                    <c:if test="${payList.size()!=0}">
                    <c:forEach items="${payList}" var="pay" varStatus="status">
                    <div class="Home_show_container_cancel show_list">
                        <div class="Home_show_date">${pay.pay_date} 결제</div> |
                        <div class="Home_show_num"> 구매콘텐츠 : <span>${pay.count}</span></div>
                        <div class="Home_show_detail"><a href="/mypage/orderdetail?payno=${pay.pay_no}">주문상세 보기 ></a></div>
                        <div class="Home_show_con con${status.index}">
                        </div>
                        <script>
                            let pay_no${status.index}="${pay.pay_no}"
                            $.ajax({
                                type:"GET"
                                ,url:"/mypage/order/detail"
                                ,data: {"pay_no":"${pay.pay_no}"}
                                ,async:false
                                ,success:function(data){
                                    console.log(data);
                                    $(data).each(function(){
                                        console.log(this.refn_status);
                                        let htmlAppend="";
                                        if(this.refn_status=="RO"){
                                            htmlAppend+="<div class='Home_show_wrapper'>";
                                            htmlAppend+="  <img src=/storage/"+this.cont_img+" alt='' class='Home_show_order_img'>";
                                            htmlAppend+="     <div class='Home_show_order_info'>";
                                            htmlAppend+="          <div class='order_info_big'>"+this.cont_name+"</div>";
                                            htmlAppend+="          <div class='order_info_name'>"+this.op_name+"</div>";
                                            htmlAppend+="          <span> / 구매수량 : "+this.payd_qty+"</span>";
                                            htmlAppend+="     </div>";
                                            htmlAppend+="  <div class='Home_change_con'>";
                                            htmlAppend+="    <div>";
                                            htmlAppend+="        <button class='Home_change_btn' onclick=location.href='/mypage/refund?paydNo="+this.payd_no+"'>환불하기</button>";
                                            htmlAppend+="    </div>";
                                            htmlAppend+="    <div>";
                                            htmlAppend+="        <button class='Home_change_btn_refund' disabled>리뷰쓰기</button>";
                                            htmlAppend+="    </div>";
                                            htmlAppend+="  </div>";
                                            htmlAppend+="</div>";
                                            $(".con${status.index}").append(htmlAppend);

                                        }else if(this.refn_status=="NRO"){
                                            htmlAppend+="<div class='Home_show_wrapper'>";
                                            htmlAppend+="  <img src=/storage/"+this.cont_img+" alt='' class='Home_show_order_img'>";
                                            htmlAppend+="     <div class='Home_show_order_info'>";
                                            htmlAppend+="          <div class='order_info_big'>"+this.cont_name+"</div>";
                                            htmlAppend+="          <div class='order_info_name'>"+this.op_name+"</div>";
                                            htmlAppend+="          <span> / 구매수량 : "+this.payd_qty+"</span>";
                                            htmlAppend+="     </div>";
                                            htmlAppend+="  <div class='Home_change_con'>";
                                            htmlAppend+="    <div>";
                                            htmlAppend+="        <button class='Home_change_btn_refund' disabled>환불하기</button>";
                                            htmlAppend+="    </div>";
                                            htmlAppend+="    <div>";
                                            htmlAppend+="        <button class='Home_change_btn' onclick=location.href='/mypage/review?paydNo="+this.payd_no+"&proNo="+this.pro_no+"'>리뷰쓰기</button>";
                                            htmlAppend+="    </div>";
                                            htmlAppend+="  </div>";
                                            htmlAppend+="</div>";

                                            $(".con${status.index}").append(htmlAppend);
                                        }else{
                                            htmlAppend+="<div class='Home_show_wrapper'>";
                                            htmlAppend+="  <img src=/storage/"+this.cont_img+" alt='' class='Home_show_order_img'>";
                                            htmlAppend+="  <span class='Home_refund'><span>환불완료</span></span>";
                                            htmlAppend+="     <div class='Home_show_order_info'>";
                                            htmlAppend+="          <div class='order_info_big'>"+this.cont_name+"</div>";
                                            htmlAppend+="          <div class='order_info_name'>"+this.op_name+"</div>";
                                            htmlAppend+="          <span> / 구매수량 : "+this.payd_qty+"</span>";
                                            htmlAppend+="     </div>";
                                            htmlAppend+="  <div class='Home_change_con'>";
                                            htmlAppend+="    <div>";
                                            htmlAppend+="        <button class='Home_change_btn_refund' disabled>환불하기</button>";
                                            htmlAppend+="    </div>";
                                            htmlAppend+="    <div>";
                                            htmlAppend+="        <button class='Home_change_btn_refund' disabled>리뷰쓰기</button>";
                                            htmlAppend+="    </div>";
                                            htmlAppend+="  </div>";
                                            htmlAppend+="</div>";

                                            $(".con${status.index}").append(htmlAppend);
                                        }

                                    });
                                }
                            })
                        </script>
                        <hr class="Home_divhr">
                    </div>
                    </c:forEach>
                    </c:if>
                    <c:if test="${payList.size()==0}">
                        결제내역 없음
                    </c:if>
                <div class="Home_show_con_btn">
                    <button class="Home_show_more show_btn">더보기</button>
                </div>
            </div>
        </div>
    </div>
    </div>
    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>