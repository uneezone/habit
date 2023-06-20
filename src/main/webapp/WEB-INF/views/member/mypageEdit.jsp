<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/mypageEdit.css?after" />'
<script src="/js/mypageEdit.js"></script>

    <!-- 본문 시작 -->

    <div class="Home">
        <form action="" method="post" enctype="multipart/form-data" onsubmit="return myProfile()">
            <div class="Home_top">
                <div class="Home_top_sub">내 정보</div>
                <button class="Home_edit_btn" type="submit">저장</button>
            </div>
            <hr>
            <div class="Home_profile">
                <div>
                    <label for="pro_img">
                        <img src="/storage/${userInfo.user_img}" alt="" class="Home_proimg">
                        <div>
                            <img src="../img/camera.png" alt="" class="Home_proimg_change">
                        </div>
                    </label>
                    <input type="file" id="pro_img" name="user_img" class="Home_pro_imgFile" style="display: none" onchange="setProfile(event)">
                </div>
                <div style="display: inline-block; width: 50%;">
                    <div class="Home_pro_sub">닉네임</div>
                    <div class="Home_pro_btn_name">
                        <input type="text" name="user_name" id="user_name" value="${userInfo.user_name}">
                    </div>

                </div>
                <div style="display: inline-block">
                    <div class="Home_pro_sub">휴대폰번호</div>
                    <div class="Home_pro_btn1">
                        <c:set var="phone" value="${userInfo.user_phone}" />
                        <input type="text" name="user_phone1" id="user_phone1" value="${fn:substring(phone,0,3)}" oninput="checkLength()">-
                        <input type="text" name="user_phone2" id="user_phone2" value="${fn:substring(phone,4,8)}" oninput="checkLength()">-
                        <input type="text" name="user_phone3" id="user_phone3" value="${fn:substring(phone,9,13)}" oninput="checkLength()">
                    </div>
                </div>
                <div>
                    <div class="Home_pro_sub">이메일</div>
                    <div class="Home_pro_btn_email">
                        <c:set var="email" value="${userInfo.user_email}" />
                        <c:set var="indexfind" value="${fn:indexOf(email,'@') }"/>
                        <input type="text" name="user_email1" id="user_email1" value="${fn:substring(email,0,indexfind)}"> @
                        <select name="user_email2" id="user_email2" class="">
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.com">daum.com</option>
                            <option value="itwill.com">itwill.com</option>
                        </select>
                        <script>
                            let find=${indexfind};
                            let email='${userInfo.user_email}';
                            email=email.substring(find+1,email.length);
                            $("#user_email2").val(email).attr("selected","selected");

                        </script>
                    </div>
                </div>
                <div>
                    <div class="Home_pro_sub">비밀번호</div>
                    <div class="Home_pro_btn_pw">
                        <input type="password" name="user_pw" id="user_pw" value="${userInfo.user_pw}">
                        <input type="button" value="변경하기">
                    </div>
                </div>
                <div>
                    <div class="Home_pro_sub">생년월일</div>
                    <div class="Home_pro_btn">
                        <fmt:parseDate value="${userInfo.user_birth}" var="registered" pattern="yyyyMMdd"/>
                        <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd" var="birth"/>
                        <input type="date" name="user_birth" id="user_birth" value="${birth}">
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>