<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>

<link rel="stylesheet" href="css/payPage.css?after" />'
<script src="js/payPage.js"></script>
    <!--헤더끝-->

<link rel="stylesheet" href="css/payPage.css" />
<script src="js/payPage.js"></script>



    <!-- 본문 시작 -->
    <div class="Home">
      <section class="Home_form">
      <form action="payDone.html">
        <div id="pagetitle_pay">결제하기</div>

        <p class="paypage_title">프립정보</p>
        <section id="fripinfo">
          <div id="frip_img">
            <img src="img/eggtart.jpg" />
          </div>

          <div class="title_div">

          <div>

            <p>[망원] 카페 인기메뉴! 마카오식 에그타르트 만들기</p>
            <span>별점 : 4.9 (후기 106개)</span>
          </div>
        </section>
        <hr />
        <section>
          <ul style="font-size: large; font-weight: bold; padding: 20px">
            옵션정보
          </ul>
          <li>호스트와 연락을 통해 날짜를 지정</li>
          <li>이용권/1개</li>
        </section>
        <hr style="border-width: 4px" />

        <section>
          <p class="paypage_title">결제수단</p>
          <div class="select_payment">
            <input type="radio" id="by_card" name="payby" checked /><label
              for="by_card"
              style="font-size: 15px;" >신용/체크카드</label
            >
            <input type="radio" id="by_etc" name="payby" /><label for="by_etc"
            style="font-size: 15px;">기타결제</label
            >
          </div>
        </section>

        <hr style="border-width: 4px" />
        <section>
          <p class="paypage_title">에너지</p>
          <input type="text" placeholder="  사용할 에너지를 입력하세요" class="pay_energy" />
          <input type="button" value="전액사용" id="E_btn" />

          <p style="padding-left: 20px;">참고 : 에너지는 100E부터 사용가능합니다.</p>

          <p>참고 : 에너지는 100E부터 사용가능합니다.</p>

        </section>

        <hr style="border-width: 4px" />


        <section style="display: inline-block; width: 100%;">

        <section style="display: inline-block">

          <span class="paypage_title">총 결제금액</span>
          <input type="text" name="tot_price" id="tot_price" value="30,000"  readonly/>
          <hr />
          <br />
          <div style="display: inline-block">
            <a href="#" class="tos_a">개인정보 제 3자 제공 동의</a>
            <button class="tos_btn">보기</button>
            <br /><br />
            <a href="#" class="tos_a">결제 대행 서비스 이용약관</a>
            <button class="tos_btn">보기</button>
          </div>
        </section>
        <hr style="border-width: 4px" />
        <section>
          <p class="paypage_title">이번 프립은 누구와 하시나요?</p>

          <p class="recommend_ment">

          <p style="padding: 10px">

            다음번 크루님이 좋아할만한 프립을 추천해드릴게요.
          </p>
          <div id="with_somebody">
            <label class="box-radio-input">
              <input
                type="radio"
                name="cp_item"
                value="옵션1"
                checked="checked"
              />
              <span>혼자</span>
            </label>
            <label class="box-radio-input">
              <input type="radio" name="cp_item" value="옵션2" />
              <span>연인</span>
            </label>
            <label class="box-radio-input">
              <input
                type="radio"
                name="cp_item"
                value="옵션3"
                checked="checked"
              />
              <span>친구</span>
            </label>
            <label class="box-radio-input">
              <input
                type="radio"
                name="cp_item"
                value="옵션4"
                checked="checked"
              />
              <span>가족</span>
            </label>
            <label class="box-radio-input">
              <input
                type="radio"
                name="cp_item"
                value="옵션5"
                checked="checked"
              />
              <span>배우자</span>
            </label>
          </div>
        </section>
        <hr>
        <p
          style="
            text-align: center;
            font-weight: lighter;
            font-size: small;
            margin-top: 40px;
            margin-bottom: 20px;
          "
        >
          위 내용을 모두 확인하였으며, 결제에 동의합니다.
        </p>
        <input type="submit" value="결제하기" />
      </form>
    </section>
    </div>

    <!-- 본문 끝-->


    <!--footer 시작-->

<%@include file="../footer.jsp"%>



