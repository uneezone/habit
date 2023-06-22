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
  <script src="/js/host/habit_list.js"></script>
  <title>content_list</title>
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
              <a class="dropdown-item" href="/host/contentlist">해빗 목록</a>
              <a class="dropdown-item" href="/host/contentform">해빗 등록</a>
              <a class="dropdown-item" href="/host/product">판매 관리</a>
              <a class="dropdown-item" href="/host/reservation">예약 관리</a>
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
    <p class="page-name">해빗 목록</p>

    <!-- main 시작 -->
    <div class="content-wrap">
      <div class="content">
        <p class="content-name">해빗 조회</p>
        <!-- 해빗 조회 form 시작 -->
        <form>
          <!-- 검색어 -->
          <div class="content-flex">
            <div class="item-name">
              <p>해빗명 검색</p>
            </div>
            <div class="item">
              <div>
                <input type="text" class="form-control" name="cont_name" id="cont_name" placeholder="검색어를 입력해주세요" style="width: 400px">
              </div>
            </div>
          </div>
          <!-- 조회기간 -->
          <div class="content-flex">
            <div class="item-name">
              <p>조회기간</p>
            </div>
            <div>
              <div class="item">
                <div>
                  <select name="searchDateType" id="searchDateType" style="width: 150px;" class="form-select">
                    <option value="cont_stdate">판매시작일</option>
                    <option value="cont_endate">판매종료일</option>
                  </select>
                </div>
                <div style="display: flex;">
                  <input type="date" id="date-calendar-start" class="form-control"> &nbsp;~&nbsp; <input type="date" id="date-calendar-end" class="form-control">
                </div>
              </div>
              <div>
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
              <div>
                <p class="item2-info" style="color: gray;">조회기간을 비워두면 전체기간으로 조회됩니다.</p>
              </div>
            </div>
          </div>
          <!-- 상품상태 -->
          <div class="content-flex">
            <div class="item-name">
              <p>상품 상태</p>
            </div>
            <div class="item2" style="display: flex">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="cont_status" value="Y" id="cont_status1" checked>
                <label class="form-check-label" for="cont_status1">
                  판매중
                </label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="checkbox" name="cont_status" value="N" id="cont_status2" checked>
                <label class="form-check-label" for="cont_status2">
                  판매종료
                </label>
              </div>
            </div>
          </div>
          <div style="float: right;">
            <input type="button" id="search-content" class="btn btn-primary" value="검색">
            <input type="reset" class="btn btn-outline-primary" value="초기화">
          </div>
        </form>
      </div>
      <!-- 해빗 조회 form 종료 -->

      <!-- 조회 결과 -->
      <div class="content">
        <div id="searchResult">
          <p class='content-name'>검색 결과 : ${list.size()} 건</p>
        </div>

        <div class="class-flex" id="tableBody" style="align-items: center; justify-content: center">
          <c:choose>
            <c:when test="${list.size()>0}">
              <c:forEach var="item" items="${list}">
                  <div class='class-box'>
                    <div style='display: flex; align-items: center; justify-content: center'>
                      <a href='#'><img src='/storage/${item.cont_img}' alt=''></a>
                    </div>
                    <div style='margin: 10px 0'>
                      <a href='#' style='font-size: large'><span><strong>${item.cont_name}</strong></span></a>
                    </div>
                    <div style='color: #494846'>
                      <strong>[판매시작] </strong>${item.cont_stdate.substring(0, 16)}<br>
                      <strong>[판매종료] </strong>${item.cont_endate.substring(0, 16)}<br>
                      <strong>[카테고리] </strong>${item.cate_large} &gt; ${item.cate_middle}
                    </div>
                    <div>
                      <input type="button" class="btn btn-sm btn-outline-primary content-update" onclick="location.href = '/host/contentlist/update/${item.cont_no}'" id="update${item.cont_no}" value="해빗수정">
                      <input type="button" class="btn btn-sm btn-primary content-delete" id="delete${item.cont_no}" value="해빗삭제">
                    </div>
                  </div>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <p>검색 결과가 없습니다</p>
            </c:otherwise>
          </c:choose>
        </div>

        <div class="d-grid gap-2" id="pagination">
<%--          <button class="btn btn-lg btn-outline-primary" type="button">더보기</button>--%>
        </div>
      </div>
    </div>
  </div>
  <!-- main 종료 -->


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