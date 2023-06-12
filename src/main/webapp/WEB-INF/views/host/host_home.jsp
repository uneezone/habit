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
  <title>host_home</title>
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

    <!-- 페이지 이름 -->
    <p class="page-name">호스트 관리 페이지 홈</p>

    <!-- main 시작 -->
    <div class="home-wrap">
      <div class="item align">
        <div class="item home">
          <p class="item-subject">누적 판매금액</p>
          <p class="item-content">0</p>
        </div>
      </div>
      <div class="item align">
        <div class="item home">
          <p class="item-subject">이번달 판매금액</p>
          <p class="item-content">0</p>
        </div>
      </div>
      <div class="item align">
        <div class="item home">
          <p class="item-subject">전체 결제 건수</p>
          <p class="item-content">0</p>
        </div>
      </div>
      <div class="item align">
        <div class="item home">
          <p class="item-subject">이번달 취소 건수</p>
          <p class="item-content">0</p>
        </div>
      </div>
      <div class="item align">
        <div class="item home">
          <p class="item-subject">전체 리뷰수</p>
          <p class="item-content">0</p>
        </div>
      </div>
      <div class="item align">
        <div class="item home">
          <p class="item-subject">평균 평점</p>
          <p class="item-content">0.00</p>
        </div>
      </div>
      <div class="item align">
        <div class="item home">
          <p class="item-subject">문의 응답률</p>
          <p class="item-content">0.00 %</p>
        </div>
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