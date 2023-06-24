<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/payPage.css?after" />'
<script src="/js/payPage.js"></script>
    <!--헤더끝-->

<link rel="stylesheet" href="/css/payPage.css" />
<script src="/js/payPage.js"></script>



    <!-- 본문 시작 -->

    <div class="Home">
    <form action="/order/payDone">
      <section class="Home_form">

        <div id="pagetitle_pay">결제하기</div>

        <p class="paypage_title">해빗정보</p>

         <c:forEach var="item" items="${cartDTOS}" varStatus='one_status'>
            <section id="fripinfo">
                <div id="frip_img">
                    <img src="/storage/${item.cont_img}" />
                </div>

                <div class="title_div">
                  <div>
                    <p style="margin-bottom:4px;">${item.cont_name}</p>
                    <span style="margin-bottom:4px; display:inline-block"></span>
                  </div>
                  <div>
                     <div style="margin-bottom:4px;">옵션정보</div>
                     <span style="margin-bottom:4px;">${item.option}</span>
                     <span style="margin-bottom:4px;">이용권/${item.cl_qty}개</span>
                  </div>
                </div>
            </section>
            <hr />
        </c:forEach>

    <div>

        <hr style="border-width: 4px" />

        <section>
          <p class="paypage_title">결제수단</p>
          <div class="select_payment">
            <input type="radio" id="by_card" name="payby" value="c" checked /><label
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
          <div style="padding-left: 20px; margin-bottom:3px">
            <span>내 에너지 : ${requestScope.energy}</span>
            <span></span>
          </div>
          <div style="padding-left: 20px;">
              <input type="number" placeholder="  사용할 에너지를 입력하세요" class="pay_energy" min="0" max="5000" id="useEnergy"/>
              <input type="button" value="전액사용" id="E_btn" onclick="useAll()"/>
          </div>

          <p style="padding-left: 20px;">참고 : 에너지는 한 번에 최대 5000E까지만 사용가능합니다.</p>


        </section>

        <hr style="border-width: 4px" />


        <section style="display: inline-block; width: 100%;">

        <section style="display: inline-block">

          <span class="paypage_title">총 결제금액</span>
          <input type="text" name="tot_price" id="tot_price" value="${totPrice}"  readonly/>
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
          <p class="paypage_title">이번 해빗은 누구와 하시나요?</p>

          <p class="recommend_ment">

          <p style="padding: 10px">

            다음번 크루님이 좋아할만한 해빗을 추천해드릴게요.
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
        </section>
      </form>
    </section>
    </form>
    </div>

    <!-- 본문 끝-->


    <!--footer 시작-->

<%@include file="../footer.jsp"%>



