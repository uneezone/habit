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
      <a class="navbar-brand" href="/host"><img src="/img/logo (2).png" alt="HABIT" width="100px"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link active" href="/host" style="font-size: larger;">호스트 관리 페이지</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">내 정보</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="/host/info">프로필/정산정보 관리</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">해빗 관리</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="/host/content/list">해빗 목록</a>
              <a class="dropdown-item" href="/host/content/form">해빗 등록</a>
              <a class="dropdown-item" href="/host/product">판매 관리</a>
              <a class="dropdown-item" href="/host/reservation">예약 관리</a> <!--링크-->
              <a class="dropdown-item" href="/host/inquiry">문의 관리</a>
              <a class="dropdown-item" href="/host/review">리뷰 관리</a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">정산 관리</a>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="/host/adjust">정산서 관리</a>
            </div>
          </li>
        </ul>
        <div>
          <a href="info"><img src="${host_img.equals("defaulthostPro.png") ? '/img/' : '/storage/'}${host_img}" alt="" width="50px" height="50px" style="border-radius: 100%; margin: 0 10px;"></a>
          <a href="info" style="text-decoration-line: none;"><span name="" style="padding-right: 20px;">${host_id}</span></a>
          <a href="/"><input type="button" class="btn btn-outline-primary btn-sm" value="해빗 홈으로 이동"></a>
          <a href="#"><input type="button" href="#" class="btn btn-secondary btn-sm" value="로그아웃"></a>
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
                <input type="date" class="form-control" id="date-calendar-start" name="searchStartDate"> &nbsp;~&nbsp; <input type="date" id="date-calendar-end" name="searchEndDate" class="form-control">
              </div>
              <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                <input type="radio" class="btn-check" name="btnradio" id="today" value="today" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="today">오늘</label>
                <input type="radio" class="btn-check" name="btnradio" id="1Month" value="1Month" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="1Month">1개월</label>
                <input type="radio" class="btn-check" name="btnradio" id="6Month" value="6Month" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="6Month">6개월</label>
                <input type="radio" class="btn-check" name="btnradio" id="1year" value="1year" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="1year">&nbsp;1년&nbsp;</label>
                <input type="radio" class="btn-check" name="btnradio" id="5year" value="5year" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="5year">&nbsp;5년&nbsp;</label>
                <input type="radio" class="btn-check" name="btnradio" id="all" value="all" autocomplete="off" checked>
                <label class="btn btn-sm btn-outline-primary" for="all">전체</label>
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
                <select name="searchKeywordType" id="searchKeywordType" style="width: 150px;" class="form-select">
                  <option value="cont_name">상품명</option>
                  <option value="q_question">문의 내용</option>
                  <option value="id">문의 작성ID</option>
                </select>
              </div>
              <div>
                <input type="text" name="searchKeyword" id="searchKeyword" class="form-control" placeholder="검색어를 입력해주세요">
              </div>
              <div>
                <input type="button" id="searchInquiry" class="btn btn-primary" value="검색">
                <input type="reset" class="btn btn-outline-primary" value="초기화">
              </div>
            </div>
          </div>
        </form>
        <!-- 문의 조회 form 종료 -->
      </div>

      <!-- 검색 결과 -->
      <div class="content">
        <div id="searchResult">
        </div>
        <div style="text-align: center;">
          <table class="table">
            <thead>
              <tr class="table-secondary">
                <th>문의ID</th>
                <th>문의컨텐츠명</th>
                <th>문의내용</th>
                <th>문의일자</th>
                <th>답변상태</th>
                <th>답변하러가기</th>
              </tr>
            </thead>
            <tbody id="table-body">
            </tbody>
          </table>
        </div>
        <!-- 페이징 -->
        <div style="display: flex; align-items: center; justify-content: center;">
          <ul class="pagination" id="pagination">
<%--            <li class="page-item disabled">--%>
<%--              <a class="page-link" href="#">&laquo;</a>--%>
<%--            </li>--%>
<%--            <li class="page-item active">--%>
<%--              <a class="page-link" href="#">1</a>--%>
<%--            </li>--%>
<%--            <li class="page-item">--%>
<%--              <a class="page-link" href="#">2</a>--%>
<%--            </li>--%>
<%--            <li class="page-item">--%>
<%--              <a class="page-link" href="#">3</a>--%>
<%--            </li>--%>
<%--            <li class="page-item">--%>
<%--              <a class="page-link" href="#">4</a>--%>
<%--            </li>--%>
<%--            <li class="page-item">--%>
<%--              <a class="page-link" href="#">5</a>--%>
<%--            </li>--%>
<%--            <li class="page-item">--%>
<%--              <a class="page-link" href="#">&raquo;</a>--%>
<%--            </li>--%>
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