<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/css/refund.css?after" />'
<script src="/js/refund.js"></script>
    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_order_sub">환불 정보</div>
        <div class="Home_show_wrapper">
            <img src="../img/image.jpeg" alt="" class="Home_show_order_img">
            
                <div class="Home_show_order_info">
                    <div class="Home_show_date">2022년 5월 24일 23:30 결제</div> | 
                    <div class="Home_show_num"> 구매수량 : <span>1</span></div>
                    <div>신사 / 가로수길 칵테일 클래스</div>
                    <div>6월 1일 (일) 오후 2시 30분</div>
                </div>
            
        </div>

        <hr>
        <div class="Home_order_sub2">환불 정보</div>
        <div class="Home_order_check">
            <div>
                <div class="Home_order_check_sub">
                    상품 금액
                </div>
                <div class="Home_order_check_num">
                    35,000 <span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    할인 금액
                </div>
                <div class="Home_order_check_num">
                    <span></span>
                    <span>-</span>0<span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    환불 금액
                </div>
                <div class="Home_order_check_num">
                    35,000<span>원</span>
                </div>
            </div>

            <div>
                <div class="Home_order_check_sub">
                    환불 에너지
                </div>
                <div class="Home_order_check_num">
                    <span></span>
                    <span>-</span>0<span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    환불 수단
                </div>
                <div class="Home_order_check_num">
                  결제하신 카드
                </div>
            </div>
        </div>
        <hr>
        <div class="Home_refund_explain">
            * 환불시 우리가 마음대로 함 <br>
            * 알아서 되니까 기다려
        </div>
        <div class="Home_refund_btn">
          <div><button class="refund_btn" onclick="location.href='/mypage/refundfinish'">환불하기</button></div>
        </div>
    </div>

    <!-- 본문 끝-->
    <%@include file="../footer.jsp"%>