<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="/css/itemlist.css?after" />
<script src="/js/jquery.cookie.js"></script>
<script src="/js/midnewlist.js?after"></script>
<script src="/js/common.js?after"></script>

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
                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="아웃도어">
                                <div class="CategoryItem1">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>아웃도어</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="피트니스">
                                <div class="CategoryItem2">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>피트니스</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="공예DIY">
                                <div class="CategoryItem3">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>공예DIY</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="스포츠">
                                <div class="CategoryItem4">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>스포츠</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="베이킹">
                                <div class="CategoryItem5">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>베이킹</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="문화예술">
                                <div class="CategoryItem6">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>문화예술</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="온라인">
                                <div class="CategoryItem7">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>온라인</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="자기계발">
                                <div class="CategoryItem8">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>자기계발</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="뷰티">
                                <div class="CategoryItem9">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>뷰티</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="모임">
                                <div class="CategoryItem10">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>모임</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="스토어">
                                <div class="CategoryItem11">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>스토어</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="심리·상담">
                                <div class="CategoryItem12">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>심리·상담</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="수상레포츠">
                                <div class="CategoryItem13">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>수상레포츠</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="음료">
                                <div class="CategoryItem14">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>음료</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="요리">
                                <div class="CategoryItem15">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>요리</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="국내여행">
                                <div class="CategoryItem16">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>국내여행</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="제주여행">
                                <div class="CategoryItem17">
                                    <div class="CategoryItem__Background"></div>
                                    <div class="CategoryItem__Text"></div>
                                    <span>제주여행</span>
                                </div>
                            </a>

                            <a onclick="selectCategory(event)" class="CategoryItem-A" data-category="해외여행">
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
<!--! 대분류 클릭시 모달 끝-->

<!--* 본문 시작 -->
<div class="Home">
    <div class="PageWrapper">
        <div class="Fade_Wrapper" style="opacity: 1; display: block;">
            <br>
            <!-- 콘텐츠 리스트 -->

            <div font-size="18" class="ProductSectionHeader_Header">
                <h2 class="ProductSectionHeader_Title_hot">####</h2>
                <span>${midNewListCount}</span>
            </div>

            <!-- * 전체 아이템 리스트 시작 -->
            <div class="Home_product_recommend_list">
                <c:forEach items="${midNewList}" var="row" varStatus="vs">
                    <div class="Home_product_recommend_p">
                        <a href="/category/products/${row.cont_no}" class="href">
                            <div class="Home_product_recommend_p_div">
                                <div>
                                    <img src="/img/image.jpeg" alt="" width="150px">
                                </div>
                                <div>
                                    <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="preventA()" onsubmit="return false">
                                        <img src="/img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                    </button>
                                </div>
                                <div class="Home_product_recommend_p_font">
                                    <div>
                                        <span class="Miniarea">${fn:substring(row.cont_addr1, 0, 7)}</span>
                                        <div>
                                                ${row.cont_name}
                                        </div>
                                        <section class="Home_recommend_img">
                                            <c:set var="starItem" value="${starMap[row.cont_no]}" />
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
                                            <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);">후기 ${starItem['cnt']}</span>
                                        </section>
                                        <hr class="Home_recommend_hr">
                                        <div>
                                            <c:set var="priceItem" value="${priceMap[row.cont_no]}" />
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
            <!--* 전체 아이템 리스트 끝 -->


            <!--* 이전/다음 버튼 -->
            <footer class="Wrapper_Paging">
                <div class="paging">
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold"  onclick="onPageClick(-1)">&lt;</button>
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold"  onclick="onPageClick(1)">1</button>
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold"  onclick="onPageClick(2)">2</button>
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold" onclick="onPageClick(3)">3</button>
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold" onclick="onPageClick(4)">4</button>
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold" onclick="onPageClick(-2)">></button>
                </div>
            </footer>


        </div>



    </div>
</div>
</div>
</div>





<!-- 본문 끝 -->

<%@include file="../footer.jsp"%>