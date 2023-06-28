<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/feed.css" />
<link rel="stylesheet" href="/css/detailpage.css" />
<script src="/js/jquery.cookie.js"></script>
<script src="/js/detailpage.js"></script>


<!-- 본문 시작 -->

<div class="PageWrapper">
    <div style="margin-top: 30px; margin-bottom: 25px; display: flex;">
        <div class="image-slider">
            <span class="slide_prev" onclick="prevImage()"><</span>
            <span class="slide_next" onclick="nextImage()">></span>
<%--        <img data-role="none" class="ImageSlider_Prev" style="display: block;" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='50' height='50' viewBox='0 0 50 50'%3E %3Cpath fill='none' fill-rule='evenodd' stroke='%23FFF' stroke-width='2' d='M21 17l8 8.014L21.028 33'/%3E %3C/svg%3E"  onclick="prevImage()">--%>
            <c:forEach items="${detail.cont_imgs}" var="img" varStatus="status">
                <img style="width: 380px; height: 380px; border-radius: 3px; display: ${status.index == 0 ? 'block' : 'none'}" src="/storage/${img}" onerror="this.src='/storage/ang.png'" class="image_item">
            </c:forEach>
<%--            <img data-role="none" class="ImageSlider_Next" style="display: block;" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='50' height='50' viewBox='0 0 50 50'%3E %3Cpath fill='none' fill-rule='evenodd' stroke='%23FFF' stroke-width='2' d='M21 17l8 8.014L21.028 33'/%3E %3C/svg%3E" onclick="nextImage()">--%>
        </div>
            <div style="margin-left: 20px; width: 360px;">
            <div style="height: 290px;">
                <div class="BasicInfoSection">
                    <hgroup class="BasicInfoSecion_Title">
                    <h1 class="BIS_title">${detail.cont_name}</h1>

                    </hgroup>
                    <div class="BasicInfoSection_Action">
                        <button type="button" name="ShareBtn" class="ButtonShare">
                    <img src="/img/share.svg" alt="공유 아이콘">
                        </button>
                    </div>
                </div>
                <div style="display: flex; align-items: flex-end; margin-top: 20px;">
                    <div style="font-weight: bold; font-size: 30px; margin-right: auto; margin-left: 5px">
                        <fmt:formatNumber value="${price.money}" pattern="#,##0" />원
                    </div>

                </div>
                <c:if test="${detail.cont_status eq 'N'}">
                    <div style="font-weight: bold; font-size: 15px; margin-right: auto; margin-left: 5px; color: red;margin-top: 5px;">
                        <span>판매가 종료된 상품입니다</span>
                    </div>
                </c:if>
            </div>
            <hr>
            <div style="display: flex; align-items: center;">
                <div style="display: flex; align-items: center;">
                    <img src="/storage/${hostprofile.host_img}" alt="" onerror="this.src='/storage/ME.png'"
                         style="border-radius: 40px; width: 40px; height: 40px; background-color: rgb(0, 0, 0);"/>
                    <div>
                        <div style="margin-left: 20px; display: flex; flex-direction: column">
                            <div style="font-weight: bold; font-size: 20px;" >${hostprofile.host_name} </div>
                            <div class="hostcls">해빗 ${hostcontcnt.cont_cnt} | 후기 ${hostreviewcnt.review_cnt} | 찜 ${hostzzimcnt.zzim_cnt} </div>
                        </div>
                    </div>
                </div>
                <div style="margin-left: auto;">
                    <img style="width: 70px; margin-left: 50px;" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='56' height='17' fill='none' viewBox='0 0 56 17'%3E %3Cpath fill='%238B56CD' d='M23.024 13.92V9.216h1.104v-1.68h-6.72v1.68h1.104v4.704h1.752V9.216h1.008v4.704h1.752zm1.164-8.568c-1.548 0-2.472-.84-2.472-1.74V2.88H19.82v.732c0 .9-.876 1.74-2.472 1.74v1.656c1.716 0 2.844-.492 3.42-1.512.576 1.02 1.692 1.512 3.42 1.512V5.352zm5.495 8.568v-1.68h-.504V4.68h.444V3h-4.8v1.68h.444v7.56h-.444v1.68h4.86zm2.34 0V3h-1.74v3.972h-.648v1.92h.648v5.028h1.74zm-4.512-1.68h-.576V4.68h.576v7.56zm12.05 1.68v-1.68h-2.423V9.036h-1.872v3.204h-2.424v1.68h6.72zm.013-7.212c0-1.104-.924-1.728-2.328-1.728h-2.088c-1.404 0-2.328.576-2.328 1.728v.168c0 1.164.888 1.728 2.328 1.728h2.088c1.5 0 2.328-.564 2.328-1.728v-.168zm-.012-2.028V3.24H37.15v-.6h-1.896v.6h-2.412v1.44h6.72zm-1.644 2.124c0 .324-.192.48-.588.48h-2.256c-.372 0-.588-.156-.588-.48V6.78c0-.324.192-.48.588-.48h2.256c.372 0 .588.156.588.48v.024zm9.179 7.116v-1.68h-6.72v1.68h6.72zm.06-4.968c-1.548 0-2.472-1.08-2.472-2.22V2.88h-1.896v3.852c0 1.14-.876 2.22-2.472 2.22v1.656c1.716 0 2.964-.732 3.42-1.752.456 1.02 1.692 1.752 3.42 1.752V8.952zm7.475 2.052v-1.56h-4.968V7.536h4.848v-1.56h-4.848V4.56h4.968V3h-6.72v8.004h6.72zm0 2.916v-1.68h-6.72v1.68h6.72z'/%3E %3Ccircle cx='6.5' cy='10.5' r='6.5' fill='%239965DA'/%3E %3Cpath fill='%23713BB4' fill-rule='evenodd' d='M4 0H0l2.359 4.246c.987-.655 2.137-1.082 3.377-1.208L4 0z' clip-rule='evenodd'/%3E %3Cpath fill='%239965DA' fill-rule='evenodd' d='M9 0h4l-2.36 4.245C9.667 3.6 8.532 3.174 7.31 3.043L8.999 0z' clip-rule='evenodd'/%3E %3Ccircle cx='6.5' cy='10.5' r='6' stroke='%23713BB4'/%3E %3Cpath fill='%23fff' d='M9 9.154V8H4.619c-.063 0-.132.024-.207.072-.074.043-.143.102-.206.176-.057.07-.106.147-.146.233-.04.08-.06.157-.06.232v1.426c0 .332.072.57.215.714.149.139.318.213.507.224h2.955c.029 0 .052.01.069.032.023.021.034.043.034.064v.577c0 .064-.034.096-.103.096H4V13h4.399c.068 0 .137-.021.206-.064.069-.048.132-.107.189-.176.063-.07.111-.145.146-.225.04-.085.06-.165.06-.24V10.86c0-.177-.023-.324-.069-.441-.04-.118-.097-.214-.172-.289-.074-.074-.157-.128-.249-.16-.091-.032-.186-.048-.283-.048H5.323c-.074 0-.112-.032-.112-.096V9.25c0-.021.012-.043.035-.064.023-.021.048-.032.077-.032H9z'/%3E %3C/svg%3E">
                </div>
            </div>
        </div>
    </div>


    <div class="ReviewSummary">
        <div class="ReviewSummary_info">
            <div class="Readonly_star">
        <c:set var="starItem" value="${star}" />
        <c:set var="avgStarRating" value="${starItem['avg_star']}" />
        <c:choose>
            <c:when test="${avgStarRating != null}">
                <c:set var="roundedStarRating" value="${Math.round(avgStarRating.doubleValue())}" />
            </c:when>
            <c:otherwise>
                <c:set var="roundedStarRating" value="0" />
            </c:otherwise>
        </c:choose>
        <c:forEach begin="1" end="${roundedStarRating > 5 ? 5 : roundedStarRating}" varStatus="starStatus">
            <img src="/img/star.png" alt="" style="" class="detailstar">
        </c:forEach>
        </div>

        <strong class="ReviewSummary_Aver">
            <fmt:formatNumber value="${avgStarRating != null ? avgStarRating : 0}" pattern="#,##0.0" minFractionDigits="2" />
        </strong>
        <span class="ReviewSummary_Count">${contreviewcnt.Reviewcnt}개 후기</span>
        </div>
            <span class="ReviewSummary_Comment">경험한 크루들은 이렇게 평가했어요!</span>
    </div>
    <c:if test="${contreview.size()!=0}">
        <div class="Reviewblack">
            <div class="Reviewflex parent-container">
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <c:forEach items="${contreview}" var="review" varStatus="status">
                    <div class="Reviewgreen">
                        <img src="/storage/${review.review_img}" class="review_img" onerror="this.src='/storage/defaultPro.png';"/>
                        <div class="CoverReviewCard_User">
                            <div class="CoverReviewCard_ProfileImg">
                                <img src="/storage/${review.user_img}}"  class="guest" alt="" onerror="this.src='/storage/ME.png';"/>
                            </div>
                            <div class="CoverReviewCard_UserInfo">
                                 <p>${review.user_id}</p>
                            </div>
                            <p class="CorverReivewCard_p"></p>
                        </div>
                        <span class="SpanLineClamp">${review.review_cont}</span>
                    </div>
                </c:forEach>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
        </div>
    </c:if>
    <div class="reviewplus">
        <strong><a href="/products/reviews?cont_no=${cont_no}" class="review_stylelink">${contreviewcnt.Reviewcnt}개 후기 더보기</a></strong>
    </div>


        <div class="Classintroduction">
            <section class="ProductDetailPage">
            <article>
            <header class="Article_Header">
            <h2 class="Article_Header_title">해빗 소개</h2>
            </header>
            <div class="DescriptionSection_Container">
                <div class="product-description">
                    <p style="text-align: center">${detail.cont_content}</p>
                </div>
            </div>
            <div class="DescriptionSection">
                    <button type="button" class="Buttoninfo" id="detailButton">
                        <span>상세정보 더보기</span>
                        <div class="ButtonMore">
                            <img class="arrow-icon" src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='none' viewBox='0 0 16 16'%3E %3Cpath fill='%23333' fill-rule='evenodd' d='M3.21 5.203c.28-.27.735-.27 1.015 0L8.5 9.329l4.275-4.126c.28-.27.735-.27 1.015 0 .28.27.28.708 0 .979l-4.783 4.615c-.28.27-.734.27-1.014 0L3.21 6.182c-.28-.27-.28-.709 0-.98z' clip-rule='evenodd'/%3E %3C/svg%3E" >
                        </div>
                    </button>
            </div>
            </article>
            </section>
        </div>

        <section class="ProductDetailPage">
            <article>
                <header class="Article_Header">
            <h2 class="Article_Header_title">진행하는 장소</h2>
                </header>
                <div class="Classplace">
                    <div id="map" style="width:100%;height:350px;"></div>
                    <div class="address">${detail.cont_addr1} ${detail.cont_addr2} / ${detail.cont_extaddr}</div>
                </div>
            </article>
        </section>

        <section class="ProductDetailPage">
            <article>
                <header class="Article_Header">
            <h2  class="Article_Header_title">해시 태그</h2>
                </header>
                <div class="Classsupplies">
            <span class="RoundTag">${detail.cont_hashtag1 == 'M' ? '남자' : (detail.cont_hashtag1 == 'W' ? '여자' : (detail.cont_hashtag1 == 'N' ? '성별 무관' : detail.cont_hashtag1))}</span>
            <c:set var="ages" value="${fn:split(detail.cont_hashtag2, '|')}" />
            <c:forEach items="${ages}" var="age" varStatus="status">
                <c:if test="${status.index > 0}"></c:if>
                <c:set var="trimmedAge" value="${fn:trim(age)}" />
                <span class="RoundTag">${trimmedAge}대</span>
            </c:forEach>
            <span class="RoundTag">${detail.cont_hashtag3 == 'IN' ? '실내' : (detail.cont_hashtag3 == 'OUT' ? '실외' : detail.cont_hashtag3)}</span>
            <c:set var="withList" value="${fn:split(detail.cont_hashtag4, '|')}" />
            <c:forEach items="${withList}" var="with" varStatus="status">
                <c:set var="trimmedWith" value="${fn:trim(with)}" />
                <c:set var="translatedWith" value="${trimmedWith == 'WC' ? '커플과 함께' : (trimmedWith== 'WF' ? '친구와 함께' : (trimmedWith == 'WA' ? '나 혼자' : trimmedWith))}" />
                <span class="RoundTag">${translatedWith}</span>
            </c:forEach>
            <span class="RoundTag">${detail.cont_hashtag5 == 'P3' ? '3만원 미만' : (detail.cont_hashtag5 == 'P5' ? '5만원 미만' : (detail.cont_hashtag5 == 'P7' ? '7만원 미만' : (detail.cont_hashtag5 == 'PP' ? '7만원 이상' : detail.cont_hashtag5)))}</span>
        </div>
            </article>
        </section>

    <section class="ProductDetailPage">
        <article>
        <div class="LinkAccordion">
            <div class="Accordion_Container">
                <div>유의 사항</div>
                <div class="Accordion_Icon"><img class ="Accordion_IconArrow" src="data:image/svg+xml,%3Csvg width='7' height='12' viewBox='0 0 7 12' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M1 11L6 6L1 1' stroke='%23CCCCCC' stroke-linecap='round' stroke-linejoin='round'/%3E %3C/svg%3E"></div>
            </div>
            <div class="Accordion_Content" style="display:none;">
                * 본문 내용 참고
            </div>
        </div>
        </article>
        <article>
            <div class="LinkAccordion">
                <div class="Accordion_Container">
                    <div>환불 정책</div>
                    <div class="Accordion_Icon"><img class ="Accordion_IconArrow" src="data:image/svg+xml,%3Csvg width='7' height='12' viewBox='0 0 7 12' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M1 11L6 6L1 1' stroke='%23CCCCCC' stroke-linecap='round' stroke-linejoin='round'/%3E %3C/svg%3E"></div>
                </div>
                <div class="Accordion_Content" style="display:none;">
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
                </div>
            </div>
        </article>
    </section>

    <section class="ProductDetailPage">
        <article>
            <header class="Article_Header">
                <h2 class="Article_Header_title">이런 해빗 어때요?</h2>
            </header>
            <div>

            </div>
        </article>
    </section>
