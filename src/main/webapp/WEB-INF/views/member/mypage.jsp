<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/mypage.css" />
<script src="js/mypage.js"></script>

    <!-- 본문 시작 -->

    <div class="Home">
        <a href="/mypage/myedit"><div class="Home_myinfo">
            <div class="Home_myinfo_img">
                <img src="/storage/${nameImg.user_img}" alt="">
            </div>
            <div class="Home_myinfo_name">
                ${nameImg.user_name}
            </div>
        </div></a>
        <!--마이 정보 끝-->

        <div class="Home_myrecord">
            <a href="">
                <div class="Home_myrecord_name">에너지</div>
                <div class="Home_myrecord_num">${myInfo.energy}</div>
            </a>
            <a href="">
                <div class="Home_myrecord_name">쿠폰</div>
                <div class="Home_myrecord_num">0</div>
            </a>
            <a href="">
                <div class="Home_myrecord_name">후기</div>
                <div class="Home_myrecord_num">
                    ${myInfo.review}
                </div>
            </a>
            <a href="">
                <div class="Home_myrecord_name">피드</div>
                <div class="Home_myrecord_num">0</div>
            </a>
        </div>
        <!--마이 기록 정보 끝-->
        <hr>
        <div class="Home_myact">
            <div class="Home_myact_name">내 활동</div>
            <a href="/mypage/order">
                <div class="Home_myact_order">
                    결제내역
                </div>
            </a>
            <a href="#">
                <div class="Home_myact_friend1">
                    친구초대
                </div>
                <div class="Home_myact_friend2">
                    3,000원 에너지 받기
                </div>
            </a>
        </div>
        <hr>
        <!--고객센터-->
        <div class="Home_myact">
            <div class="Home_myact_name">고객센터</div>
            <a>
                <div class="Home_myact_order">
                    공지사항
                </div>
            </a>
            <a href="#">
                <div class="Home_myact_friend1">
                    FAQ
                </div>
            </a>
        </div>
         <hr>
        <!--호스트지원-->
        <div class="Home_myact">
            <div class="Home_myact_name">호스트</div>
            <a href="/host">
                <div class="Home_myact_order">
                    호스트 센터
                </div>
            </a>
        </div>        
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>