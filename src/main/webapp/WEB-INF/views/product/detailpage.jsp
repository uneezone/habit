<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/detailpage.css?after" />
<script src="/js/jquery.cookie.js"></script>
<script src="/js/detailpage.js"></script>
<script src="/js/common.js"></script>

<!-- 본문 시작 -->

<div class="PageWrapper">
    <div style="margin-top: 30px; display: flex;">
        <img style="width: 300px; border-radius: 3px;" src="/img/thumnail.png">
        <div style="margin-left: 20px; width: 280px;">
            <div style="height: 255px;">
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
                    <div style="font-weight: bold; font-size: 20px; margin-right: 4px">
                        <fmt:formatNumber value="${price.money}" pattern="#,##0" />원
                    </div>
                </div>
            </div>
            <hr>
            <div style="display: flex; align-items: center;">
                <div style="display: flex; align-items: center;">
                    <img src="/img/ME.png"
                         style="border-radius: 40px; width: 40px; height: 40px; background-color: rgb(0, 0, 0);"></img>
                    <div>
                        <div style="margin-left: 20px; display: flex; flex-direction: column">
                            <div>${hostprofile.host_name} </div>
                            <div>프립1 | 후기233 | 찜302 </div>
                        </div>
                    </div>
                </div>
                <div style="margin-left: 35px;">
                    <img style="width: 20px;" src="/img/heart.png">
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="ReviewSummary">
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
        <span style="font-weight: bold; padding:5px;">
            <fmt:formatNumber value="${avgStarRating != null ? avgStarRating : 0}" pattern="#,##0.0" minFractionDigits="2" />
        </span>
        <span style="font-weight: bold;">${starItem['cnt']}개 후기</span>
        <div class="ReviewContent">
            <span>경험한 크루의 100%가 5점을 줬어요!</span>
        </div>
        <div class="Reviewblack">
            <div class="Reviewflex">
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <div class="Reviewgreen">
                    <img src="/img/ang.png" alt="">
                    <p>user</p>
                    <span>내용</span>
                </div>
                <div class="Reviewgreen1">
                    <img src="/img/ang.png" alt="">
                    <p>user</p>
                    <span>내용</span>
                </div>
                <div class="Reviewgreen2">
                    <img src="/img/ang.png" alt="">
                    <p>user</p>
                    <span>내용</span>
                </div>
                <div class="Reviewgreen3">
                    <img src="/img/ang.png" alt="">
                    <p>user</p>
                    <span>내용</span>
                </div>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <div class="reviewplus">
                <a href="review.html">706개 후기 더보기</a>
            </div>
            <hr>
        </div>


        <div class="Classintroduction">
            <header class="Article_Header">
            <h2>해빗 소개</h2>
            </header>
            <div class="DescriptionSection_Container">
                <div class="product-description">
            ${detail.cont_content}
                </div>
            </div>
            <div class="DescriptionSection">
                    <button type="button" class="Buttoninfo">
                        <span>상세정보 더보기</span>
                    </button>
            </div>
        </div>
        <hr>
        <div class="Classplace">
            <h2>진행하는 장소</h2>
            ${detail.cont_addr1} ${detail.cont_addr2}/${detail.cont_extaddr}
        </div>
        <hr>
        <div class="Classsupplies">
            <h2 style="margin-bottom: 15px;">해시 태그</h2>
            <span class="RoundTag">${detail.cont_hashtag1 == 'M' ? '남자' : (detail.cont_hashtag1 == 'W' ? '여자' : (detail.cont_hashtag1 == 'N' ? '성별 무관' : detail.cont_hashtag1))}</span>
            <c:set var="ages" value="${fn:split(detail.cont_hashtag2, '|')}" />
            <c:forEach items="${ages}" var="age" varStatus="status">
                <c:if test="${status.index > 0}">-</c:if>
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
        <hr>

        <div>
            <a href="">1:1 문의</a>
            <hr>
            <span>유의 사항</span>
            <hr>
            <span>환불 정책</span>
        </div>
        <hr>
        <hr>
        <div style="display: flex;">
            <h2>이런 프립 어때요?</h2>
        </div>
    </div>
    <div class="FloatingActionBar" id="openModalButton">
        <div class="FloatingButton">
            <button class="SaveActionButton" type="button">
                <img src="/img/heart.png" alt="상품 찜">
                <span class="SaveActionButton">1.4만</span>
            </button>
            <button class="ActionButton">
                <div class="DefaultButton">참여하기</div>
            </button>
        </div>
    </div>
</div>

<div  id="productOptionsModal" class="Main_Wrapper">
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
            <c:forEach var="option" items="${detailproduct}" varStatus="status">
                <div class="OptionItem_Container" id="${status.index}" data-price="${option.one_price}">
                    <div class="OptionItem_ContentContainer">
                        <div class="OptionItem_TitleContainer">
                            <span class="OptionItem_Title" color="#333333">${option.one_date}</span>
                        </div>
                        <div class="OptionItem_PriceContainer">
                            <span color="#333333" class="OptionItem_Price"><fmt:formatNumber value="${option.one_price}" pattern="#,##0" />원</span>
                            <span color="#999999" class="OptionItem_Remains">${option.one_maxqty}개</span>
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
                <img src="/img/heart.png">
                <span class="SaveActionButton_Count">찜 총수량</span>
            </button>
            <button class="OptionBottomSheet_Button" >참여하기</button>
        </div>
    </div>
</div>







<!-- 본문 끝-->

<%@include file="../footer.jsp"%>


