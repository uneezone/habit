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
  <script src="/js/habit_create.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- 썸머 노트 사용을 위한 js, css 추가 시작 -->
  <script src="/js/summernote/summernote-lite.min.js"></script>
  <script src="/js/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="/css/summernote/summernote-lite.min.css">
  <!-- 썸머 노트 js, css 추가 종료 -->
  <title>content_create</title>
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
    <p class="page-name">해빗 등록</p>

    <!-- main 시작 -->
    <form method="" action="" onsubmit="">
      <!-- 기본 정보 -->
      <div class="content-wrap">
        <div class="content">
          <p class="content-name">기본 정보</p>
          <div class="content-flex">
            <div class="item-name">
              <p>카테고리</p>
            </div>
            <div class="content-flex">
              <div style="width: 150px; margin-right: 10px;">
                <select name="" id="" class="form-select">
                  <option value="">대분류</option>
                </select>
              </div>
              <div style="width: 150px;">
                <select name="" id="" class="form-select">
                  <option value="">중분류</option>
                </select>
              </div>
            </div>
          </div><hr>
          <div class="content-flex">
            <div class="item-name">
              <p>해빗명</p>
            </div>
            <div>
              <div style="width: 450px;"> 
                <input type="text" class="form-control" id="cont_name" name="cont_name" placeholder="해빗명을 입력해주세요" onchange="contNameCheck()">
              </div>
              <div>
                <small hidden id="cont_name_small">해빗명은 필수입니다. 40자 이내로 입력해주세요.</small>
              </div>
              <div>
                <p style="color: gray;">해빗의 특징이 잘 드러나도록 해빗명을 입력해주세요.</p>
              </div>
            </div>
          </div><hr>
          <div class="content-flex">
            <div class="item-name">
              <p>진행장소</p>
            </div>
            <div>
              <div class="item">
                <div>
                  <input class="form-control" type="text" id="zipcode" name="cont_zip" placeholder="우편번호" disabled>
                </div>
                <div>
                  <input class="btn btn-outline-primary" type="button" onclick="DaumPostcode()" value="주소 찾기">
                </div>
              </div>
              <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
              </div>
              <div>
                <div>
                  <input class="form-control" type="text" id="address1" name="cont_addr1" placeholder="주소" disabled>
                </div>
              </div>
              <div>
                <div>
                  <input class="form-control" type="text" id="address2" name="cont_addr2" placeholder="나머지 주소를 입력해주세요">
                </div>
                <div>
                  <input class="form-control" type="text" id="sample3_extraAddress" name="cont_extaAddr" placeholder="참고항목" disabled>
                </div>
                <div>
                  <small hidden id="cont_place_small">해빗명은 필수입니다. 40자 이내로 입력해주세요.</small>
                </div>
              </div>
            </div>
          </div><hr>
          <div class="content-flex">
            <div class="item-name">
              <p>해시태그</p>
            </div>
            <div>
              <p style="color: gray;">해빗 이용자들에게 해시태그로 보여질 정보입니다.<br> 해당되는 정보를 선택해 주세요.</p>
            </div>
            <div>
              <div class="item">
                <div class="item-name-sm">
                  <p>클래스 참여에 적합한 성별</p>
                </div>
                <div class="checkbox">
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="cont_hashtag1" id="hashtag1-1" value="option1">
                    <label class="form-check-label" for="hashtag1-1">
                      남자
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="cont_hashtag1" id="hashtag1-2" value="option1">
                    <label class="form-check-label" for="hashtag1-2">
                      여자
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="cont_hashtag1" id="hashtag1-3" value="option1">
                    <label class="form-check-label" for="hashtag1-3">
                      상관없음
                    </label>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="item-name-sm">
                  <p>클래스 참여에 적합한 나이대 (다중선택 가능)</p>
                </div>
                <div class="checkbox">
                  <div>
                    <input class="form-check-input" type="checkbox" value="" id="hashtag2-1">
                    <label class="form-check-label" for="hashtag2-1">
                      20대
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="checkbox" value="" id="hashtag2-2">
                    <label class="form-check-label" for="hashtag2-2">
                      30대
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="checkbox" value="" id="hashtag2-3">
                    <label class="form-check-label" for="hashtag2-3">
                      40대
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="checkbox" value="" id="hashtag2-4">
                    <label class="form-check-label" for="hashtag2-4">
                      50대 이상
                    </label>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="item-name-sm">
                  <p>클래스 활동 범위</p>
                </div>
                <div class="checkbox">
                  <div>
                    <input class="form-check-input" type="radio" name="cont_hashtag2" id="hashtag3-1">
                    <label class="form-check-label" for="hashtag3-1">
                      실내 활동
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="radio" name="cont_hashtag2" id="hashtag3-2">
                    <label class="form-check-label" for="hashtag3-2">
                      실외 활동
                    </label>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="item-name-sm">
                  <p>함께하기 좋은 멤버 (다중선택 가능)</p>
                </div>
                <div class="checkbox">
                  <div>
                    <input class="form-check-input" type="checkbox" value="" id="hashtag4-1">
                    <label class="form-check-label" for="hashtag4-1">
                      연인과 함께
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="checkbox" value="" id="hashtag4-2">
                    <label class="form-check-label" for="hashtag4-2">
                      친구와 함께
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="checkbox" value="" id="hashtag4-3">
                    <label class="form-check-label" for="hashtag4-3">
                      혼자
                    </label>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="item-name-sm">
                  <p>개설 클래스 평균 금액대</p>
                </div>
                <div class="checkbox">
                  <div>
                    <input class="form-check-input" type="radio" name="cont_hashtag5" id="hashtag5-1">
                    <label class="form-check-label" for="hashtag5-1">
                      3만원 이하
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="radio" name="cont_hashtag5" id="hashtag5-2">
                    <label class="form-check-label" for="hashtag5-2">
                      3만원 ~ 5만원
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="radio" name="cont_hashtag5" id="hashtag5-3">
                    <label class="form-check-label" for="hashtag5-3">
                      5만원 ~ 7만원
                    </label>
                  </div>
                  <div>
                    <input class="form-check-input" type="radio" name="cont_hashtag5" id="hashtag5-4">
                    <label class="form-check-label" for="hashtag5-4">
                      7만원 이상
                    </label>
                  </div>
                </div>
              </div>
            </div>
            </div>
          </div>
          
        <!-- 판매 정보 -->
        <div class="content">
          <p class="content-name">판매 정보</p>
          <div class="content-flex">
            <div class="item-name">
              <p>판매 종료일</p>
            </div>
            <div>
              <div>
                판매 시작일로부터 (해빗 게시일)
              </div>
              <div class="item" style="align-items: center;">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="cont_endate" id="cont_endate_option1" value="endate_option1" checked onchange="contEndateOptionCheck1()">
                  <label class="form-check-label" for="cont_endate_option1">
                    한달(기본)
                  </label>
                </div>
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="cont_endate" id="cont_endate_option2" value="endate_option2" onchange="contEndateOptionCheck2()">
                  <label class="form-check-label" for="cont_endate_option2">지정한 날짜까지 판매</label>
                </div>
                <div>
                  <input class="form-control" type="date" name="cont_endate_option2" id="endate_option2" disabled>
                </div>
              </div>
            </div>
          </div><hr>
          <div class="content-flex">
            <div class="item-name">
              <p>판매 유형</p>
            </div>
            <div style="display: flex;">
              <div class="select">
                <input type="radio" id="prod" name="pro" checked>
                <label for="prod">
                  <p>날짜 조율형</p>
                  호스트님이 회원 연락처로 별도 연락하여 일정을 조율하는 형태의 해빗입니다. (에스테틱, 네일 등에 적합)
                </label>
              </div>
              <div class="select">
                <input type="radio" id="one" name="pro">
                <label for="one">
                  <p>날짜 지정형</p>
                  호스트님께서 날짜와 옵션을 등록하여 가능한 날에만 예약을 받을 수 있는 해빗입니다. 일정 관리 및 고객 관리를 더 간편하게 하실 수 있습니다. (에스테틱, 네일 제외한 대부분의 해빗)
                </label>
              </div>
            </div>
          </div><hr>
          <div class="content-flex">
            <div class="item-name">
              <p>옵션 목록 입력</p>
            </div>

            <!-- 콘텐츠 옵션 : 인원권/회차권 시작 -->
            <div id="cont_option_prod">
              <div style="text-align: right;">
                <input type="button" class="btn btn-sm btn-primary" id="option_remove_prod" value="옵션 삭제">
              </div>
              <div>
                <table class="table table-hover" style="text-align: center;">
                  <thead>
                    <tr class="table-secondary">
                      <th></th>
                      <th>(예시) 인원,사이즈 등</th>
                      <th>(예시) 1인,2인,3인 등</th>
                      <th>가격</th>
                    </tr>
                    <tr>
                      <td></td>
                      <td>
                        <div>
                          <input type="text" class="form-control">
                        </div>
                      </td>
                      <td>
                        <div>
                          <input type="text" class="form-control">
                        </div>
                      </td>
                      <td>
                        <div class="input-group mb-2">
                          <span class="input-group-text">판매가</span>
                          <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                          <span class="input-group-text">원</span>
                        </div>
                      </td>
                    </tr>
                  </thead>
                  <!-- 옵션목록 추가 태그 시작 -->
                  <tbody id="option_row_prod">
                  </tbody>
                  <!-- 옵션목록 추가 태그 종료 -->
                    <tr id="add_option_prod">
                      <td colspan="4" align="center" class="table-secondary">
                        <div>+옵션 추가</div>
                      </td>
                    </tr>
                </table>
              </div>
            </div>
            <!-- 콘텐츠 옵션 : 인원권/회차권 종료 -->

            <!-- 콘텐츠 옵션 : 원데이 클래스 시작 -->
            <div id="cont_option_one" hidden>
              <div style="text-align: right;">
                <input type="button" class="btn btn-sm btn-primary" id="option_remove_one" value="옵션 삭제">
              </div>
              <div>
                <table class="table table-hover" style="text-align: center;">
                  <thead>
                    <tr class="table-secondary">
                      <th></th>
                      <th>(예시) 클래스 실행 날짜</th>
                      <th>(예시) 1인,2인,3인 등</th>
                      <th>가격</th>
                    </tr>
                    <tr>
                      <td></td>
                      <td>
                        <div>
                          <input type="text" class="form-control">
                        </div>
                      </td>
                      <td>
                        <div>
                          <input type="text" class="form-control">
                        </div>
                      </td>
                      <td>
                        <div class="input-group mb-2">
                          <span class="input-group-text">판매가</span>
                          <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
                          <span class="input-group-text">원</span>
                        </div>
                      </td>
                    </tr>
                  </thead>
                  <!-- 옵션목록 추가 태그 시작 -->
                  <tbody id="option_row_one">
                  </tbody>
                  <!-- 옵션목록 추가 태그 종료 -->
                    <tr id="add_option_one">
                      <td colspan="4" align="center" class="table-secondary">
                        <div>+옵션 추가</div>
                      </td>
                    </tr>
                </table>
              </div>
            </div>
            <!-- 콘텐츠 옵션 : 원데이 클래스 종료 -->
            
          </div>
        </div>
        
        <!-- 프립 설명 -->
        <div class="content">
          <p class="content-name">해빗 설명</p>
          <div class="content-flex">
            <div class="item-name">
              <p>대표 이미지</p>
            </div>
            <div>
              <div class="item">
                <div>
                  <img src="/img/no-image01.gif" id="preview_cont_img1" alt="이미지 없음" width="200px" height="200px">
                </div>
                <div>
                  <img src="/img/no-image01.gif" id="preview_cont_img2" alt="이미지 없음" width="200px" height="200px">
                </div>
                <div>
                  <img src="/img/no-image01.gif" id="preview_cont_img3" alt="이미지 없음" width="200px" height="200px">
                </div>
              </div>
              <div class="input-img">
                <small hidden id="cont_img_small">이미지 파일은 3개까지 첨부 가능합니다.</small><br>
                <label for="cont_img" class="btn btn-outline-primary">이미지 추가하기</label>
                <input type="file" id="cont_img" class="form-control" accept="image/*" onchange="contImgCheck(this)" multiple>
              </div>
            </div>
          </div><hr>

          <div class="content-flex">
            <div class="item-name">
              <p>해빗 상세 설명</p>
            </div>
          <!-- 썸머노트 사용 textarea -->
            <div>
              <textarea id="summernote" name="editordata"></textarea>
            </div>
          </div>
        </div>

        <!-- 환불 규정 -->
        <div class="content">
          <p class="content-name">환불 규정</p>
          <div style="display: flex; justify-content: center;">
            <div style="width: 80%;">
              <textarea class="form-control" name="" id="" rows="9" cols="80" style="resize: none; color: rgb(129, 129, 129);" disabled>
