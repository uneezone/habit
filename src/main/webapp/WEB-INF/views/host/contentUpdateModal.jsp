<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="/js/host/contentUpdateModal.js"></script>
<!-- 썸머 노트 사용을 위한 js, css 추가 시작 -->
<script src="/js/summernote/summernote-lite.min.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.min.css">
<!-- 썸머 노트 js, css 추가 종료 -->
<%-- update modal 시작 --%>
<div class="update-modal">
  <div class="update-modal-body">
    <div id="update-modal-close">
      <img src="/img/pngfind.com-close-icon-png-905672.png" width="30px">
    </div>
    <div class="container">
      <!-- 페이지 이름 -->
      <p class="page-name">해빗 수정</p>

      <!-- main 시작 -->
      <form method="post" id="updateform" onsubmit="return habitCreateCheck()" enctype="multipart/form-data">
        <!-- 기본 정보 -->
        <div class="content-wrap">
          <div class="content">
            <p class="content-name">기본 정보</p>
            <div class="content-flex">
              <div class="item-name">
                <p>카테고리</p>
              </div>
              <div>
                <div class="content-flex">
                  <div style="width: 200px; margin-right: 10px;">
                    <select name="cate_large" id="cate_large" class="form-select">
                      <option value="0">1차 카테고리</option>
                    </select>
                  </div>
                  <div style="width: 200px;">
                    <select name="cate_middle" id="cate_middle" class="form-select">
                    </select>
                  </div>
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
                  <p class="item2-info" hidden id="cont_name_small" style="color: gray;">해빗명은 필수입니다. 40자 이내로 입력해주세요.</p>
                </div>
                <div>
                  <p class="item2-info" style="color: gray;">해빗의 특징이 잘 드러나도록 해빗명을 입력해주세요.</p>
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
                    <input class="form-control" type="text" id="zipcode" name="cont_zip" placeholder="우편번호" readonly>
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
                    <input class="form-control" type="text" id="address1" name="cont_addr1" placeholder="주소" readonly>
                  </div>
                </div>
                <div>
                  <div>
                    <input class="form-control" type="text" id="address2" name="cont_addr2" placeholder="나머지 주소를 입력해주세요">
                  </div>
                  <div>
                    <input class="form-control" type="text" id="sample3_extraAddress" name="cont_extaddr" placeholder="참고항목" readonly>
                  </div>
                </div>
              </div>
            </div><hr>
            <div class="content-flex">
              <div class="item-name">
                <p>해시태그</p>
              </div>
              <div>
                <p class="item2-info" style="color: gray;">해빗 이용자들에게 해시태그로 보여질 정보입니다.<br> 해당되는 정보를 선택해 주세요.</p>
              </div>
              <div>
                <div class="item">
                  <div class="item-name-sm">
                    <p>클래스 참여에 적합한 성별</p>
                  </div>
                  <div class="checkbox">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="cont_hashtag1" id="hashtag1-1" value="M">
                      <label class="form-check-label" for="hashtag1-1">
                        남자
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="cont_hashtag1" id="hashtag1-2" value="W">
                      <label class="form-check-label" for="hashtag1-2">
                        여자
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" name="cont_hashtag1" id="hashtag1-3" value="N">
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
                      <input class="form-check-input" type="checkbox" name="cont_hashtag2" id="hashtag2-1" value="20">
                      <label class="form-check-label" for="hashtag2-1">
                        20대
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="checkbox" name="cont_hashtag2" id="hashtag2-2" value="30">
                      <label class="form-check-label" for="hashtag2-2">
                        30대
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="checkbox" name="cont_hashtag2" id="hashtag2-3" value="40">
                      <label class="form-check-label" for="hashtag2-3">
                        40대
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="checkbox" name="cont_hashtag2" id="hashtag2-4" value="50">
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
                      <input class="form-check-input" type="radio" name="cont_hashtag3" id="hashtag3-1" value="IN">
                      <label class="form-check-label" for="hashtag3-1">
                        실내 활동
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="radio" name="cont_hashtag3" id="hashtag3-2" value="OUT">
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
                      <input class="form-check-input" type="checkbox" value="WC" name="cont_hashtag4" id="hashtag4-1">
                      <label class="form-check-label" for="hashtag4-1">
                        연인과 함께
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="checkbox" value="WF" name="cont_hashtag4" id="hashtag4-2">
                      <label class="form-check-label" for="hashtag4-2">
                        친구와 함께
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="checkbox" value="WA" name="cont_hashtag4" id="hashtag4-3">
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
                      <input class="form-check-input" type="radio" name="cont_hashtag5" id="hashtag5-1" value="P3">
                      <label class="form-check-label" for="hashtag5-1">
                        3만원 미만
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="radio" name="cont_hashtag5" id="hashtag5-2" value="P5">
                      <label class="form-check-label" for="hashtag5-2">
                        3만원 ~ 5만원 미만
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="radio" name="cont_hashtag5" id="hashtag5-3" value="P7">
                      <label class="form-check-label" for="hashtag5-3">
                        5만원 ~ 7만원 미만
                      </label>
                    </div>
                    <div>
                      <input class="form-check-input" type="radio" name="cont_hashtag5" id="hashtag5-4" value="PP">
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
                <div class="item" style="align-items: center;">
                  <div id="stdate">
                  </div>
                  <div>
                    <input class="form-control" type="date" name="cont_endate" id="endate_option2">
                  </div>
                </div>
                <div>
                  <p class="item2-info" style="color: gray;">해빗 최소 판매 기간은 일주일 입니다.</p>
                </div>
              </div>
            </div><hr>
            <div class="content-flex">
              <div class="item-name">
                <p>판매 유형</p>
              </div>
              <div style="display: flex; align-items: center; justify-content: space-around;">
                <div id="prod" class="select" style="flex: 1; display: none; flex-direction: column; align-items: center; justify-content: center">
                  <input type="radio" id="type-prod" name="cont_type" value="prod" checked>
                  <label for="type-prod" style="height: 100%; min-height: 170px; display: flex; flex-direction: column; align-items: center; justify-content: center">
                    <p>날짜 조율형</p>
                    <p>호스트님이 회원 연락처로 별도 연락하여 일정을 조율하는 형태의 해빗입니다. (에스테틱, 네일 등에 적합)</p>
                  </label>
                </div>
                <div id="one" class="select" style="flex: 1; display: none; flex-direction: column; align-items: center; justify-content: center">
                  <input type="radio" id="type-one" name="cont_type" value="one" checked>
                  <label for="type-one" style="height: 100%; min-height: 170px; display: flex; flex-direction: column; align-items: center; justify-content: center">
                    <p>날짜 지정형</p>
                    <p>호스트님께서 날짜와 옵션을 등록하여 가능한 날에만 예약을 받을 수 있는 해빗입니다. 일정 관리 및 고객 관리를 더 간편하게 하실 수 있습니다. (에스테틱, 네일 제외한 대부분의 해빗)</p>
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
                      <th>(예시) 1인권, 1회권 등</th>
                      <th>(예시) 판매수량</th>
                      <th>가격</th>
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
                  <div>
                    <p class="item2-info" style="color: gray;">- 구매 기록이 있는 옵션은 수정이 불가능 합니다.</p>
                  </div>
                  <div>
                    <p class="item2-info" style="color: gray;">- 해빗 옵션 가격은 5000원 이상부터 등록 가능합니다.</p>
                  </div>
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
                      <th>(예시) 클래스 실행 일시</th>
                      <th>(예시) 최대 모집인원</th>
                      <th>가격</th>
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
                  <div>
                    <p class="item2-info" style="color: gray;">- 구매 기록이 있는 옵션은 수정이 불가능 합니다.</p>
                  </div>
                  <div>
                    <p class="item2-info" style="color: gray;">- 해빗 옵션 가격은 5000원 이상부터 등록 가능합니다.</p>
                  </div>
                </div>
              </div>
              <!-- 콘텐츠 옵션 : 원데이 클래스 종료 -->
            </div>
          </div>

          <!-- 해빗 설명 -->
          <div class="content">
            <p class="content-name">해빗 설명</p>
            <div class="content-flex">
              <div class="item-name">
                <p>대표 이미지</p>
              </div>
              <div>
                <div class="item" id="preview_img_container" style="display: flex; align-items: center; justify-content: center;">
                </div>
                <div class="input-img">
                  <small hidden id="cont_img_small">이미지 파일은 3개까지 첨부 가능합니다.</small><br>
                  <label for="cont_img" class="btn btn-outline-primary">이미지 추가하기</label>
                  <input type="file" id="cont_img" name="cont_imgs" class="form-control" accept="image/*" onchange="contImgCheck(this)" multiple>
                </div>
              </div>
            </div><hr>

            <div class="content-flex">
              <div class="item-name">
                <p>해빗 상세 설명</p>
              </div>
              <!-- 썸머노트 사용 textarea -->
              <div>
                <textarea id="summernote" name="cont_content" maxlength="2000"></textarea>
              </div>
            </div>
          </div>

          <!-- 환불 규정 -->
          <div class="content">
            <p class="content-name">환불 규정</p>
            <div style="display: flex; justify-content: center;">
              <div style="width: 80%;">
              <textarea class="form-control" name="" id="" rows="9" cols="80" style="resize: none; color: rgb(129, 129, 129);" disabled>
[날짜 조율형]
1. 결제 후 7일 이내 취소 시 : 전액 환불
(단, 결제 후 14일 이내라도 호스트와 해빗 진행일 예약 확정 후 환불 불가)
2. 결제 후 14일 이후 취소 시 : 환불 불가
※ 상품의 유효기간 만료 시 연장은 불가합니다.
※ 다회권의 경우, 1회라도 사용시 부분 환불이 불가합니다.

[날짜 지정형]
1. 구매한 클래스 이용권 사용일 전 취소 시 : 전액 환불
2. 구매한 클래스 이용권 사용일 이후 취소 시 : 환불 불가
※ 상품의 유효기간 만료 시 연장은 불가합니다.

[환불 신청 방법]
1. 해당 해빗 결제한 계정으로 로그인
2. 마이해빗 - 신청내역 or 결제내역
              </textarea>
              </div>
            </div>
          </div>
        </div>
        <div class="d-grid gap-2" style="margin: 20px 0 40px;" id="cotent-update-button">
          <input type="submit" class="btn btn-lg btn-outline-primary" value="해빗 수정">
        </div>
      </form>
    </div>
  </div>
</div>