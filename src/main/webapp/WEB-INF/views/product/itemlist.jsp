<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/feed.css" />
<link rel="stylesheet" href="/css/itemlist.css">
<script src="/js/jquery.cookie.js"></script>
<script src="/js/common.js"></script>
<script src="/js/itemlist.js"></script>

<%-- 필터 모달창--%>
<div id="filter-root">
    <div>
        <div class="Filter_Container_Modal" >
            <div class="Filter_FlexFix">
                <div class="Filter_Wrapper_Modal">
                    <header class="Filter_HeaderWrapper">
                        <div class="FilterModalHeader_Wrapper">
                            <span class="FilterModalHeader_ModalTitle">필터</span>
                        </div>
                        <button name="CloseBtn" type="button" class="Filter_Button">
                            <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E %3Cg fill='none' fill-rule='nonzero'%3E %3Cpath d='M0 0h24v24H0z'/%3E %3Cpath stroke='%23000' stroke-width='2' d='M7.05 7.05l9.9 9.9M16.95 7.05l-9.9 9.9'/%3E %3C/g%3E %3C/svg%3E" alt="닫기버튼">
                        </button>
                    </header>
                    <div class="FilterBodyContainer">
                        <div class="FilterOther_Momo">
                            <div class="FilterOther_ModalSection">
                                <div>
                                    <div class="FilterOthers_FilterTitle">정렬</div>
                                    <div class="FilterRadio">
                                        <div direction="column" class="FilterRadio_RadioInput">
                                            <div class="FilterRadio_OptionWrapper">
                                                <label  class="FilterRadio_StyleLabel">
                                                    인기순
                                                    <div class="FilterRadio_CustomRadio"></div>
                                                    <input type="radio" id="radio-hot" name="filter" value="popularity" class="FilterRadio_RadioClick">
                                                </label>
                                            </div>
                                            <div class="FilterRadio_OptionWrapper">
                                                <label  class="FilterRadio_StyleLabel">
                                                    등록일순
                                                    <div class="FilterRadio_CustomRadio"></div>
                                                    <input type="radio" id="radio-date" name="filter" value="date" class="FilterRadio_RadioClick">
                                                </label>
                                            </div>
                                            <div class="FilterRadio_OptionWrapper">
                                                <label  class="FilterRadio_StyleLabel">
                                                    평점순
                                                    <div class="FilterRadio_CustomRadio"></div>
                                                    <input type="radio" id="radio-review" name="filter" value="rating" class="FilterRadio_RadioClick">
                                                </label>
                                            </div>
                                            <div class="FilterRadio_OptionWrapper">
                                                <label  class="FilterRadio_StyleLabel">
                                                    가격 높은순
                                                    <div class="FilterRadio_CustomRadio"></div>
                                                    <input type="radio" id="radio-pricehigh" name="filter" value="highPrice" class="FilterRadio_RadioClick">
                                                </label>
                                            </div>
                                            <div class="FilterRadio_OptionWrapper">
                                                <label  class="FilterRadio_StyleLabel">
                                                    가격 낮은순
                                                    <div class="FilterRadio_CustomRadio"></div>
                                                    <input type="radio" id="radio-pricelow" name="filter" value="lowPrice" class="FilterRadio_RadioClick">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="FilterOther_Price">
                                </div>
                            </div>
                        </div>
                        <footer class="Filter_FooterWrapper">
                            <button width="280px" height="50px" color="white" font-size="13px" font-weight="bold" class="Button_btn">적용하기</button>
                        </footer>
                    </div>
                </div>
                <div class="Filter_Overlay"></div>
            </div>
        </div>
    </div>
</div>
    <%--    필터 모달창 끝--%>


<!--* 대분류 클릭시 모달창-->

