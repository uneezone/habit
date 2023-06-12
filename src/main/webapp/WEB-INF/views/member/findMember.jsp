<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/findMember.css" />
<script src="findMember.jsp"></script>
    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_wrapper">
            <div>
                <div class="Home_sub">아이디 찾기</div>
                <form action="">
                    <div class="Home_ment">가입하실 때 기재하신 이메일을 입력해주세요</div>
                    <input type="text" placeholder="이메일 입력" class="Home_input"> @ 
                    <select name="" id="" class="Home_select">
                        <option value="">선택</option>
                        <option value="">gmail.com</option>
                        <option value="">naver.com</option>
                        <option value="">daum.com</option>
                    </select>
                    <button type="button" class="Home_submit" onclick="location.href='resultFindId.html';">다음</button>
                </form>
            </div>
        </div>
        <br>
        <hr>

        <div class="Home_wrapper">
            <div>
                <div class="Home_sub">비밀번호 찾기</div>
                <form action="">
                    <div class="Home_ment">비밀번호를 찾고자하는 아이디를 입력해주세요</div>
                    <input type="text" name="" id="" placeholder="아이디 입력" class="Home_input">
                    <button type="button" class="Home_submit" onclick="location.href='resultFind.html';">다음</button>
                </form>
            </div>
            <br>
        </div>
    </div>


    <%@include file="../footer.jsp"%>