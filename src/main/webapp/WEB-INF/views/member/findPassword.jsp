<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/css/resultFind.css?after">
<script src="/js/resultFind.js?after"></script>


    <!-- 본문 시작 -->
    <div id="div_load_img" style="display: none; justify-content: center; position: fixed; width: 100%; height: 100%; background-color: rgba(171,171,171,0.3)">
        <div style="position: absolute; top: 30%; height: 0px; z-index: 9999; background: rgba(126,125,125,0.54); filter: alpha(opacity=50); opacity: alpha*0.5; margin: auto; padding: 0">
            <img src="/img/loading.gif" style="width: 70px; height: 70px;">
        </div>
    </div>


    <div class="Home">
        <div class="Home_sub">
            비밀번호 임시 발급
        </div>
        <hr>
        <div class="Home_form_wrapper">
            <div id="methodSelect">
                <div class="Home_ment">
                    임시 비밀번호 발급 방법을 선택해주세요
                </div>
                <div>
                    <div class="Home_select">
                        <input type="radio" name="method" id="user_email" value="${user_email}" checked>&nbsp;<label for="user_email">회원정보에 등록된 이메일로 받기
                        <span>(${user_email.substring(0,3)}<c:forEach begin="1" end="${user_email.split('@')[0].length()-2}">*</c:forEach>@${user_email.split("@")[1]})</span></label>
                    </div>
                    <div class="Home_select">
                        <input type="radio" name="method" id="user_phone" value="${user_phone}">&nbsp;<label for="user_phone">회원정보에 등록된 휴대전화번호로 받기 <span>(${user_phone.substring(0,4)}****${user_phone.substring(8)})</span></label>
                    </div>
                    <button class="Home_btn" id="sendEmail">임시비밀번호 전송</button>
                </div>
            </div>

            <!--전송 완료시-->
            <div id="result" hidden>
                <div>전송이 완료되었습니다. 임시 비밀번호를 확인해주세요.</div>
                <button class="Home_btn" onclick="location.href='/login'">로그인 페이지로 돌아가기</button>
            </div>
        </div>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>