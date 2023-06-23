<%@ page import="javax.websocket.Session" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/js/zzim.js?after"></script>
<link rel="stylesheet" href="/css/zzim.css?after">
<script>

</script>
    <!-------------- 본문 시작------------------- -->

    <div class="Home">
        <div class="Home_wrapper">
          <a href="/zzim/list" class="Home_wrapper_a" class="href">
            <button class="Home_wrapper_btn ">
                <div>해빗</div>
                <div class="btn_circle1"></div>
            </button>
          </a>
          <a href="zzim2.html" class="Home_wrapper_a" class="href">
            <button class="Home_wrapper_btn">
                <div>
                    호스트
                </div>
                <div class="btn_circle2">
                </div>
            </button>
          </a>  
        </div>

        <!--본컨텐츠-->


        <div class="Home_product_recommend">
            <div class="Home_product_recommend_wrapper">
                <div>
                    <div>
                        <c:forEach var="item" items="${zzimlist1}">
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                         <div>
                                            <input type="image" src="/img/${item.cont_img}" alt="cont_img" width="140px" height="140px" style="border-radius:8px;">
                                             <p style="font-size:11px;">${item.cont_addr1}</p>
                                         </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="/img/redheart2.png" id="${item.cont_no}" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <div>
                                                    <span>${item.cont_name}</span>
                                                </div>

                                                    <section class="Home_recommend_img">
                                                        <c:set var="total" value="${item.avg}"/>

                                                        <c:forEach begin="1" end="${item.avg}">
                                                            <img src="/img/star.png" alt="" class="Home_recommend_star">
                                                        </c:forEach>


                                                        <c:if test="${empty item.cnt}">
                                                             <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);"> 후기 : 0 개</span>
                                                        </c:if>

                                                        <c:if test="${item.cnt ne null}">
                                                            <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);"> 후기 : ${item.cnt} 개</span>
                                                        </c:if>
                                                    </section>

                                                <hr>
                                                <div>
                                                     <span>${item.one_price}</span>원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               </a>
                            </div>

                        </c:forEach>


                        <c:forEach var="item" items="${zzimlist2}">
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                         <div>
                                            <input type="image" src="/img/${item.cont_img}" alt="cont_img" width="140px" height="140px" style="border-radius:8px;">
                                             <p style="font-size:11px;">${item.cont_addr1}</p>
                                         </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="/img/redheart2.png" id="${item.cont_no}" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <div>
                                                    <span>${item.cont_name}</span>
                                                </div>

                                                    <section class="Home_recommend_img">
                                                        <c:set var="total" value="${item.avg}"/>

                                                        <c:forEach begin="1" end="${item.avg}">
                                                            <img src="/img/star.png" alt="" class="Home_recommend_star">
                                                        </c:forEach>


                                                        <c:if test="${empty item.cnt}">
                                                            <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);"> 후기 : 0 개</span>
                                                        </c:if>

                                                        <c:if test="${item.cnt ne null}">
                                                            <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);"> 후기 : ${item.cnt} 개</span>
                                                        </c:if>

                                                    </section>
                                                    <hr>

                                                    <div>
                                                       <span>${item.price}원</span>
                                                    </div>
                                            </div>
                                        </div>
                                    </div>
                               </a>
                            </div>

                        </c:forEach>











                    </div>
                </div>

            </div>
        </div> 

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


    <!------------------------ 본문 끝--------------------->

<%@include file="../footer.jsp"%>