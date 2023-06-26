<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/findMember.css" />
<script src="/js/findMember.js"></script>
    <!-- 본문 시작 -->
    <div class="Home">
        <div class="Home_wrapper">
            <div>
                <div class="Home_sub">아이디 / 비밀번호 찾기</div>
                <div class="Home_ment">가입하실 때 기재하신 이메일을 입력해주세요</div>
                <form method="post" name="UserCheckForm" style="display: flex; align-items: center; justify-content: center; flex-direction: column" onsubmit="return checkForm()">
                    <input type="text" placeholder="이메일 입력" class="Home_input" name="user_email" id="user_email" style="height: 50px; margin: 20px 0">
                    <small id="email-small" hidden style="color: red; font-size: small"></small>
                    <div style="display:flex; align-items: center; justify-content: center">
                        <button type="submit" onclick="javascript:form.action='/findid/result'" class="Home_submit" style="height:40px; width: 200px; margin: 30px 5px">아이디 찾기</button>
                        <button type="submit" onclick="javascript:form.action='/findpw'" class="Home_submit" style="height:40px; width: 200px; margin: 30px 5px">비밀번호 찾기</button>
                    </div>
                </form>
            </div>
        </div>
        <br>
        <hr>
    </div>
<%@include file="../footer.jsp"%>