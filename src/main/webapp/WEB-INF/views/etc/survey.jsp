<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="/css/reset.css?after">
  <link rel="stylesheet" href="/css/survey.css?after">
  <script src="/js/survey.js?after"></script>
  <link rel="stylesheet" href="/css/modal.css">
<script>

</script>


</head>
<body>

    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_sub">
            <div>설문조사</div>
            <img src="/img/dding.png" alt="" class="Home_sub_img">
        </div>
        <hr>
        <div class="Home_form">
            <form action="">
                <div class="Home_form_wrapper">
                    <div class="Home_form_num">
                        질문 1
                    </div>
                    <div class="Home_form_ask">
                        성별이 어떻게 되십니까?
                    </div>
                    <div class="Home_form_answer">
                        <div><input type="radio" name="gender" id="" value="남자">남자</div>
                        <div><input type="radio" name="gender" id="" value="여자">여자</div>
                        <div><input type="radio" name="gender" id="" value="그외">그외</div>
                    </div>
                </div>

                <!--질문끝-->
                <div class="Home_form_wrapper">
                    <div class="Home_form_num">
                        질문 2
                    </div>
                    <div class="Home_form_ask">
                        나이대가 어떻게 되십니까?
                    </div>
                    <div class="Home_form_answer">
                        <div><input type="radio" name="age" id="" value="남자">20대 이하</div>
                        <div><input type="radio" name="age" id="" value="여자">30대 이하</div>
                        <div><input type="radio" name="age" id="" value="그외">40대 이하</div>
                        <div><input type="radio" name="age" id="" value="그외">50대 이상</div>
                    </div>
                </div>

                <!--질문끝-->
                <div class="Home_form_wrapper">
                    <div class="Home_form_num">
                        질문 3
                    </div>
                    <div class="Home_form_ask">
                        실내 활동, 실외 활동 중 어떤 것을 추구하십니까?
                    </div>
                    <div class="Home_form_answer">
                        <div><input type="radio" name="where" id="" value="남자">실내 활동</div>
                        <div><input type="radio" name="where" id="" value="여자">실외 활동</div>
                    </div>
                </div>

                <!--질문끝-->
  
                
                <!--질문끝-->
                <div class="Home_form_wrapper">
                    <div class="Home_form_num">
                        질문 4
                    </div>
                    <div class="Home_form_ask">
                        다른 사람과 함께하는 활동 또는 개인적인 활동을 원하십니까?
                    </div>
                    <div class="Home_form_answer">
                        <div><input type="radio" name="how" id="" value="남자">연인과 함께</div>
                        <div><input type="radio" name="how" id="" value="남자">친구와 함께</div>
                        <div><input type="radio" name="how" id="" value="여자">혼자</div>
                        <div><input type="radio" name="how" id="" value="여자">노상관</div>
                        
                    </div>
                </div>

                <!--질문끝-->
                <div class="Home_form_wrapper">
                    <div class="Home_form_num">
                        질문 5
                    </div>
                    <div class="Home_form_ask">
                        당신이 지불할 수 있는 원데이클래스 금액?
                    </div>
                    <div class="Home_form_answer">
                        <div><input type="radio" name="fare" id="" value="남자">3만원 미만</div>
                        <div><input type="radio" name="fare" id="" value="여자">5만원 미만</div>
                        <div><input type="radio" name="fare" id="" value="여자">7만원 미만</div>
                        <div><input type="radio" name="fare" id="" value="여자">10만원 미만</div>
                    </div>
                </div>
                <hr>
                <div class="Home_form_info">
                    *설문조사완료 후 에너지는 자동 지급됩니다. <br>                                   
                    *이벤트 적용 기간에 한해 적립 <br>
                    
                </div>
                <div class="Home_form_btn_wrapper">
                    <button class="Home_form_btn">설문조사 완료</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 본문 끝-->
    
    <%@include file="../footer.jsp"%>

  
</body>