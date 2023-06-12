<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/bootstrap.journal.min.css">
  <link rel="stylesheet" href="css/custom.min.css">
  <script src="js/bootstrap.bundle.min.js"></script>
  <script src="js/jquery-3.6.4.min.js"></script>
  <title>host_newhost</title>
</head>

<body>
<div class="container">
  <!-- 네비 시작 -->
  <nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light">
    <div class="container-fluid">
      <a class="navbar-brand" href="host_home.jsp"><img src="img/logo (2).png" alt="HABIT" width="100px"></a> <%--링크--%>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link active" href="host_home.jsp" style="font-size: larger;">호스트 관리 페이지</a> <%--링크--%>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">내 정보</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="host_information.jsp">프로필/정산정보 관리</a> <%--링크--%>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">해빗 관리</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="habit_list.jsp">해빗 목록</a> <%--링크--%>
              <a class="dropdown-item" href="habit_create.jsp">해빗 등록</a> <%--링크--%>
              <a class="dropdown-item" href="habit_product_control.jsp">판매 관리</a> <%--링크--%>
              <a class="dropdown-item" href="habit_reservation_control.jsp">예약 관리</a> <%--링크--%>
              <a class="dropdown-item" href="habit_inquiry_control.jsp">문의 관리</a> <%--링크--%>
              <a class="dropdown-item" href="habit_review_control.jsp">리뷰 관리</a> <%--링크--%>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">정산 관리</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="adjustment_control.jsp">정산서 관리</a> <%--링크--%>
            </div>
          </li>
        </ul>
        <div>
          <a href="host_information.jsp"><img src="img/profile-3_07724ab7a395fea9343ed7a13e59c1212e2e3d39c141edd99f83442f98340dfc.webp" alt="" width="50px" height="50px" style="border-radius: 100%; margin: 0 10px;"></a> <%--링크--%>
          <a href="host_information.jsp" style="text-decoration-line: none;"><span name="" style="padding-right: 20px;">HOST ID</span></a> <%--링크--%>
          <button type="button" class="btn btn-outline-primary btn-sm">해빗 홈으로 이동</button>
          <button type="button" class="btn btn-secondary btn-sm">로그아웃</button>
        </div>
      </div>
    </div>
  </nav>
  <hr>
  <!-- 네비 종료 -->

    
    <!-- main 시작 -->
    <div class="content-wrap">
      <!-- 프로필 관리 -->
      <div class="content">
        <p class="content-name">프로필 관리</p>
        <!-- 프로필 관리 form 시작 -->
        <form action="host_home.jsp">
          <!-- 프로필 사진 -->
          <div class="content-flex">
            <div class="item-name">
              <p>프로필 사진</p>
            </div>
            <div class="item2">
              <img src="img/defaulthostPro.png" alt="" width="100px" height="100px" style="border-radius: 100%;"><br><br>
              <input class="form-control" type="file" name="" id="">
              <p class="item2-info">용량 2MB 이하 jpg, png</p>
            </div>
          </div>
          <hr>
          <!-- 호스트 명 -->
          <div class="content-flex">
            <div class="item-name">
              <p>호스트 명</p>
            </div>
            <div class="item2">
              <input type="text" class="form-control" placeholder="호스트 명을 입력해 주세요.">
              <p class="item2-info">실제 해빗을 운영하시는 분의 연락처로 인증해 주세요.<br>
                해당 연락처로 참가자 명단, 프립 진행 관련 중요 알림이 발송됩니다.</p>
            </div>
          </div>
          <hr>
          <!-- 이메일 -->
          <div class="content-flex">
            <div class="item-name">
              <p>이메일</p>
            </div>
            <div class="item2">
              <input type="email" class="form-control" name="" id="" placeholder="이메일을 입력해주세요.">
              <p class="item2-info">실제 사용하시는 이메일 주소를 입력해 주세요.<br>
                해당 메일로 공지사항 및 상품 수정 요청 등 중요 알림이 발생됩니다.</p>
            </div>
          </div>
          <hr>
          <!-- 공개 연락처 -->
          <div class="content-flex">
            <div class="item-name">
              <p>공개 연락처(선택)</p>
            </div>
            <div class="item2">
              <input type="text" class="form-control">
              <p class="item2-info">해빗 회원에게 노출되는 공개 연락처입니다.<br>
                미입력 시 인증한 연락처가 노출됩니다.</p>
            </div>
          </div>
         

          <!-- 프로필 수정 버튼 -->
          <div style="text-align: right;">
            <input type="submit" class="btn btn-primary" value="호스트 지원">
          </div>
        </form>
        <!-- 프로필 관리 form 종료 -->
      </div>      
    </div>
    <!-- main 종료 -->
  </div>

  <!--footer 시작-->
  <footer>
    <div class="footer">
      <div class="footer_wrap">
        <div>
          <strong>(주) Habit Borker</strong>
        </div>
        <div>
          주소 : 서울특별시 강남구 테헤란로 124 4층(역삼동, 삼원타워)
        </div>
        <div>
          <div>대표 : 2조 | 개인정보 관리 책임자 : 모두</div>
        </div>
        <div>
          <a href="#">개인정보 처리방침</a> | 
          <a href="#">이용약관</a> | 
          <span>개인정보취급책임자 : 김태윤</span>
        </div>
        <div>
          <br>COPYRIGHT &copy;HABIT
        </div>
      </div>
    </div>
  </footer>
<!--footer 종료-->
</body>
</html>