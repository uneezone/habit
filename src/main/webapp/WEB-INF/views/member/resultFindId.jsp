<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/resultFindId.css?after">
<script src="js/resultFindId.js"></script>


    <!-- 본문 시작 -->

    <div class="Home">
        
        
            <div class="Home_sub">
                아이디 찾기
            </div>
            <hr>
            <div class="Home_form_wrapper">
                <div class="Home_ment"> 
    
                    기재하신 이메일을 통해 검색된 아이디는 아래와 같습니다.
                </div>
                
                <div class="Home_select">
                    <c:choose>
                        <c:when test="${user_id != null}">
                            <p>아이디는 ${user_id}입니다.</p>
                        </c:when>
                        <c:otherwise>
                            <p>회원 정보를 찾을 수 없습니다.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
               
                <button type="submit" class="Home_btn">로그인 페이지로 돌아가기</button>
                
            </div>
        
    </div>

    <!-- 본문 끝-->


<%@include file="../footer.jsp"%>