<div class="modal_root" style="display: none;">
    <div class="modal_Container">
        <div class="modal_FlexFix">
            <div class="modal_Wrapper">
                <header class="modal_header">
                    카테고리
                    <button type="button" name="CloseBtn" class="modal_headerBtn" onclick="modalCategory()">
                        <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' fill='none' viewBox='0 0 24 24'%3E %3Cpath fill='%23333' fill-rule='evenodd' d='M18.104 6.707c.39-.39.39-1.024 0-1.414-.39-.39-1.023-.39-1.414 0L11.7 10.284 6.707 5.293c-.39-.39-1.024-.39-1.414 0-.39.39-.39 1.023 0 1.414l4.991 4.992-4.991 4.991c-.39.39-.39 1.024 0 1.414.39.39 1.023.39 1.414 0l4.992-4.991 4.991 4.991c.39.39 1.024.39 1.414 0 .39-.39.39-1.023 0-1.414L13.113 11.7l4.991-4.992z' clip-rule='evenodd'/%3E %3C/svg%3E" alt="닫기/버튼">
                    </button>
                </header>
                <div class="BodyScrollLockContainer">
                    <div class="modal_Content">
                        <div class="CategoryList_Wrapper">
                            <a href="" class="CategoryItem-A" data-category="아웃도어" onclick="selectCategory('아웃도어')">
                                <div class="CategoryItem1">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>아웃도어</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="피트니스" onclick="selectCategory('피트니스')">
                                <div class="CategoryItem2">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>피트니스</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="공예DIY" onclick="selectCategory('공예DIY')">
                                <div class="CategoryItem3">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>공예DIY</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="스포츠" onclick="selectCategory('스포츠')">
                                <div class="CategoryItem4">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>스포츠</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="베이킹" onclick="selectCategory('베이킹')">
                                <div class="CategoryItem5">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>베이킹</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="문화예술" onclick="selectCategory('문화예술')">
                                <div class="CategoryItem6">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>문화예술</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="온라인" onclick="selectCategory('온라인')">
                                <div class="CategoryItem7">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>온라인</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="자기계발" onclick="selectCategory('자기계발')">
                                <div class="CategoryItem8">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>자기계발</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="뷰티" onclick="selectCategory('뷰티')">
                                <div class="CategoryItem9">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>뷰티</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="모임" onclick="selectCategory('모임')">
                                <div class="CategoryItem10">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>모임</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="스토어" onclick="selectCategory('스토어')">
                                <div class="CategoryItem11">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>스토어</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="상담" onclick="selectCategory('상담')">
                                <div class="CategoryItem12">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>상담</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="수상레포츠" onclick="selectCategory('수상레포츠')">
                                <div class="CategoryItem13">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>수상레포츠</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="음료" onclick="selectCategory('음료')">
                                <div class="CategoryItem14">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>음료</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="요리" onclick="selectCategory('요리')">
                                <div class="CategoryItem15">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>요리</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="국내여행" onclick="selectCategory('국내여행')">
                                <div class="CategoryItem16">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>국내여행</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="제주여행" onclick="selectCategory('제주여행')">
                                <div class="CategoryItem17">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>제주여행</span>
                                </div>
                            </a>

                            <a href="" class="CategoryItem-A" data-category="해외여행" onclick="selectCategory('해외여행')">
                                <div class="CategoryItem18">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>해외여행</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal_Overlay"></div>
    </div>
</div>
</div>
<!--! 대분류 클릭시 모달 끝-->


<!-- *본문 시작 -->
<div class="nice">

</div>
<div class="Home">
    <div class="PageWrapper">
        <div class="Fade_Wrapper" style="opacity: 1; display: block;">
            <div class="CategoryNav_Wrapper">
                <span id="selectedCategory">####</span>
                <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' viewBox='0 0 18 18'%3E %3Cg fill='none' fill-rule='evenodd'%3E %3Cpath d='M18 0H0v18h18z'/%3E %3Cpath stroke='%23000' stroke-width='1.5' d='M7 5l4 4-4 4'/%3E %3C/g%3E %3C/svg%3E" class="CategoryNav_arrow">
            </div>
            <div>
                <div class="ItemList_Wrapper jEQWdY">
                    <a  href="" class="midbtn" style="font-weight: bold; color: rgb(51, 151, 255);">전체</a>
                    <c:forEach items="${middle}" var="item">
                        <a href="/category/${item.cate_large}/${item.cate_middle}/" class="midbtn">${item.cate_middle}</a>
                    </c:forEach>

                    <div id="otherParagraph"></div>
                </div>
            </div>


            <!-- 날짜 필터 버튼 -->
            <div class="Filter_Wrapper">
                <div class="Filter__FilterButtonWrapper">
