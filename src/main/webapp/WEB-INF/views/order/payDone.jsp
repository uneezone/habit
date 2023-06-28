<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/css/payDone.css" />
<script src="/js/payDone.js"></script>

<!--헤더끝-->
    <!-- 본문 시작 -->
    <div class="Home">
      <h1 style="font-size: 20px; font-weight: bold; margin-top: 20px">
        결제완료
      </h1>
      <hr style="border-width: 4px" />
      <div class="show_payed_finish">
        <img src="/storage/check.png" id="paydone_img" />
        <p style="font-size: 21px; text-align: center; font-weight: bold; margin-bottom: 10px;">
          구매가 정상적으로 완료되었습니다.
        </p>
      </div>
      <hr>

      <c:forEach var="item" items="${payDoneInfos}">
      <div style="position: relative; display:block">
        <img src="/storage/${item.cont_img}" id="orderlist_img1" />
        <div class="show_proinfo">
          <div  class="Home_sub">
            ${item.cont_name}

          </div>         
          <div class="show_price_wrapper">
            <p id="payed_price">가격 : ${item.price}원</p>
            <p id="payed_price">주문수량 : ${item.payd_qty}</p>
          </div>
        </div>
        <hr style="border: 0.5px solid rgb(211, 211, 211)">
      </div>
    </c:forEach>
      <p style="text-align: center; font-size: 22px; font-weight: bold;">총 결제금액(에너지 사용) : <span>${requestScope.payedPrice}</span></p>
      <div class="payed_btn_con">
        <div class="payed_btn_wrapper">
          <input type="button" value="쇼핑계속하기" id="continue_shop_btn" onclick="location.href='/intro.jsp'"/>
        </div>
      </div>
    </div>
    <!--footer 시작-->

<%@include file="../footer.jsp"%>