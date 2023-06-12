<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/mypageEdit.css?after" />'
<script src="js/mypageEdit.js"></script>

    <!-- 본문 시작 -->

    <div class="Home">
        <form action="">
            <div class="Home_top">
                <div class="Home_top_sub">내 정보</div>
                <button class="Home_edit_btn" onclick="location.href='mypage.html'">저장</button>
            </div>
            <hr>
            <div class="Home_profile">
                <div>
                    <label for="pro_img">
                        <img src="../img/defaultPro.png" alt="" class="Home_proimg">
                        <div>
                            <img src="../img/camera.png" alt="" class="Home_proimg_change">
                        </div>
                    </label>
                    <input type="file" id="pro_img" class="Home_pro_imgFile" style="display: none" onchange="setProfile(event)">
                </div>
                <div>
                    <div class="Home_pro_sub">닉네임</div>
                    <div class="Home_pro_btn">
                        <input type="text" name="" id="">
                    </div>

                </div>
                <div>
                    <div class="Home_pro_sub">휴대폰번호</div>
                    <div class="Home_pro_btn">
                        <input type="text" name="" id="">
                    </div>
                </div>
                <div>
                    <div class="Home_pro_sub">이메일</div>
                    <div class="Home_pro_btn">
                        <input type="text" name="" id="">
                    </div>
                </div>
                <div>
                    <div class="Home_pro_sub">비밀번호</div>
                    <div class="Home_pro_btn_pw">
                        <input type="text" name="" id="" >
                        <input type="button" value="변경하기">
                    </div>
                </div>
                <div>
                    <div class="Home_pro_sub">생년월일</div>
                    <div class="Home_pro_btn">
                        <input type="date" name="" id="">
                    </div>
                </div>
                <div>
                    <div class="Home_pro_sub">성별</div>
                    <div class="Home_pro_btn">
                        <input type="text" name="" id="">
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>