</div>
    <div class="FloatingActionBar" id="FloatingActionBar" style="display: none;">
        <div class="FloatingButton">
            <button class="SaveActionButton zzim_btn" type="button" onclick="preventA()" onsubmit="return false">
                <img src="/img/black2.png" id="cont_no${detail.cont_no}" alt="상품 찜" >
                <span class="SaveActionButton">${contzzim.zzim_cont_cnt}</span>
            </button>
            <button class="ActionButton" id="openModalButton">
                <div class="DefaultButton">참여하기</div>
            </button>
        </div>
    </div>
</div>

<%--아이템 옵션 모달창--%>
<div  id="productOptionsModal" class="Main_Wrapper" style="display: none">
    <div role="button" class="Toggle_Purch">
        <img src="data:image/svg+xml,%3Csvg width='17' height='10' viewBox='0 0 17 10' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M1.75 1.75L8.5 8.5L15.25 1.75' stroke='%23777777' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/%3E %3C/svg%3E" class="Toggle_PurchIcon">
    </div>
    <div class="OptionBottomSheet">
        <div role="button" class="OptionSelect_Wrapper">
            <div class="OptionSelect_Title">
                <span class="OptionSelect_Title">기본 옵션</span>
                <img src="data:image/svg+xml,%3Csvg width='20' height='20' viewBox='0 0 20 20' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M17.5 6.25L10 13.75L2.5 6.25' stroke='%23333333' stroke-width='1.8' stroke-linecap='round' stroke-linejoin='round'/%3E %3C/svg%3E" class="OptionSelect_Icon">
            </div>
            <div class="OptionItem_Wrapper">
                <c:if test="${detailproduct.size()==0}">
                    <div class="OptionItem_Container">
                        품절된 상품입니다.
                    </div>
                </c:if>
            <c:forEach var="option" items="${detailproduct}" varStatus="status">
                <div class="OptionItem_Container" id="${status.index}" data-price="${option.one_price}">
                    <input type="hidden" value="${option.pro_no}" class="Option_Head">
                    <div class="OptionItem_ContentContainer">
                        <div class="OptionItem_TitleContainer">
                            <span class="OptionItem_Title" color="#333333">${option.one_date}</span>
                        </div>
                        <div class="OptionItem_PriceContainer">
                            <span color="#333333" class="OptionItem_Price"><fmt:formatNumber value="${option.one_price}" pattern="#,##0" />원</span>
                            <c:set value="${option.one_maxqty-option.payd_qty}" var="stock"></c:set>
                            <span color="#999999" class="OptionItem_Remains">재고 : ${stock}개</span>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
        <div class="PurchaseCell_Wrapper">
            <div class="purchaseCell_TitleWrapper">
                <div class="PurchaseCell_Title">선택 한 상품명</div>
                <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='none' viewBox='0 0 24 24'%3E %3Cpath fill='%23333' fill-rule='evenodd' d='M18.104 6.707c.39-.39.39-1.024 0-1.414-.39-.39-1.023-.39-1.414 0L11.7 10.284 6.707 5.293c-.39-.39-1.024-.39-1.414 0-.39.39-.39 1.023 0 1.414l4.991 4.992-4.991 4.991c-.39.39-.39 1.024 0 1.414.39.39 1.023.39 1.414 0l4.992-4.991 4.991 4.991c.39.39 1.024.39 1.414 0 .39-.39.39-1.023 0-1.414L13.113 11.7l4.991-4.992z' clip-rule='evenodd'/%3E %3C/svg%3E" class="PurchaseCell_DeleteIcon">
            </div>
            <div class="PurchaseCell_PriceWrapper">
                <div class="Counter_Wrapper">
                    <img src="data:image/svg+xml,%3Csvg width='32' height='32' viewBox='0 0 32 32' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M0.5 5C0.5 2.51472 2.51472 0.5 5 0.5H31.5V31.5H5C2.51472 31.5 0.5 29.4853 0.5 27V5Z' fill='%23EEEEEE' stroke='%23EEEEEE'/%3E %3Cpath d='M10 16L22 16' stroke='%23AAAAAA' stroke-width='2' stroke-linecap='round'/%3E %3C/svg%3E" class="Counter_ControlButton" draggable="false" style="cursor:pointer;" id="minus-btn">
                    <input type="number" min="1" class="Counter_Value" value="1">
                    <img src="data:image/svg+xml,%3Csvg width='32' height='32' viewBox='0 0 32 32' fill='none' xmlns='http://www.w3.org/2000/svg'%3E %3Cpath d='M0.5 0.5H27C29.4853 0.5 31.5 2.51472 31.5 5V27C31.5 29.4853 29.4853 31.5 27 31.5H0.5V0.5Z' fill='%23EEEEEE' stroke='%23EEEEEE'/%3E %3Cpath d='M11 16L21 16' stroke='%23AAAAAA' stroke-width='2' stroke-linecap='round'/%3E %3Cpath d='M16 11V21' stroke='%23AAAAAA' stroke-width='2' stroke-linecap='round'/%3E %3C/svg%3E" class="Counter_ControlButton" draggable="false" style="cursor:pointer;" id="plus-btn">
                </div>
                <span class="PurchaseCell_Price"></span>
            </div>
        </div>
    </div>

    <div class="BottomContent_Wrapper">
        <div class="OptionBottomSheet_OptionItem">
            <strong class="OptionBottomSheet_Count">총 수량</strong>
            <strong class="OptionBottomSheet_Price">총 가격</strong>
        </div>
        <div class="OptionBottomSheet_ProductInfo">
            <button class="SaveActionButton" type="button">
                <img src="/img/black2.png" id="cont_no${detail.cont_no}">
                <span class="SaveActionButton_Count">${contzzim.zzim_cont_cnt}</span>
            </button>
            <button class="OptionBottomSheet_Button">참여하기</button>
        </div>
    </div>
