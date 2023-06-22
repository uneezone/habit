<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/newMember.css">
<script src="js/newMember.js?after"></script>

    <!-- 본문 시작 -->
    <div class="Home">
        <div>
            <form name="frm" method="post" action="/welcome.do" enctype="multipart/form-data">
                <h3 class="Home_top">회원가입</h3>
                <div class="Home_form">
                    <div class="Home_form_div">
                        <div>아이디</div>
                        <div style="display: flex">
                            <input type="text" class="Home_form_input" name="user_id" id="user_id" placeholder="대.소문자, 숫자, 특수문자 포함해서 7글자이상 ">
                            <button id="idCheck" type="button" onclick="checkId()">중복확인</button><br>
                        </div>
                        <div id="error1"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>비밀번호</div>
                        <div><input type="password" class="Home_form_input" name="user_pw" id="user_pw" placeholder="띄어쓰기 미포함 8글자 이상"></div>
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>닉네임</div>
                        <div><input type="text" class="Home_form_input" name="user_name" id="user_name" placeholder="3글자이상 입력"></div>
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>성별</div>
                        <input type="radio" class="Home_form_input1" name="user_gender" value="M">남
                        <input type="radio" class="Home_form_input1" name="user_gender" value="W">여
                    </div>
                    <div class="Home_form_div">
                        <div>이메일</div>
                        <input type="text" class="Home_form_input_email" name="user_email"> @
                        <select name="user_email2" id="user_email2" class="Home_form_input_email_select">
                            <option value="0">선택</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="hanmail.com">hanmail.com</option>
                        </select>
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>휴대폰 번호</div>
                        <input type="number" name="user_phone" id="user_phone" class="Home_form_num"> -
                        <input type="number" name="user_phone2" id="user_phone2" class="Home_form_num"> -
                        <input type="number" name="user_phone3" id="user_phone3" class="Home_form_num">
                        <div class="error"></div>
                    </div>
                    <div class="Home_form_div">
                        <div>생년월일</div>
                        <input type="date" name="user_birth" id="user_birth" class="Home_form_date">
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
                            <button class="Home_new_btn" onclick="join_check()">회원가입</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- 본문 끝-->
<script>
    function checkId() {
        const id = $("#user_id").val();
        $.ajax({
            type: "post",
            url: "/idCheck",
            data: {'id': id},
            success: function (data) {
                if (data == 1) {
                    $("#error1").text("입력한 ID가 이미 사용 중입니다.");
                } else {
                    $("#error1").text("ID가 사용 가능합니다.");
                }
            }
        });
    }
</script>

<%@include file="../footer.jsp"%>