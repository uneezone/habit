<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/css/orderdetail.css?after" />
<script src="/js/jquery.cookie.js"></script>
<script src="/js/orderdetail.js?after"></script>
<script src="/js/common.js?after"></script>

    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_order_sub">상세 정보</div>
        <div class="Home_show_container">
            <div class="Home_show_date">${bigOrder.get("pay_date")} 결제</div> |
            <div class="Home_show_num"> 구매컨텐츠 : <span>${bigOrder.get("count")}</span></div>
            <c:forEach items="${smallOrder}" var="order" varStatus="status">
            <div class="Home_show_wrapper">
                <img src="/storage/${order.cont_img}" alt="" class="Home_show_order_img">
                <c:if test="${order.refn_status=='CFRO'|| order.refn_status=='HFRO'}">
                    <span class="Home_refund"><span>환불완료</span></span>
                    <input type="hidden" value="${order.refn_point}">
                </c:if>

                    <div class="Home_show_order_info">
                        <div>${order.cont_name}</div>
                        <div>${order.op_name} /<span> 구매수량 : <span class="qty${status.index}">${order.payd_qty}</span></span></div>
                        <div><span class="price${status.index}">{order.payd_price}</span><span> 원</span></div>
                    </div>
                    

            </div>
            </c:forEach>
            <hr>
        </div>
        <div class="Home_order_sub2">결제 정보</div>
        <div class="Home_order_check">
            <div>
                <div class="Home_order_check_sub">
                    총 상품금액
                </div>
                <div class="Home_order_check_num">
                    <span class="allprice">35,000</span> <span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    에너지 사용 금액
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
                    <span>35,000</span><span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    결제 금액
                </div>
                <div class="Home_order_check_num">
                    <span>35,000</span><span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    결제 수단
                </div>
                <div class="Home_order_check_num">
                    <c:if test="${bigOrder.get('pay_method')=='C'}">
                        카드결제
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>