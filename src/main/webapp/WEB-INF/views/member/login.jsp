<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/login.css" />
<script src="js/login.js"></script>

    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_top">
            <h3>로그인</h3>
        </div> 

        <div class="Home_loginForm">
            <form action="login.do" method="post">

                <div class="Home_loginForm_input"><input type="text" name="user_id" placeholder="아이디(이메일)"></div>
                <div class="Home_loginForm_input"><input type="password" name="user_pw" placeholder="비밀번호"></div>
                <a href="/newMember" class="Home_find_a1">회원가입</a> |
                <a href="/findMember" class="Home_find_a2">아이디/비밀번호 찾기</a><br>
                <button class="Home_login_btn">로그인</button>
            </form>
        </div>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>