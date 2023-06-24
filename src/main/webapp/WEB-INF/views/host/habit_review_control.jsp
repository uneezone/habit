<%@ page import="org.json.simple.JSONObject" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <script src="/js/host/habit_review_control.js"></script>
  <title>host_review_control</title>
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
          <a href="info"><img src="/img/profile-3_07724ab7a395fea9343ed7a13e59c1212e2e3d39c141edd99f83442f98340dfc.webp" alt="" width="50px" height="50px" style="border-radius: 100%; margin: 0 10px;"></a>
          <a href="info" style="text-decoration-line: none;"><span name="" style="padding-right: 20px;">HOST ID</span></a>
          <a href="/"><input type="button" class="btn btn-outline-primary btn-sm" value="해빗 홈으로 이동"></a>
          <a href="#"><input type="button" href="#" class="btn btn-secondary btn-sm" value="로그아웃"></a>
        </div>
      </div>
    </div>
  </nav>
  <hr>
  <!-- 네비 종료 -->

    <!-- 페이지 이름 -->
    <p class="page-name">리뷰 관리</p>

    <!-- main 시작 -->
    <div class="content-wrap">
      <!-- 리뷰검색 -->
      <div class="content">
        <p class="content-name">리뷰 검색</p>
        <!-- 리뷰 검색 form 시작 -->
        <form method="post" onsubmit="" name="reviewForm">
          <!-- 별점 -->
          <div class="content-flex">
            <div class="item-name">
              <p>별점(미선택시 전체)</p>
            </div>
            <div style="display: flex; flex-wrap: wrap;">
              <div>
                <input class="form-check-input" type="checkbox" value=1 name="starScore" id="flexCheckChecked1" checked="">
                <label class="form-check-label" for="flexCheckChecked1">
                  1점&nbsp;&nbsp;
                </label>
              </div>
              <div>
                <input class="form-check-input" type="checkbox" value=2 name="starScore" id="flexCheckChecked2" checked="">
                <label class="form-check-label" for="flexCheckChecked2">
                  2점&nbsp;&nbsp;
                </label>
              </div>
              <div>
                <input class="form-check-input" type="checkbox" value=3 name="starScore" id="flexCheckChecked3" checked="">
                <label class="form-check-label" for="flexCheckChecked3">
                  3점&nbsp;&nbsp;
                </label>
              </div>
              <div>
                <input class="form-check-input" type="checkbox" value=4 name="starScore" id="flexCheckChecked4" checked="">
                <label class="form-check-label" for="flexCheckChecked4">
                  4점&nbsp;&nbsp;
                </label>
              </div>
              <div>
                <input class="form-check-input" type="checkbox" value=5 name="starScore" id="flexCheckChecked5" checked="">
                <label class="form-check-label" for="flexCheckChecked5">
                  5점&nbsp;&nbsp;
                </label>
              </div>
            </div>
          </div>
          <!-- 리뷰내용 -->
          <div class="content-flex">
            <div class="item-name">
              <p>리뷰 내용</p>
            </div>
            <div>
            <input type="text" class="form-control" name="reviewContKeyword" id="reviewContKeyword" placeholder="내용을 입력해주세요" style="width: 300px;">
            <p class="item2-info">입력한 내용이 리뷰내용에 포함되어있는 내역만 검색 됩니다.</p>
            </div>
          </div>
          <!-- 회원ID -->
          <div class="content-flex">
            <div class="item-name">
              <p>회원 ID</p>
            </div>
            <div>
              <input type="text" class="form-control" name="searchUserId" id="searchUserId" placeholder="회원 ID를 입력해주세요" style="width: 300px;">
              <p class="item2-info">입력한 ID와 정확히 일치하는 내역만 검색 됩니다.</p>
            </div>
          </div>
          <!-- 리뷰 검색 버튼 -->
          <div style="text-align: right;"><input id="searchReview" type="button" class="btn btn-primary" value="검색"></div>
        </form>
        <!-- 리뷰 검색 form 종료 --> 
      </div>

      <!-- 검색 결과 -->
      <div class="content">
        <div id="search-result">
          <p class='content-name'>검색 결과 : ${paging.totalRecord} 건</p>
        </div>
        <div style="text-align: center;">
          <table class="table">
            <thead>
              <tr class="table-secondary">
                <th>회원ID</th>
                <th>해빗명</th>
                <th>별점</th>
                <th>리뷰내용</th>
                <th>리뷰작성일</th>
                <th>리뷰삭제</th> <!-- 리뷰 삭제를 누르면 해당 리뷰는 공개되지만 별점은 그대로 적용됨을 호스트에게 인지시켜야함 -->
              </tr>
            </thead>
            <tbody id="table-body">
              <c:choose>
                <c:when test="${list.size()>0}">
                  <c:forEach var="item" items="${list}">
                    <tr>
                      <td>${item.user_id}</td>
                      <td>${item.cont_name}</td>
                      <td>${item.review_star}</td>
                      <td>${item.review_cont}</td>
                      <td>${item.review_date}</td>
                      <td>
                      <button class='btn btn-sm btn-primary' id="review_remove${item.review_no}">삭제</button>
                      </td>
                    </tr>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <tr><td colspan='6'>검색 결과가 없습니다</td></tr>
                </c:otherwise>
              </c:choose>
            </tbody>
          </table>
        </div>
        <!-- 페이징 -->
        <div style="display: flex; align-items: center; justify-content: center;">
          <ul class="pagination" id="pagination">
            <c:choose>
              <c:when test="${paging.prev == true}">
                <li class="page-item">
                  <a class="page-link" href="/host/review/${paging.startPage-1}">&laquo;</a>
                </li>
              </c:when>
              <c:otherwise>
                <li class="page-item disabled">
                  <a class="page-link">&laquo;</a>
                </li>
              </c:otherwise>
            </c:choose>
            <c:choose>
              <c:when test="${list.size()>0}">
                <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
                  <li class="page-item">
                    <a class="page-link ${num == paging.currentPage ? 'active': ''}" href="/host/review/${num}">${num}</a>
                  </li>
                </c:forEach>
              </c:when>
            </c:choose>
            <c:choose>
              <c:when test="${paging.next == true}">
                <li class="page-item">
                  <a class="page-link" href="/host/review/${paging.endPage+1}">&raquo;</a>
                </li>
              </c:when>
              <c:otherwise>
                <li class="page-item disabled">
                  <a class="page-link">&raquo;</a>
                </li>
              </c:otherwise>
            </c:choose>
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
<!--footer 종료-->
</body>
</html>