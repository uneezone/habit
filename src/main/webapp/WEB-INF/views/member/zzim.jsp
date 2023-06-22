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
                        <c:forEach var="item" items="${zzimList}" varStatus="status">
                            <div class="Home_product_recommend_p zzim${status.index}">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                         <div>
                                            <input type="image" src="/storage/${item.cont_img}" alt="cont_img" width="140px" height="140px" style="border-radius:8px;">
                                         </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn"  onclick="hello()" onsubmit="return false">
                                                <img src="/img/redheart2.png" id="cont_no${item.cont_no}" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">${item.cont_addr1}</span>
                                                <div>
                                                   ${item.cont_name}
                                                </div>

                                                    <section class="Home_recommend_img">
                                                        <c:if test="${item.review_count!=0}">
                                                            <span class="review_star${status.index}">

                                                            </span>
                                                            <span>${item.review_avg}</span>
                                                            <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);"> 후기 ${item.review_count}</span>
                                                        </c:if>
                                                        <c:if test="${item.review_count==0}">
                                                            <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);"> 후기 0</span>
                                                        </c:if>
                                                    </section>

                                                <script>

                                                    let avg${status.index}=${item.review_avg};

                                                    for(let i=0;i<=9;i++){
                                                        let htmlAppend="";
                                                        //console.log(i/2);
                                                        if(i%2==0){
                                                            if(avg${status.index}==parseFloat(i/2)){
                                                                //console.log("d");
                                                                for (let k = 0; k < i * 0.5; k++) {
                                                                    htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                                }
                                                                $(".review_star"+'${status.index}').append(htmlAppend);
                                                                break;
                                                            }
                                                        }else if(avg${status.index}==0.5*i){
                                                            //console.log("ddd");
                                                            //console.log(i);
                                                                for (let k = 0; k < (i * 0.5-0.5); k++) {
                                                                    htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                                }
                                                                htmlAppend += "<img src='/img/halfstar.png' class='Home_recommend_star''>";
                                                                $(".review_star"+'${status.index}').append(htmlAppend);
                                                                break;
                                                        }else if(avg${status.index}>0.5*i && avg${status.index}<0.5*(i+1)){
                                                            console.log("dddd");
                                                            if(i%2==0) {
                                                                for (let k = 0; k < i * 0.5; k++) {
                                                                    htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                                }
                                                                htmlAppend += "<img src='/img/halfstar.png' class='Home_recommend_star''>";
                                                                $(".review_star"+'${status.index}').append(htmlAppend);
                                                                break;
                                                            }else{
                                                                for (let k = 0; k < i * 0.5; k++) {
                                                                    htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                                }
                                                                $(".review_star"+'${status.index}').append(htmlAppend);
                                                                break;
                                                            }
                                                        }else if(avg${status.index}<=5&&(avg${status.index}>4.5)){
                                                            for(let k=0;k<5;k++){
                                                                htmlAppend+="<img src='/img/star.png' class='Home_recommend_star''>";
                                                            }
                                                            $(".review_star"+'${status.index}').append(htmlAppend);
                                                            break;
                                                        }
                                                    }

                                                </script>

                                                <hr class="Home_recommend_hr">
                                                <div>
                                                    <fmt:formatNumber value="${item.price}" pattern="#,###"/> 원
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