</div>

<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=514f787389abd52c7772e80e1f1beba1&libraries=services"></script>
<script>



    $(document).ready(function() {
        $(".LinkAccordion").click(function() {
            var $content = $(this).find(".Accordion_Content");
            $content.slideToggle("slow");

            $(this).toggleClass('active');
        });

        if('${detail.cont_status}'=='N'){
            $("#FloatingActionBar").css('display','none');
            //$("#openModalButton").off('click');
        }

    });


    // 여기에 세션 처리가 완성되면, 해당 로그인 상태를 확인하는 코드로 변경
    // 예를 들면, `const isLoggedIn = sessionStorage.getItem('isLoggedIn');`
    const isLoggedIn = ${sessionScope.s_id != null};
    const user_id = isLoggedIn ? "${sessionScope.s_id}" : "";

    let selectedOption = "";


    // 상품 옵션 선택 이벤트 핸들러 추가
    const optionItems = document.querySelectorAll('.OptionItem_Container');
    const quantityInput = document.querySelector('.Counter_Value');

    optionItems.forEach((item) => {
        item.addEventListener('click', (e) => {
            // 선택된 상품 옵션 및 수량 정보 저장
            selectedOption = item.querySelector('.Option_Head').value;
        });
    });




    // 참여하기 버튼 클릭시 동작
    const confirmButton = document.querySelector('.OptionBottomSheet_Button');
    confirmButton.addEventListener('click', checkLoginStatus);


    //const isLoggedIn = (user_id !== null && user_id !== '');

    function checkLoginStatus() {
        if (isLoggedIn) {
            if (selectedOption) {
                let quantity = parseInt(quantityInput.value);

                fetch('/cart/insert', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        pro_no: selectedOption,
                        cl_qty: quantity,
                    }),
                })

                    .then((response) => {
                        if (response.ok) {
                            window.location.href = '/cart/list';
                        } else {
                            console.error('Error:', response);
                        }
                    })
                    .catch((error) => {
                        console.error('Error:', error);
                    });
            }
        } else {
            alert('로그인 후 이용 가능합니다.');
            window.location.href = '/login';
        }
    }

    if(isLoggedIn){
        let userId= user_id;
        console.log(userId);
        if(userId!=""){
            $.ajax({
                type: "GET"
                , url: "/zzim/getZzim"
                , data: {"userId": userId}
                , async: false
                , success: function (data) {
                    //console.log(data);
                    $(data).each(function (index, value) {
                        console.log(value);

                        $("#cont_no" + value).attr("src", "/img/redheart2.png");
                        $("#newcont_no"+value).attr("src", "/img/redheart2.png");
                    });
                }

            });
        }
    }


    // 지도 API
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('${detail.cont_addr1}', function(result, status) {

        // 정상적으로 검색이 완료됐으면
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });



            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        }
    });



</script>





<!-- 본문 끝-->

<%@include file="../footer.jsp"%>


