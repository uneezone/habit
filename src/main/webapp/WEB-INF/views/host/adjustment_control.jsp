<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <script src="/js/hostadjust.js"></script>
  <title>해빗 호스트 어드민</title>
  <link rel="stylesheet" href="/css/hostadjust.css">
</head>

<body>
  <div class="container">
    <!-- 네비 시작 -->
    <nav class="navbar navbar-expand-lg bg-light" data-bs-theme="light">
      <div class="container-fluid">
        <a class="navbar-brand" href="/host"><img src="/img/logo (2).png" alt="HABIT" width="100px"></a> <%--링크--%>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor03">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a class="nav-link active" href="/host" style="font-size: larger;">호스트 관리 페이지</a> <%--링크--%>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">내 정보</a>
              <div class="dropdown-menu">
                <a class="dropdown-item"  href="/host/info">프로필/정산정보 관리</a> <%--링크--%>
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
                <a class="dropdown-item" href="/host/adjust">정산서 관리</a> <%--링크--%>
              </div>
            </li>
          </ul>
          <div>
            <a href="/host/info"><img src="/storage/${sessionScope.host_img}" alt="" width="50px" height="50px" style="border-radius: 100%; margin: 0 10px;"></a> <%--링크--%>
            <a href="/host/info" style="text-decoration-line: none;"><span name="" style="padding-right: 20px;">${sessionScope.s_name}</span></a> <%--링크--%>
            <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='/'">해빗 홈으로 이동</button>
            <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/host/logout'">로그아웃</button>
          </div>
        </div>
      </div>
    </nav>
    <hr>
    <!-- 네비 종료 -->

    <!-- 페이지 이름 -->
    <p class="page-name">정산서 관리</p>

    <!-- main 시작 -->
    <div class="content-wrap">
      <!-- 정산서 조회 -->
      <div class="content">
        <p class="content-name">정산서 조회</p>
        <div class="content-flex">
          <div class="item-name">
            <p>조회기간</p>
          </div>
          <!-- 정산서 조회 form 시작 -->
          <form method="GET" action="/host/adjust" onsubmit="return checkFiltering()">
            <!-- 조회 기간 -->
            <div class="item">
              <div>
                <select name="cont_date" id="cont_date" style="width: 150px;" class="form-select">
                  <option value="cont_no">선택</option>
                  <option value="cont_stdate" id="cont_stdate">판매시작일</option>
                  <option value="cont_endate" id="cont_endate">판매종료일</option>
                </select>
              </div>
              <div style="display: flex;">
                <input type="date" class="form-control" name="start_date" id="startDate" > &nbsp;~&nbsp; <input type="date" class="form-control" name="end_date" id="endDate">
              </div>
              <div class="btn-group" role="group" aria-label="Basic radio toggle button group" style="display: flex; align-items: center; justify-content: center;">
                <input type="radio" class="btn-check dateBtn" name="btnradio" id="btnradio1" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio1">오늘</label>
                <input type="radio" class="btn-check dateBtn" name="btnradio" id="btnradio2" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio2">1개월</label>
                <input type="radio" class="btn-check dateBtn" name="btnradio" id="btnradio3" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio3">6개월</label>
                <input type="radio" class="btn-check dateBtn" name="btnradio" id="btnradio4" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio4">&nbsp;1년&nbsp;</label>
                <input type="radio" class="btn-check dateBtn" name="btnradio" id="btnradio5" autocomplete="off">
                <label class="btn btn-sm btn-outline-primary" for="btnradio5">&nbsp;5년&nbsp;</label>
                <input type="radio" class="btn-check dateBtn" name="btnradio" id="btnradio6" autocomplete="off" checked>
                <label class="btn btn-sm btn-outline-primary" for="btnradio6">전체</label>
              </div>
            </div>
            <div>
              <div>
                <input type="submit" class="btn btn-primary" value="검색">
                <input type="reset" class="btn btn-outline-primary" value="초기화">
              </div>
            </div>
          </form>
          <script>
            console.log('${searchAdjust}');
            //날짜 포맷바꾸기
              let startDate='${searchAdjust.start_date}';
              let endDate='${searchAdjust.end_date}';
              startDate=startDate.replaceAll(".","-");
              endDate=endDate.replaceAll(".","-")

              $("#startDate").val(startDate);
              $("#endDate").val(endDate);

            //옵션선택
            let date='${searchAdjust.cont_date}';

              if(date=='cont_stdate'||date=='cont_endate'){
                $("#cont_date").val("${searchAdjust.cont_date}").prop("selected",true);
              }else if(date==='cont_no'){

                $("#cont_date").val("cont_no").prop("selected",true);
              }


          </script>
          <!-- 정산서 조회 form 종료 -->
        </div>
      </div>

      <!-- 검색 결과 -->
      <div class="content">
        <div style="display: flex; justify-content: space-between; margin-bottom: 20px;">
          <p class="content-name">검색 결과 : ${pagingMap.listLength} 건</p>
          <button class="btn btn-sm btn-primary" onclick="changeStatus()">지급 요청</button>
        </div>
        <div style="text-align: center;">
          <table class="table">
            <thead>
              <tr class="table-secondary">
                <th></th>
                <th>정산기간(판매기간)</th>
                <th>정산서 제목</th>
                <th style="width:100px; ">총 합산액</th>
                <th style="width:100px; ">총 수수료(20%)</th>
                <th style="width:140px; ">총 지급액<span style="font-size: 12px; display: block;">(총 합산액-총 수수료)</span></th>
                <th>등록일</th>
                <th>지급상태</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${adjustList}" var="adjust" varStatus="status">
                <tr onclick="showDetail('${adjust.calc_no}',this)" class="adjust-line">
                  <td onclick="event.stopPropagation()"><input class="form-check-input checkBtn" type="checkbox" value="${adjust.calc_no}" name="money" id="checkBtn${status.index}"></td>
                  <td>${adjust.calc_date}</td>
                  <td>${adjust.calc_title} 정산총액</td>
                  <td><fmt:formatNumber value="${adjust.calc_ttlprice}" pattern="#,###"/> 원</td>
                  <td><fmt:formatNumber value="${adjust.calc_fee}" pattern="#,###"/> 원</td>
                  <td>
                    <c:set var="price" value="${adjust.calc_ttlprice-adjust.calc_fee}"/>
                    <fmt:formatNumber value="${price}" pattern="#,###"/> 원
                  </td>
                  <td>${adjust.calc_addate}</td>
                  <td  class="checkBtn${status.index}">
                    <script>
                        if('${adjust.calc_status}'==="Y") {
                          $("#checkBtn${status.index}").attr("disabled",true);
                          document.write("지급완료");
                        }else{
                          document.write("지급대기");
                        }
                    </script>
                  </td>
                </tr>
              </c:forEach>
              <c:if test="${adjustList.size()==0}">
              <tr>
                <td colspan="7">검색 결과가 없습니다</td>
              </tr>
              </c:if>
            </tbody>
          </table>

          <div class="show-modal">
            <div class="show-detail">
              <div class="show-detail-con">
                <div class="close-modal">X</div>
                <div class="show-detail-wrapper1">
                  <div class="detail-sub1">정산서 상세</div>
                  <div class="detail-sub2"><span class="detail-sub2-name">정산상세코드</span> <span style="font-weight: 600;" class="adjust-no"></span></div>
                  <div class="detail-sub2"><span class="detail-sub2-name">정산서 제목</span> <span style="font-weight: 600;" class="adjust-name"></span></div>
                  <div class="detail-sub2"><span class="detail-sub2-name">판매 기간 </span><span style="font-weight: 600;" class="adjust-date"></span></div>
                </div>
                <div class="show-detail-wrapper2">
                  <div style="overflow: auto; height: 400px;">
                    <table class="table">
                      <thead>
                       <tr class="table-secondary">
                         <th>옵션명</th>
                         <th>가격</th>
                         <th>수량</th>
                         <th>결제상태</th>
                         <th>결제날짜</th>
                       </tr>
                      </thead>
                      <tbody class="detail-content">

                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="show-detail-wrapper3">
                  <div class="detail-sub2"><span class="detail-sub3-name">총 합액</span><span style="font-weight: 600;" class="ttlprice"></span></div>
                  <div class="detail-sub2"><span class="detail-sub3-name">총 수수료(20%)</span> <span style="font-weight: 600;" class="comprice"></span></div>
                  <hr>
                  <div class="detail-sub2"><span class="detail-sub3-name">총 정산액</span> <span style="font-weight: 600;" class="adjustprice"></span></div>
                </div>
                <div class="show-detail-wrapper3">
                  <div class="detail-sub2"><span class="detail-sub4-name">정산계좌</span></div>
                  <div class="detail-sub2"><span class="detail-sub3-name">은행</span><span style="font-weight: 600;" class="bankName"></span></div>
                  <div class="detail-sub2"><span class="detail-sub3-name">예금주</span><span style="font-weight: 600;" class="acholName"></span></div>
                  <div class="detail-sub2"><span class="detail-sub3-name">계좌번호</span><span style="font-weight: 600;" class="accountNum"></span></div>
                </div>
              </div>
            </div>
          </div>

        </div>
        <!-- 페이징 -->
        <div style="display: flex; align-items: center; justify-content: center;">
          <ul class="pagination">
            <li class="page-item page-way ">
              <a class="page-link" id="pagePrev" >&laquo;</a>
            </li>
            <c:forEach begin="1" end="${pagingMap.index}" varStatus="status">
              <li class="page-item page-num" style="display: none;">
                <a class="page-link page index_page_btn" id="page${status.index}">${status.index}</a>
              </li>
            </c:forEach>
            <li class="page-item page-way ">
              <a class="page-link" id="pageNext" >&raquo;</a>
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