<%--                    <div class="FilterDate">--%>
<%--                        <div class="FilterOpenButton">--%>
<%--                            <button height="auto" color="initial" font-size="14px" font-weight="500" class="Button1">날짜</button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="FilterOther">
                        <div class="FilterOpenButton">
                            <button height="auto" color="initial" font-size="14px" font-weight="500" class="Button1">필터</button>
                        </div>
                    </div>
                </div>

                <!-- * 인기 리스트 시작 -->
                <div class="Fade_Wrapper" style="opacity: 1; display: block;">
                    <div>
                        <div font-size="14px" class="ProductSectionHeader_Wrapper">
                            <div font-size="18" class="ProductSectionHeader_Header">
                                <h2 class="ProductSectionHeader_Title">인기 리스트</h2>
                                <span class="ProductSectionHeader_Count">${hotListCount}</span>
                            </div>
                            <div class="ProductSectionHeader_LinkWrapper">
                                <a href="/category/${cate_large}/hot" class="ProductSectionHeader_Link" style="color: black;">전체 보기</a>
                            </div>
                        </div>

                        <!-- ^ 인기 리스트 아이템 -->
                        <div class="Home_product_recommend_list">
                            <c:forEach items="${hotTop}" var="ht" varStatus="vs">
                                <div class="Home_product_recommend_p">
                                    <a href="products/${ht.cont_no}" class="href">
                                        <div class="Home_product_recommend_p_div">
                                            <div>
                                                <img src="/storage/${ht.cont_img}" alt="" width="150px" onerror="this.src='/storage/ang.png'">
                                            </div>
                                            <div>
                                                <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="return false" >
                                                    <img src="/img/black2.png" alt="" id="cont_no${ht.cont_no}" width="40px" class="Home_product_recommend_p_div_img zzim_img">
                                                </button>
                                            </div>
                                            <div class="Home_product_recommend_p_font">
                                                <div>
                                                    <span class="Miniarea">${fn:substring(ht.cont_addr1, 0, 7)}</span>
                                                    <div>
                                                            ${ht.cont_name}
                                                    </div>
                                                    <section class="Home_recommend_img">
                                                        <c:set var="starItem" value="${starMap[ht.cont_no]}" />
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
                                                            <img src="/img/star.png" alt="" class="Home_recommend_star">
                                                        </c:forEach>
                                                        <c:set var="contNo" value="${ht.cont_no}" />
                                                        <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);">후기 ${reviewcnt[contNo].Reviewcnt}</span>
                                                    </section>
                                                    <hr class="Home_recommend_hr">
                                                    <div>
                                                        <c:set var="priceItem" value="${priceMap[ht.cont_no]}" />
                                                        <c:set var="money" value="${priceItem['money']}" />
                                                        <fmt:formatNumber type="number" value="${money}" pattern="###,###" var="formattedMoney" />
                                                            ${formattedMoney}원
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <!-- ! 인기 리스트 끝  -->

                    <!--* 금주 리스트 시작 -->
                    <div>
                        <div font-size="14px" class="ProductSectionHeader_Wrapper">
                            <div font-size="18" class="ProductSectionHeader_Header">
                                <h2 class="ProductSectionHeader_Title_a">금주 리스트</h2>
                                <span class="ProductSectionHeader_Count">${reviewCount}</span>
                            </div>
                            <div class="ProductSectionHeader_LinkWrapper">

                            </div>
                        </div>

                        <!-- ^ 금주 리스트 아이템 -->

                        <div class="Home_product_recommend_list">
                            <c:forEach items="${reviewTop}" var="rt" varStatus="vs">
                                <div class="Home_product_recommend_p">
                                    <a href="products/${rt.cont_no}" class="href">
                                        <div class="Home_product_recommend_p_div">
                                            <div>
                                                <img src="/storage/${rt.cont_img}" alt="" width="150px" onerror="this.src='/storage/ang.png'">
                                            </div>
                                            <div>
                                                <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="return false">
                                                    <img src="/img/black2.png" id="avgcont_no${rt.cont_no}" alt="" width="40px" class="Home_product_recommend_p_div_img zzim_img">
                                                </button>
                                            </div>
                                            <div class="Home_product_recommend_p_font">
                                                <div>
                                                    <span class="Miniarea">${fn:substring(rt.cont_addr1, 0, 7)}</span>
                                                    <div>
                                                            ${rt.cont_name}
                                                    </div>
                                                    <section class="Home_recommend_img">
                                                        <c:set var="starItem" value="${starMap[rt.cont_no]}" />
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
                                                            <img src="/img/star.png" alt="" class="Home_recommend_star">
                                                        </c:forEach>
                                                        <c:set var="contNo" value="${rt.cont_no}" />
                                                        <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);">후기 ${reviewcnt[contNo].Reviewcnt}</span>
                                                    </section>
                                                    <hr class="Home_recommend_hr">
                                                    <div>
                                                        <c:set var="priceItem" value="${priceMap[rt.cont_no]}" />
                                                        <c:set var="money" value="${priceItem['money']}" />
                                                        <fmt:formatNumber type="number" value="${money}" pattern="###,###" var="formattedMoney" />
                                                            ${formattedMoney}원
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!--! 금주 리스트 끝 -->


                    <!--* 신규 리스트 시작 -->
                    <div>
                        <div font-size="14px" class="ProductSectionHeader_Wrapper">
                            <div font-size="18" class="ProductSectionHeader_Header">
                                <h2 class="ProductSectionHeader_Title_b">신규 리스트</h2>
                                <span class="ProductSectionHeader_Count">${newListCount}</span>
                            </div>
                            <div class="ProductSectionHeader_LinkWrapper">
                                <a href="/category/${cate_large}/new" class="ProductSectionHeader_Link_new" style="color: black;">전체 보기</a>
                            </div>
                        </div>

                        <!-- ^ 신규 리스트 아이템 -->
                        <div class="Home_product_recommend_list">
                            <c:forEach items="${newTop}" var="nt" varStatus="vs">
                                <div class="Home_product_recommend_p">
                                    <a href="products/${nt.cont_no}" class="href">
                                        <div class="Home_product_recommend_p_div">
                                            <div>
                                                <img src="/storage/${nt.cont_img}" alt="" width="150px" onerror="this.src='/storage/ang.png'" >
                                            </div>
                                            <div>
                                                <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="return false">
                                                    <img src="/img/black2.png" id="newcont_no${nt.cont_no}" alt="" width="40px" class="Home_product_recommend_p_div_img zzim_img">
                                                </button>
                                            </div>
                                            <div class="Home_product_recommend_p_font">
                                                <div>
                                                    <span class="Miniarea">${fn:substring(nt.cont_addr1, 0, 7)}</span>
                                                    <div>
                                                            ${nt.cont_name}
                                                    </div>
                                                    <section class="Home_recommend_img">
                                                        <c:set var="starItem" value="${starMap[nt.cont_no]}" />
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
                                                            <img src="/img/star.png" alt="" class="Home_recommend_star">
                                                        </c:forEach>
                                                        <c:set var="contNo" value="${nt.cont_no}" />
                                                        <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);">후기 ${reviewcnt[contNo].Reviewcnt}</span>
                                                    </section>
                                                    <hr class="Home_recommend_hr">
                                                    <div>
                                                        <c:set var="priceItem" value="${priceMap[nt.cont_no]}" />
                                                        <c:set var="money" value="${priceItem['money']}" />
                                                        <fmt:formatNumber type="number" value="${money}" pattern="###,###" var="formattedMoney" />
                                                            ${formattedMoney}원
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </c:forEach>
                        </div>

                    <!--! 신규 리스트 끝 -->



                    <div font-size="13px" class="ButtonLinkAllProduct_Wrapper">
                        <a href="/category/${cate_large}/all" class="ButtonLinkAllProduct"></a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
