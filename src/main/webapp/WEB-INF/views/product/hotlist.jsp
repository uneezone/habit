<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/itemlist.css?after" />
<script src="/js/jquery.cookie.js"></script>
<script src="/js/hotlist.js?after"></script>
<script src="/js/common.js?after"></script>


    <!--* 본문 시작 -->
    <div class="Home">
    <div class="PageWrapper">
    <div class="Fade_Wrapper" style="opacity: 1; display: block;">
        <br>
            <!--& 인기 리스트 타이틀 & 총수량 -->
        <div font-size="18" class="ProductSectionHeader_Header">
                    <h2 class="ProductSectionHeader_Title_hot">####</h2>
                    <span>${hotListCount}</span>
                </div>

               <!-- * 인기 리스트 리스트 시작 -->
        <div class="Home_product_recommend_list">
            <c:forEach items="${hotList}" var="row" varStatus="vs">
                <div class="Home_product_recommend_p">
                    <a href="/category/products/${row.cont_no}" class="href">
                        <div class="Home_product_recommend_p_div">
                            <div>
                                <img src="/storage/${row.cont_img}" alt="" width="150px" onerror="this.src='/storage/ang.png'">
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
                    <!--* 인기 아이템 리스트 끝 -->

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



  



   <!-- 본문 끝 -->



    <%@include file="../footer.jsp"%>