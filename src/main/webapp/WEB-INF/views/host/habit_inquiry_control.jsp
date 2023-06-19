<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/bootstrap.journal.min.css">
  <link rel="stylesheet" href="/css/custom.min.css">
  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/jquery-3.6.4.min.js"></script>
  <script src="/js/host/habit_inquiry_control.js"></script>
  <title>habit_inquiry_control</title>
</head>

<body>
<div class="container">
  <!-- 네비 시작 -->
  <nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light">
    <div class="container-fluid">
      <a class="navbar-brand" href="host_home.jsp"><img src="/img/logo (2).png" alt="HABIT" width="100px"></a> <%--링크--%>
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
          <a href="host_information.jsp"><img src="/img/profile-3_07724ab7a395fea9343ed7a13e59c1212e2e3d39c141edd99f83442f98340dfc.webp" alt="" width="50px" height="50px" style="border-radius: 100%; margin: 0 10px;"></a> <%--링크--%>
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
    <p class="page-name">문의 관리</p>
    
    <!-- main 시작 -->
    <div class="content-wrap">
      <div class="content">
        <p class="content-name">문의 조회</p>
        <!-- 문의 조회 form 시작 -->
        <form>
          <!-- 조회기간 -->
          <div class="content-flex">
            <div class="item-name">
              <p>조회 기간</p>
            </div>
            <div class="item">
              <div style="display: flex;">
                <input type="date" class="form-control" id="date-calendar-start" name="searchDate"> &nbsp;~&nbsp; <input type="date" id="date-calendar-end" name="searchDate" class="form-control">
              </div>
              <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="today" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio1">오늘</label>
                <input type="radio" class="btn-check" name="btnradio" id="btnradio2" value="1Month" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio2">1개월</label>
                <input type="radio" class="btn-check" name="btnradio" id="btnradio3" value="6Month" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio3">6개월</label>
                <input type="radio" class="btn-check" name="btnradio" id="btnradio4" value="1year" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio4">&nbsp;1년&nbsp;</label>
                <input type="radio" class="btn-check" name="btnradio" id="btnradio5" value="5year" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio5">&nbsp;5년&nbsp;</label>
                <input type="radio" class="btn-check" name="btnradio" id="btnradio6" value="all" autocomplete="off" checked>
                <label class="btn btn-sm btn-outline-primary" for="btnradio6">전체</label>
              </div>
            </div>
          </div>
          <!-- 검색어 -->
          <div class="content-flex">
            <div class="item-name">
              <p>검색어</p>
            </div>
            <div class="item">
              <div>
                <select name="" id="" style="width: 150px;" class="form-select">
                  <option value="">상품명</option>
                  <option value="">문의 내용</option>
                  <option value="">문의 작성ID</option>
                </select>
              </div>
              <div>
                <input type="text" class="form-control" placeholder="검색어를 입력해주세요">
              </div>
              <div>
                <input type="submit" class="btn btn-primary" value="검색">
                <input type="reset" class="btn btn-outline-primary" value="초기화">
              </div>
            </div>
          </div>
        </form>
        <!-- 문의 조회 form 종료 -->
      </div>

      <!-- 검색 결과 -->
      <div class="content">
        <p class="content-name">검색 결과 : 0 건</p>
        <div style="text-align: center;">
          <table class="table">
            <thead>
              <tr class="table-secondary">
                <th>문의ID</th>
                <th>문의컨텐츠</th>
                <th>문의내용</th>
                <th>문의일자</th>
                <th>응답일자</th><!--옵션명-->
                <th>응답상태</th>
                <th>응답확인</th>
              </tr>
            </thead>
            <tbody>
              <!-- 미응답 -->
              <tr>
                <td>user-1</td>
                <td><a href="#">[서핑] 원데이 클래스</a></td>
                <td>최대인원수가 5명인가요?</td>
                <td>2023-04-07 00:00:00</td>
                <td>-</td>
                <td>미응답</td>
                <td>
                  <span hidden>-</span>
                  <input class="btn btn-sm btn-primary" type="button" value="응답하기">
                </td>
              </tr>
              <!-- 응답 -->
              <tr>
                <td>user-2</td>
                <td><a href="#">[심리상담] 1:1 상담 회차권</a></td>
                <td>비밀 보장 해주나요?</td>
                <td>2023-04-08 00:00:00</td>
                <td>2023-04-08 12:00:00</td>
                <td>응답</td>
                <td>
                  <span>-</span>
                  <input class="btn btn-sm btn-primary" type="button" value="응답하기" hidden>
                </td>
              </tr>
              <tr>
                <td colspan="8">검색 결과가 없습니다</td>
              </tr>
            </tbody>
          </table>
        </div>
        <!-- 페이징 -->
        <div style="display: flex; align-items: center; justify-content: center;">
          <ul class="pagination">
            <li class="page-item disabled">
              <a class="page-link" href="#">&laquo;</a>
            </li>
            <li class="page-item active">
              <a class="page-link" href="#">1</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">2</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">3</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">4</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">5</a>
            </li>
            <li class="page-item">
              <a class="page-link" href="#">&raquo;</a>
            </li>
          </ul>
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
<!--footer 끝-->
</body>
</html>