</div>

<script>
    var hotListCount = ${hotListCount};
    var selectedCategory = "${selectedCategory}";

    const selectedMiddle = $(this).text();
    const cateLarge = '${cate_large}';
    $('.active').removeClass('active');
    $(this).addClass('active');


    function selectCategory(cate_large) {
        localStorage.setItem("selectedCategory", cate_large);

        location.href = `/category/` + cate_large;
    }

    //필터 모달창
    document.addEventListener("DOMContentLoaded", function() {
        const button1 = document.querySelector(".FilterOther .FilterOpenButton .Button1");
        const filterModal = document.querySelector(".Filter_Container_Modal");
        const closeBtn = document.querySelector("[name='CloseBtn']");
        const applyFilterButton = document.querySelector(".Button_btn");
        const radioButtons = document.querySelectorAll("input[type='radio'][name='filter']");

        // 필터 모달창 열고 닫기 기능
        button1.addEventListener("click", function() {
            filterModal.style.display = "flex";
        });

        closeBtn.addEventListener("click", function() {
            filterModal.style.display = "none";
        });


        const cate_large = '<%=request.getAttribute("cate_large")%>';

        //필터 기능 구현
        applyFilterButton.addEventListener("click", function () {
            let selectedFilter;
            for (const radio of radioButtons) {
                if (radio.checked) {
                    selectedFilter = radio.value;
                    break;
                }
            }
            const newPath = "/category/" + encodeURIComponent(cate_large) + "/all" + "?filter=" + encodeURIComponent(selectedFilter);
            window.location.href = newPath;
        });

        radioButtons.forEach(radioButton => {
            radioButton.addEventListener('change', () => {
                if (radioButton.checked) {
                    //console.log(radioButton.value + ' is selected');
                    // 원하시는 기능을 추가하시면 됩니다.
                    radioButtons.forEach(rb => rb.parentElement.classList.remove('selected'));
                    radioButton.parentElement.classList.add('selected');
                }
            });
        });


    });





    if(${sessionScope.s_id!=null}){
        let userId="${sessionScope.s_id}";
        //console.log(userId);
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
                        $("#avgcont_no"+value).attr("src", "/img/redheart2.png");
                    });
                }

            });
        }
    }

</script>

<!-- 본문 끝 -->


<%@include file="../footer.jsp"%>