<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="/css/bootstrap.journal.min.css">
  <link rel="stylesheet" href="/css/custom.min.css">
  <link rel="stylesheet" href="/css/hostInfo.css">
  <script src="/js/bootstrap.bundle.min.js"></script>
  <script src="/js/jquery-3.6.4.min.js"></script>
  <script src="/js/hostInfo.js"></script>
  <title>host_information</title>
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
          <a href="/host/info" style="text-decoration-line: none;"><span name="" style="padding-right: 20px;">${sessionScope.host_name}</span></a> <%--링크--%>
          <button type="button" class="btn btn-outline-primary btn-sm" onclick="location.href='/'">해빗 홈으로 이동</button>
          <button type="button" class="btn btn-secondary btn-sm" onclick="location.href='/host/logout'">로그아웃</button>
        </div>
      </div>
    </div>
  </nav>
  <hr>
  <!-- 네비 종료 -->

    <!-- 페이지 이름 -->
    <p class="page-name">프로필/정산정보 관리</p>
    
    <!-- main 시작 -->
    <form method="post" enctype="multipart/form-data" action="" onsubmit="return profileCheck()">
      <div class="content-wrap">
        <!-- 프로필 관리 -->
          <div class="content">
            <p class="content-name">프로필 관리</p>
            <!-- 프로필 관리 form 시작 -->
            <!-- 프로필 사진 -->
            <div class="content-flex">
              <div class="item-name">
                <p>프로필 사진</p>
              </div>
              <div class="item2">
                <div style="width: 100px; height: 100px;">
                  <img src="/storage/${hostInfo.host_img}" id="preview" alt="" width="100%" height="100%" style="border-radius: 100%; object-fit: cover;" class="proImg"><br><br>
                </div>
                <div>
                  <input class="form-control" type="file" name="Img" id="host_img" accept="image/*" onchange="setProfile(this)" >
                </div>
                <div>파일 용량 2MB 이하 jpg, png 로 첨부해주세요.</div>
                <div>
                  <div class="error_class hostImgError" style="display: none; color: red;"></div>
                </div>
              </div>
            </div>
            <hr>
            <!-- 호스트 명 -->
            <div class="content-flex">
              <div class="item-name">
                <p>호스트 명</p>
              </div>
              <div class="item2">
                <input type="text" class="form-control" id="host_name" name="host_name" placeholder="호스트 명을 입력해 주세요." value="${hostInfo.host_name}" maxlength=25 onchange="hostNameCheck()">
                <small style="display: none;color:red;" id="host_name_small">호스트 명을 입력해주세요.</small>
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
                <input type="text" class="form-control" name="host_email1" id="host_email"   placeholder="이메일을 입력해주세요."  style="width: 250px; display: inline-block;" onchange="hostEmailCheck()">@
                <select name="host_email2" id="hostEmail2"  class="form-control" style="width: 200px; display: inline-block; ">
                  <option value="0">=====선택=====</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="naver.com">naver.com</option>
                  <option value="daum.com">daum.com</option>
                  <option value="hanmail.com">hanmail.com</option>
                </select>
                <small style="display: none;color:red;" id="host_email_small">올바른 이메일 형식이 아닙니다.</small>
                <p class="item2-info">실제 사용하시는 이메일 주소를 입력해 주세요.<br>
                  해당 메일로 공지사항 및 상품 수정 요청 등 중요 알림이 발생됩니다.</p>
              </div>
            </div>
            <hr>
            <!-- 공개 연락처 -->
            <div class="content-flex">
              <div class="item-name">
                <p>공개 연락처</p>
              </div>
              <div class="item2">
                <input type="number" name="host_phone1" class="form-control" id="hostPhone1" style="width: 100px; display: inline-block;" oninput="checkLength()"> -
                <input type="number" name="host_phone2"  class="form-control" id="hostPhone2" style="width: 100px; display: inline-block;" oninput="checkLength()"> -
                <input type="number" name="host_phone3"  class="form-control" id="hostPhone3" style="width: 100px; display: inline-block;" oninput="checkLength()">
                <small style="display: none;color:red;" id="host_phone_error">올바른 전화번호 형식이 아닙니다.</small>
                <p class="item2-info">해빗 회원에게 노출되는 공개 연락처입니다.<br>
                  미입력 시 인증한 연락처가 노출됩니다.</p>
              </div>
            </div>
            <hr>
            <!-- 소개 -->
            <div class="content-flex">
              <div class="item-name">
                <p>소개</p>
              </div>
              <div class="item2">
                <textarea class="form-control " name="host_intro" id="host_intro" cols="30" rows="5" placeholder="간단한 소개와 약력을 입력해 주세요." style="resize: none;" onkeyup="countText(this)">${hostInfo.host_intro}</textarea>
                <p class="item2-info1" style="display: inline-block;">0</p>
                <p style="display: inline-block;">/200</p><!--글자수-->
                <small style="display: none;color:red;" id="host_intro_error">소개글을 5자 이상 입력해주세요.</small>
                <p>소개 예시보기</p>
                <p class="item2-info">해빗 회원에게 호스트님을 소개해 주세요.<br>
                  호스트님만의 개성을 담거나, 신뢰감을 줄 수 있는 전문적인 사항들을 입력하시면 좋습니다.</p><br>
                <p style="color: red; font-size: small;">
                  * 경력, 보유 자격증, 수상 이력, 대외 활동 등<br>
                  * 개인 연락처(전화번호, 카카오톡 ID, 개인 SNS, 홈페이지 등은 입력할 수 없습니다.
                </p>
              </div>
            </div>
          </div>

          <!-- 정산 관리 -->
          <div class="content">
            <p class="content-name">정산 관리</p>
            <!-- 수수료 -->
            <div class="content-flex">
              <div class="item-name">
                <p>수수료</p>
              </div>
              <div class="item2">
                <p>20%</p>
              </div>
            </div>
            <hr>
            <!-- 입금계좌 -->
            <div class="content-flex">
              <div class="item-name">
                <p>입금 계좌</p>
              </div>
              <div class="item2">
                <div>
                  <div>
                    <select name="host_bank" id="hostBank" class="form-select" style="width: 150px;">
                      <option value="0">==선택==</option>
                      <option value="해빗은행">해빗은행</option>
                      <option value="신한은행">신한은행</option>
                      <option value="카카오뱅크">카카오뱅크</option>
                    </select>
                  </div>
                  <small style="display: none;color:red;"  id="host_bank_error" >은행을 선택해주세요</small>
                </div>
                <div style="display: flex; flex-wrap: wrap;">
                  <div>
                    <input type="text" name="host_acholder" class="form-control" placeholder="예금주" style="width:150px;" value="${hostInfo.host_acholder}" id="host_acholder">
                    <small style="display: none;color:red;"  id="host_acholder_error" >예금주를 입력해주세요</small>
                  </div>
                  <div>
                    <input type="text" name="host_account" class="form-control" placeholder="계좌 번호를 입력해주세요." style="width:350px; margin: 0 15px;" value="${hostInfo.host_account}" oninput="checkAccount()" id="hostAccount">
                    <small style="display: none;color:red;"  id="host_account_error">계좌번호를 입력해주세요.</small>
                  </div>
                </div>
                <div>
                  <p class="item2-info">
                    - 사업자 계좌의 경우 대표자명과 업체명을 입력해주세요.<br>
                    - 공백 없이 최대 10글자를 입력해주세요.<br>
                    [작성 예시]<br>
                    사업자 등록증의 대표자명이 "김해빗" 이고, 업체명이 "주식회사 해빗브로커" 인 경우,<br>
                    아래와 같이 괄호 포함하여 정확히 10글자를 작성해주시기 바랍니다.<br>
                    - 예금주 : 김해빗(주)해빗브로
                  </p>
                </div>
                <div>
                  <p style="color: red; font-size: small;">정산계좌 변경 시 다음 정산부터 변경된 계좌로 정산됩니다.</p>
                </div>
              </div>
            </div>
          </div>
      </div>
      <div class="d-grid gap-2" style="margin: 20px 0 40px;">
        <input type="submit" class="btn btn-lg btn-outline-primary" value="내 정보 수정">
      </div>
    </form>
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
<script>

  <c:if test="${noAccount!=null}">
    alert("계좌정보를 입력하셔야 정산관리가 가능합니다.");
  </c:if>

  //은행 선택
  let bank="${hostInfo.host_bank}";
  if(bank!=""){
    $("#hostBank").val("${hostInfo.host_bank}").prop("selected", true);
  }

  //이메일 나누기
  let email="${hostInfo.host_email}";
  let find=email.indexOf("@");
  let email1=email.substring(0,find);
  let email2=email.substring(find+1,email.length);
  $("#host_email").val(email1);
  $("#hostEmail2").val(email2).prop("selected",true);



  //전화번호 나누기
  let phone="${hostInfo.host_phone}";

  let number = phone.indexOf('-');
  $("#hostPhone1").val(phone.substring(0,number));
  let number2= phone.indexOf('-',number+1);
  $("#hostPhone2").val(phone.substring(number+1,number2));
  let number3= phone.indexOf('-',number2);
  $("#hostPhone3").val(phone.substring(number3+1,phone.length));




</script>
</html>