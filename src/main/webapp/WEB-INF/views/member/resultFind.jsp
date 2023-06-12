<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/resultFind.css?after">
<script src="js/resultFind.js?after"></script>


    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_sub">
            비밀번호 임시 발급
        </div>
        <hr>
        <div class="Home_form_wrapper">
            <div class="Home_ment"> 

                원하시는 방법을 선택해 임시 비밀번호를 확인하실 수 있습니다
            </div>
            <form action="">
                <div class="Home_select">
                    <input type="radio" name="pw" id="" disabled> 회원정보에 등록된 이메일로 받기 <span>********@naver.com</span>
                </div>
                <div class="Home_select">
                    <input type="radio" name="pw" id="" disabled> 회원정보에 등록된 휴대전화번호로 받기 <span>010-**05-05**</span>
                </div>
                <button class="Home_btn">임시비밀번호 전송</button>
            </form>


            <!--전송 완료시-->
            <hr>
            <div>전송이 완료되셨습니다. 선택하신 방법을 통해 확인해주세요.</div>
            <button class="Home_btn">로그인 페이지로 돌아가기</button>
        </div>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>