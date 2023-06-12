
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/refundfinish.css?after" />'
<script src="js/refundfinish.js"></script>
<!-- 본문 시작 -->
    <!-- 본문 시작 -->

    <div class="Home">
       
            <h1  class="Home_sub">
              환불완료
            </h1>
            <hr style="border-width: 2px" />
            <div>
              <img src="../img/check.png" class="paydone_img" />
              <p class="Home_refund_ment">
                환불이 정상적으로 완료되었습니다.
              </p>
            </div>
      
            <div style="position: relative; display: inline-block;">
              <img src="../img/eggtart.jpg" class="refund_pro_img" />
              <div class="Home_sub2">
                <div><span>상품 이름 : </span>신사 / 가로수길 칵테일 클래스 <br></div>
                <div><span>날짜 : </span>6월 1일 (일) 오후 2시 30분 </div>
                <div><span>명수/횟수 : </span>1명</div>
              </div>
         
            </div>
            <hr style="border: 1px solid rgb(203, 203, 203)" />
            <div class="show_result_wrapper">
                <p  class="show_result">환불 에너지 : <span>0</span> 원</p> 
                <p  class="show_result">환불 금액 : <span>0</span> 원</p>
            </div>
            <div class="payed_btn_con">
              <div class="payed_btn_wrapper">
                <input type="button" value="홈으로" id="continue_shop_btn" onclick="location.href='intro.html'" />
              </div>
            </div>
          
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>