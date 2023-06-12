<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/orderdetail.css?after" />
<script src="js/jquery.cookie.js"></script>
<script src="js/orderdetail.js?after"></script>
<script src="js/common.js?after"></script>

    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_order_sub">상세 정보</div>
        <div class="Home_show_container">
            <div class="Home_show_date">2022년 5월 24일 23:30 결제</div> | 
            <div class="Home_show_num"> 구매수량 : <span>1</span></div>
            <div class="Home_show_wrapper">
                <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                <a href="orderdetail.html">
                    <div class="Home_show_order_info">
                        <div>신사 / 가로수길 칵테일 클래스</div>
                        <div>6월 1일 (일) 오후 2시 30분 1명</div>
                        <div>10,000 <span>원</span></div>
                    </div>
                    
                </a>
            </div>
            <div class="Home_show_wrapper">
                <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                <span class="Home_refund"><span>환불완료</span></span>
                <a href="orderdetail.html">
                    
                    <div class="Home_show_order_info">
                        <div>신사 / 가로수길 칵테일 클래스</div>
                        <div>6월 1일 (일) 오후 2시 30분 1명</div>
                        <div>10,000 <span>원</span></div>
                    </div>
                
                </a>
            </div>
            <hr>
        </div>
        <div class="Home_order_sub2">결제 정보</div>
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
                    35,000 <span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    결제 금액
                </div>
                <div class="Home_order_check_num">
                    35,000<span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    결제 수단
                </div>
                <div class="Home_order_check_num">
                    카드결제
                </div>
            </div>
        </div>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>