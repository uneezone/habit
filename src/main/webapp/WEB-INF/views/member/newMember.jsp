<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/newMember.css">
<script src="js/newMember.js?after"></script>

    <!-- 본문 시작 -->
    <div class="Home">
        <div>
            <form action="" enctype="multipart/form-data">
                <h3 class="Home_top">회원가입</h3>
                <div class="Home_form">
                    <div class="Home_form_div">
                        <div>아이디</div>
                        <div><input type="text" class="Home_form_input" placeholder="대.소문자, 숫자, 특수문자 포함해서 7글자이상 "></div>
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>비밀번호</div>
                        <div><input type="text" class="Home_form_input" placeholder="띄어쓰기 미포함 8글자 이상"></div>
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>닉네임</div>
                        <div><input type="text" class="Home_form_input"  placeholder="3글자이상 입력"></div>
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>이메일</div>
                        <input type="text" class="Home_form_input_email"> @
                        <select name="user_email" id="" class="Home_form_input_email_select">
                            <option value="0">선택</option>
                            <option value="1">naver.com</option>
                            <option value="2">gmail.com</option>
                            <option value="3">daum.com</option>
                            <option value="4">hanmail.com</option>
                        </select>
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>휴대폰 번호</div>
                        <input type="number" name="" id="" class="Home_form_num"> - 
                        <input type="number" name="" id="" class="Home_form_num"> - 
                        <input type="number" name="" id="" class="Home_form_num">
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>생년월일</div>
                        <input type="date" name="" id="" class="Home_form_date">
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div_p">
                        <div>프로필 이미지</div>
                        <div class="Home_form_profile">
                            <img src="img/noimg.png" alt="" class="Home_proimg">
                        </div>
                        <div class="Home_form_profile">
                            <input type="file" class="Home_form_file" onchange="setProfile(event)">
                        </div>
                        <div class="error"></div>
                    </div>

                    <div>
                        <div>
                            <button class="Home_new_btn">회원가입</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>