<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <input type="hidden" value="">
                </c:if>

                    <div class="Home_show_order_info">
                        <div id="cont${order.payd_no}" class="contnames">${order.cont_name}</div>
                        <div>${order.op_name} /<span> 구매수량 : <span class="qty" id="qty${status.index}">${order.payd_qty}</span></span></div>
                        <div><span class="price" id="price${status.index}">${order.payd_price}</span><span> 원</span></div>
                    </div>
                    

            </div>
            </c:forEach>
            <hr style="border: 0.05px solid #dedede">
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
                    <span>-</span>
                    <span class="point"><fmt:formatNumber value="${bigOrder.get('pay_point')}" pattern="#,###"/></span>
                    <span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    결제 금액
                </div>
                <div class="Home_order_check_num">
                    <span class="realPrice">35,000</span><span>원</span>
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
        <c:if test="${refn.size()!=0}">
        <hr style="border: 0.2px solid #f2f2f2">
        <div class="Home_order_sub2">환불 정보</div>
        <c:forEach items="${refn}" var="refn" varStatus="status">
        <div class="Home_order_check">
            <div>
                <div class="Home_order_check_sub">
                    환불상품
                </div>
                <div class="Home_order_check_num">
                    <span class="contname" id="refn${refn.payd_no}"></span> /
                     <span class="opname" style="float:right;">&nbsp;${refn.refnop_name}</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    실환불액
                </div>
                <div class="Home_order_check_num">
                    <span class="refnprice"><fmt:formatNumber value="${refn.refn_pay}" pattern="#,###"/></span>
                    <span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    환불에너지
                </div>
                <div class="Home_order_check_num">
                    <span class="refnpoint">
                        <fmt:formatNumber value="${refn.refn_point}" pattern="#,###"/>
                    </span><span>원</span>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    환불수단
                </div>
                <div class="Home_order_check_num">
                    <c:if test="${refn.refn_method=='C'}">
                        카드결제
                    </c:if>
                </div>
            </div>
            <div>
                <div class="Home_order_check_sub">
                    환불날짜
                </div>
                <div class="Home_order_check_num">
                    ${refn.refn_date}
                </div>
            </div>
        </div>
        </c:forEach>
        </c:if>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>