1. 결제 후 14일 이내 취소 시 : 전액 환불
(단, 결제 후 14일 이내라도 호스트와 해빗 진행일 예약 확정 후 환불 불가)
2. 결제 후 14일 이후 취소 시 : 환불 불가
※ 상품의 유효기간 만료 시 연장은 불가하며, 기간 내 호스트와 예약 확정 되지 않은 해빗은 해빗 에너지로 환불 됩니다.
※ 환불된 에너지의 유효기간은 지급일로부터 180일이며, 유효기간 종료 후 기간연장 및 환불이 불가합니다.
※ 배송상품의 경우 배송 준비 전 전액 환불 가능, 배송 준비 후 환불 불가 합니다.
※ 다회권의 경우, 1회라도 사용시 부분 환불이 불가하며, 기간 내 호스트와 예약 확정 되지 않은 해빗은 해빗 에너지로 환불 됩니다.

[환불 신청 방법]
1. 해당 해빗 결제한 계정으로 로그인
2. 마이해빗 - 신청내역 or 결제내역
              </textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="d-grid gap-2" style="margin: 20px 0 40px;">
        <input type="submit" class="btn btn-lg btn-outline-primary" value="프립 등록">
      </div>
    </form>
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

<script>
  /* 카카오 우편번호 찾기 */
// 우편번호 찾기 찾기 화면을 넣을 element
var element_wrap = document.getElementById('wrap');

function foldDaumPostcode() {
    // iframe을 넣은 element를 안보이게 한다.
    element_wrap.style.display = 'none';
}

function DaumPostcode() {
    // 현재 scroll 위치를 저장해놓는다.
    var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    new daum.Postcode({
        oncomplete: function(data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample3_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample3_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();

            // iframe을 넣은 element를 안보이게 한다.
            // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
            element_wrap.style.display = 'none';

            // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
            document.body.scrollTop = currentScroll;
        },
        // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
        onresize : function(size) {
            element_wrap.style.height = size.height+'px';
        },
        width : '100%',
        height : '100%'
    }).embed(element_wrap);

    // iframe을 넣은 element를 보이게 한다.
    element_wrap.style.display = 'block';
}
</script>
</body>
</html>