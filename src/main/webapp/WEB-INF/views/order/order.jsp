<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/order.css?after" />
<script src="js/jquery.cookie.js"></script>
<script src="js/order.js?after"></script>
<script src="js/common.js?after"></script>
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
                    <div class="Home_show_container show_list">
                        <div class="Home_show_date">2022년 5월 24일 23:30 결제</div> | 
                        <div class="Home_show_num"> 구매수량 : <span>1</span></div>
                        <div class="Home_show_detail"><a href="orderdetail.jsp">주문상세 보기 ></a></div>
                        <div class="Home_show_con">
                            <div class="Home_show_wrapper">
                                <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                                <a >
                                    <div class="Home_show_order_info">
                                    <div>신사 / 가로수길 칵테일 클래스</div>
                                    <div>6월 1일 (일) 오후 2시 30분</div>
                                    <div></div>
                                    </div>
                                </a>
                                <div class="Home_change_con">
                                    <div>
                                        <button class="Home_change_btn" onclick="location.href='refund.html';">환불하기</button>
                                    </div>
                                    <div>
                                        <button class="Home_change_btn"  onclick="location.href='reviewwrite.html';">리뷰쓰기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="Home_show_wrapper">
                                <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                                <a >
                                    <div class="Home_show_order_info">
                                    <div>신사 / 가로수길 칵테일 클래스</div>
                                    <div>6월 1일 (일) 오후 2시 30분</div>
                                    <div></div>
                                    </div>
                                </a>
                                <div class="Home_change_con">
                                    <div>
                                        <button class="Home_change_btn">환불하기</button>
                                    </div>
                                    <div>
                                        <button class="Home_change_btn">리뷰쓰기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="Home_divhr">
                    </div>

                    <div class="Home_show_container_cancel show_list">
                        <div class="Home_show_date">2022년 5월 24일 23:30 결제</div> | 
                        <div class="Home_show_num"> 구매수량 : <span>1</span></div>
                        <div class="Home_show_detail"><a href="orderdetail.jsp">주문상세 보기 ></a></div>
                        <div class="Home_show_wrapper">
                            <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                            <span class="Home_refund"><span>환불완료</span></span>
                            <a href="orderdetail.jsp">
                                <div class="Home_show_order_info">
                                    <div>신사 / 가로수길 칵테일 클래스</div>
                                    <div>6월 1일 (일) 오후 2시 30분</div>
                                    
                                    <div></div>
                                    </div>
                                <div class="Home_change_con">
                                    <div>
                                        <button type="button" class="Home_change_btn_refund" disabled>환불하기</button>
                                    </div>
                                    <div>
                                        <button  type="button" class="Home_change_btn_refund" disabled>리뷰쓰기</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <hr class="Home_divhr">
                    </div>   

                    <div class="Home_show_container_cancel show_list">
                        <div class="Home_show_date">2022년 5월 24일 23:30 결제</div> | 
                        <div class="Home_show_num"> 구매수량 : <span>1</span></div>
                        <div class="Home_show_detail"><a href="orderdetail.jsp">주문상세 보기 ></a></div>
                        <div class="Home_show_wrapper">
                            <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                            <span class="Home_refund"><span>환불완료</span></span>
                            <a href="orderdetail.jsp">
                                <div class="Home_show_order_info">
                                    <div>신사 / 가로수길 칵테일 클래스</div>
                                    <div>6월 1일 (일) 오후 2시 30분</div>
                                    
                                    <div></div>
                                    </div>
                                <div class="Home_change_con">
                                    <div>
                                        <button type="button" class="Home_change_btn_refund" disabled>환불하기</button>
                                    </div>
                                    <div>
                                        <button  type="button" class="Home_change_btn_refund" disabled>리뷰쓰기</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <hr class="Home_divhr">
                    </div>   

                    <div class="Home_show_container show_list">
                        <div class="Home_show_date">2022년 5월 24일 23:30 결제</div> | 
                        <div class="Home_show_num"> 구매수량 : <span>1</span></div>
                        <div class="Home_show_detail"><a href="orderdetail.jsp">주문상세 보기 ></a></div>
                        <div class="Home_show_con">
                            <div class="Home_show_wrapper">
                                <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                                <a >
                                    <div class="Home_show_order_info">
                                    <div>신사 / 가로수길 칵테일 클래스</div>
                                    <div>6월 1일 (일) 오후 2시 30분</div>
                                    <div></div>
                                    </div>
                                </a>
                                <div class="Home_change_con">
                                    <div>
                                        <button class="Home_change_btn" onclick="location.href='refund.html';">환불하기</button>
                                    </div>
                                    <div>
                                        <button class="Home_change_btn"  onclick="location.href='reviewwrite.html';">리뷰쓰기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="Home_show_wrapper">
                                <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                                <a >
                                    <div class="Home_show_order_info">
                                    <div>신사 / 가로수길 칵테일 클래스</div>
                                    <div>6월 1일 (일) 오후 2시 30분</div>
                                    <div></div>
                                    </div>
                                </a>
                                <div class="Home_change_con">
                                    <div>
                                        <button class="Home_change_btn">환불하기</button>
                                    </div>
                                    <div>
                                        <button class="Home_change_btn">리뷰쓰기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr class="Home_divhr">
                    </div>

                    <div class="Home_show_container_cancel show_list">
                        <div class="Home_show_date">2022년 5월 24일 23:30 결제</div> | 
                        <div class="Home_show_num"> 구매수량 : <span>1</span></div>
                        <div class="Home_show_detail"><a href="orderdetail.jsp">주문상세 보기 ></a></div>
                        <div class="Home_show_wrapper">
                            <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                            <span class="Home_refund"><span>환불완료</span></span>
                            <a href="orderdetail.jsp">
                                <div class="Home_show_order_info">
                                    <div>신사 / 가로수길 칵테일 클래스</div>
                                    <div>6월 1일 (일) 오후 2시 30분</div>
                                    
                                    <div></div>
                                    </div>
                                <div class="Home_change_con">
                                    <div>
                                        <button type="button" class="Home_change_btn_refund" disabled>환불하기</button>
                                    </div>
                                    <div>
                                        <button  type="button" class="Home_change_btn_refund" disabled>리뷰쓰기</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <hr class="Home_divhr">
                    </div>   
                </div>

                <div class="Home_show_con_btn">
                    <button class="Home_show_more show_btn">더보기</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>