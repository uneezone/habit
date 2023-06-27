<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/bootstrap.journal.min.css">
  <link rel="stylesheet" href="/css/custom.min.css">
  <link rel="stylesheet" href="/css/productCon.css">
  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/jquery-3.6.4.min.js"></script>
  <script src="/js/host_product.js"></script>
  <title>content_product_control</title>
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
    <p class="page-name">판매 관리</p>

    <!-- main 시작 -->
    <div class="content-wrap">
      <div class="content">
        <!-- 판매조회 -->
        <p class="content-name">판매 조회</p>
        <!-- 판매 조회 form 시작 -->
        <form method="get" action="/host/product" onsubmit="checkFiltering()">
          <!-- 검색어 -->
          <div class="content-flex" style="margin-top: 30px;">
            <div class="item-name" style="display: block;">
              <p>등록한 해빗 검색</p>
            </div>
            <div class="item">
              <div>
                <select name="cont_no" id="productName" style="width: 400px;" class="form-select" onchange="showOption()">
                  <option value="0">선택</option>
                  <c:forEach items="${productNames}" var="pname">
                    <fmt:formatDate value="${pname.cont_endate}" var="endDate" pattern="yyyy-MM-dd"/>
                    <option value="${pname.cont_no}">${pname.cont_name} (판매종료일 : ${endDate} )</option>

                  </c:forEach>
                </select>
              </div>
              <div>
                <select name="pro_no" id="productOption" style="width: 150px;" class="form-select">
                  <option value="0">선택</option>
                </select>
              </div>
            </div>
          </div>
          <!--유저아이디 기준 검색-->
          <div class="content-flex" style="margin-top: 30px;">
            <div class="item-name">
              <p>회원ID</p>
            </div>
            <div>
              <input type="text" name="user_id" id="user_id" class="form-control" style="width: 320px;" placeholder="검색하실 회원아이디를 입력해주세요">
            </div>
          </div>

          <!-- 상태기준-->
          <div class="content-flex" style="margin-top: 30px;">
            <div class="item-name">
              <p>상태</p>
            </div>
            <div class="item">
              <div>
                <select name="payd_status" id="productStatus" style="width: 150px;" class="form-select">
                  <option value="0">선택</option>
                  <option value="R">사용중</option>
                  <option value="Y">사용완료</option>
                  <option value="C">취소완료</option>
                </select>
              </div>
            </div>
          </div>
          <!-- 조회기간 -->
          <div class="content-flex" style="margin-top: 30px;">
            <div class="item-name">
              <p>조회기간 (결제일 기준)</p>
            </div>
            <div class="item">
              <div style="display: flex;">
                <input type="date" class="form-control" id="startDate" name="startDate"> &nbsp;~&nbsp; <input type="date" class="form-control" id="endDate" name="endDate">
              </div>
              <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
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
          </div>
          <script>

            //필터링한 조건들 넣기
            //console.log(filter);
            if("${searchFilter.cont_no}"!=null &&"${searchFilter.cont_no}"!=0 ){
              $("#productName").val("${searchFilter.cont_no}").prop("selected",true);
              showOption();
            }

            if("${searchFilter.pro_no}"!=null && "${searchFilter.pro_no}"!=0 ){
              $("#productOption").val("${searchFilter.pro_no}").prop("selected",true);
            }

            if("${searchFilter.user_id}"!=null && "${searchFilter.user_id}"!=""){
              $("#user_id").val("${searchFilter.user_id}");
            }

            if("${searchFilter.payd_status}"!=null && "${searchFilter.payd_status}"!=0){
              $("#productStatus").val("${searchFilter.payd_status}").prop("selected",true);
            }

            if("${searchFilter.startDate}"!=null &&"${searchFilter.startDate}"!=""){
              $("#startDate").val("${searchFilter.startDate}");
            }

            if("${searchFilter.endDate}"!=null &&"${searchFilter.endDate}"!=""){
              $("#endDate").val("${searchFilter.endDate}");
            }
          </script>

          <div style="float: right;">
            <input type="submit" class="btn btn-primary" value="검색">
            <input type="reset" class="btn btn-outline-primary" value="초기화">
          </div>
        </form>
        <!-- 판매 조회 form 종료 -->
      </div>
    </div>

    <!-- 검색 결과 -->
    <div class="content-wrap">
      <div class="content">
        <p class="content-name">검색 결과 : <span>${searchFilter.allProductsLength}</span> 건</p>
        <div style="text-align: center;">
          <table class="table">
            <thead>
              <tr class="table-secondary">
                <th>회원ID</th>
                <th>결제일</th>
                <th>상품명/옵션명</th>
                <th>수량</th>
                <th>결제금액</th>
                <th>상태</th>
                <th>판매관리</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${products}" var="product" varStatus="status">
                <tr>
                <td onclick="showUserInfo(this)" class="user_td">${product.user_id}</td>
                <td>${product.payd_date}</td>
                <td>${product.cont_name}/${product.prod_name}</td>
                <td>${product.payd_qty}</td>
                <td>
                    <c:set var="total" value="${product.payd_price*product.payd_qty}"/>
                    <fmt:formatNumber value="${total}" pattern="#,###"/>원
                </td>
                <td>
                  <script>
                    window.addEventListener('load', function() {


                        $.ajax({
                          type:"GET"
                          ,url:"/host/checkAdjustForProCon"
                          ,data:{"payd_no":${product.payd_no}}
                          ,async:false
                          ,success:function (data){
                            //console.log(data);
                            if(data=="AdjustOK"){
                              $("#pstatus option[value='C']").remove();
                            }
                          }
                        })

                        $(".pstatus").eq("${status.index}").val('${product.payd_status}').prop("selected",true);

                    });
                  </script>
                  <select class="form-select pstatus" id="pstatus" name="status_pro" id="staus${product.payd_no}">
                    <option value="R">사용중</option>
                    <option value="Y">사용완료</option>
                    <option value="C">취소완료</option>
                  </select>
                </td>
                <td>
                  <script>
                    window.addEventListener('load', function() {

                      //console.log($(".pstatus").eq("${status.index}").val());
                      let pstatus=$(".pstatus").eq("${status.index}").val();
                      if(pstatus=="C"||pstatus=="Y"){

                        $(".use").eq("${status.index}").attr("disabled",true);
                        $(".use").eq("${status.index}").css("background-color","gray");
                        $(".use").eq("${status.index}").css("border","none");
                        $(".pstatus").eq("${status.index}").attr("disabled",true);
                      }

                    });
                  </script>
                  <input type="button" value="상태처리" class="btn btn-sm btn-primary use" onclick="changeStatus('${product.payd_no}')">
                </td>
                </tr>
              </c:forEach>
              <c:if test="${products.size()==0}">
                <tr>
                  <td colspan="7">검색 결과가 없습니다</td>
                </tr>
              </c:if>
            </tbody>
          </table>
        </div>

        <!-- 페이징 -->
        <div style="display: flex; align-items: center; justify-content: center;">
          <ul class="pagination">
            <li class="page-item page-way ">
              <a class="page-link" id="pagePrev" >&laquo;</a>
            </li>
            <c:forEach begin="1" end="${searchFilter.pagingIndex}" varStatus="status">
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

<!-- 회원 정보 모달 -->
<div class="show_userInfo">
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