<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/css/resultFindId.css">
<script src="/js/resultFindId.js"></script>


    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_sub">
            아이디 찾기
        </div>
        <hr>
        <div class="Home_form_wrapper">
            <div class="Home_select">
            <c:choose>
            <c:when test="${user_id != null}">
                <div class="Home_ment">
                    기재하신 이메일을 통해 검색된 아이디는 아래와 같습니다.
                </div>
                <div class="Home_ment" style="margin-bottom: 0">
                    "${user_id}"
                </div>
            </div>
            <button type="submit" class="Home_btn" onclick="location.href='/login'">로그인 하러가기</button>
            </c:when>
            <c:otherwise>
                <div class="Home_ment" style="margin-bottom: 0">
                    회원 정보를 찾을 수 없습니다.
                </div>
            </div>
            <button type="submit" class="Home_btn" onclick="location.href='javascript:history.back()'">뒤로가기</button>
            </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- 본문 끝-->


<%@include file="../footer.jsp"%>