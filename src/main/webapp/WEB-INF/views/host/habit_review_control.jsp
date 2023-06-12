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
  <title>host_review_control</title>
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
    <p class="page-name">리뷰 관리</p>

    <!-- main 시작 -->
    <div class="content-wrap">
      <!-- 리뷰검색 -->
      <div class="content">
        <p class="content-name">리뷰 검색</p>
        <!-- 리뷰 검색 form 시작 -->
        <form method="" action="" onsubmit="">
          <!-- 평점 -->
          <div class="content-flex">
            <div class="item-name">
              <p>평점(미선택시 전체)</p>
            </div>
            <div style="display: flex; flex-wrap: wrap;">
              <div>
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked1" checked="">
                <label class="form-check-label" for="flexCheckChecked1">
                  1점&nbsp;&nbsp;
                </label>
              </div>
              <div>
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked2" checked="">
                <label class="form-check-label" for="flexCheckChecked2">
                  2점&nbsp;&nbsp;
                </label>
              </div>
              <div>
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked3" checked="">
                <label class="form-check-label" for="flexCheckChecked3">
                  3점&nbsp;&nbsp;
                </label>
              </div>
              <div>
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked4" checked="">
                <label class="form-check-label" for="flexCheckChecked4">
                  4점&nbsp;&nbsp;
                </label>
              </div>
              <div>
                <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked5" checked="">
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
            <input type="text" class="form-control" placeholder="내용을 입력해주세요" style="width: 300px;">
            </div>
          </div>
          <!-- 회원ID -->
          <div class="content-flex">
            <div class="item-name">
              <p>회원 ID</p>
            </div>
            <div>
              <input type="text" class="form-control" placeholder="회원 ID를 입력해주세요" style="width: 300px;">
              <p class="item2-info">입력한 ID와 정확히 일치하는 내역만 검색 됩니다.</p>
            </div>
          </div>
          <!-- 상품ID -->
          <div class="content-flex">
            <div class="item-name">
              <p>상품 ID</p>
            </div>
            <div>
              <input type="text" class="form-control" placeholder="상품 ID를 입력해주세요" style="width: 300px;">
              <p class="item2-info">입력한 ID와 정확히 일치하는 내역만 검색 됩니다.</p>
            </div>
          </div>
          <!-- 리뷰 검색 버튼 -->
          <div style="text-align: right;"><input type="button" class="btn btn-primary" value="검색"></div>
        </form>
        <!-- 리뷰 검색 form 종료 --> 
      </div>

      <!-- 검색 결과 -->
      <div class="content">
        <p class="content-name">검색 결과 : 0 건</p>
        <div style="text-align: center;">
          <table class="table">
            <thead>
              <tr class="table-secondary">
                <th>회원ID</th>
                <th>리뷰컨텐츠</th>
                <th>별점</th>
                <th>리뷰내용</th>
                <th>리뷰작성일</th>
                <th>리뷰삭제</th> <!-- 리뷰 삭제를 누르면 해당 리뷰는 공개되지만 별점은 그대로 적용됨을 호스트에게 인지시켜야함 -->
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>user-1</td>
                <td><a href="#">[서핑] 원데이 클래스</a></td>
                <td>⭐⭐⭐⭐⭐</td>
                <td>재미났습니다 호호</td>
                <td>2023-04-14 00:00:00</td>
                <td>
                  <button class="btn btn-sm btn-primary">삭제</button>
                </td>
              </tr>
              <tr>
                <td colspan="6">검색 결과가 없습니다</td>
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
<!--footer 종료-->
</body>
</html>