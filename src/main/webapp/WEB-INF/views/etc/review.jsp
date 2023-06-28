<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/css/review.css?after" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/js/review.js"></script>

    <!-- 본문 시작 -->

    <div class="Home">
        <div style="margin: 30px 0px 20px 0px; display: flex; justify-content: space-between">
            <span style="font-size:20px; font-weight: 600;">후기 ${reviewList.size()}개</span>
            <span>
                <select name="reviewFilter" id="reviewFilter" class="select_option" onchange="changeReviewList()">
                    <option value="new">최신순</option>
                    <option value="avg">평점 높은순</option>
                </select>
            </span>
        </div>
        <hr>
        <script>
            let filter=window.location.search;
            if(filter.includes("avg")){
                $("#reviewFilter").val("avg").prop("selected",true);
            }

        </script>
        <div>
            <input type="hidden" value="${reviewList.get(1).cont_no}" id="cont_no">
            <c:forEach items="${reviewList}" var="review" varStatus="vs">
                <div class="review${review.review_no} review_con">
                    <div style="display: flex; align-items: center; margin-bottom: 20px;">
                        <img src="/storage/${review.user_img}" style="border-radius: 40px; width: 40px; height: 40px; background-color: rgb(0, 0, 0);">
                        <div style="margin-left: 15px;">
                            <div>${review.user_name}</div>
                            <span>
                                <section class="Home_recommend_img review_star${vs.index}">

                                </section>
                                    ${review.review_star}
                            </span>
                            <span style="font-size: small;">${review.review_date}</span>
                        </div>
                        <c:if test="${sessionScope.s_id==review.user_id}">
                            <div style="text-align: center;position: relative;top: -5px; right: -440px;">
                                <input type="button" value="리뷰 삭제"
                                       style="width: 60px;height: 20px;font-size: 10px; background-color: #fae3ff;border: none; border-radius: 3px;"
                                onclick="delReview(${review.review_no})">
                            </div>
                        </c:if>
                    </div>
                    <div style="font-size: 13px; margin-bottom: 15px;">${review.review_cont}</div>
                    <div style="font-size: 11px; margin-bottom: 5px;">${review.cont_name}</div>
                    <div class="show_img_wrapper${vs.index}">
                    </div>

                    <hr>
                </div>
                <script>
                    //리뷰 별점
                    let star${vs.index}=parseInt(parseFloat(${review.review_star})*10);

                    //console.log(star${vs.index}%2);
                    if(star${vs.index}%2==0){
                        let starHtml="";
                        for(let i=0;i<star${vs.index}/10;i++){
                            starHtml+="<img src='/img/star.png' class='Home_recommend_star'>";
                        }

                        $(".review_star${vs.index}").append(starHtml);
                    }else {
                        let starHtml="";
                        for(let i=0;i<parseInt(star${vs.index}/10);i++){
                            starHtml+="<img src='/img/star.png' class='Home_recommend_star'>";
                        }
                        starHtml+="<img src='/img/halfstar.png' class='Home_recommend_star'>";
                        $(".review_star${vs.index}").append(starHtml);
                    }

                    //리뷰이미지
                    let reviewImgs${vs.index}="${review.review_img}";
                    //console.log(reviewImgs${vs.index});
                    let Imgs${vs.index}=reviewImgs${vs.index}.split('|');
                    //console.log(Imgs${vs.index});
                    for(let i=0;i<Imgs${vs.index}.length;i++){
                        let img=Imgs${vs.index}[i].trim();
                        //console.log(img);
                        if(img!=""){
                            let htmlAppend="<img src='/storage/"+img+"' class='show_review_img'>";
                            $(".show_img_wrapper${vs.index}").append(htmlAppend);
                        }
                    }
                </script>

            </c:forEach>
            
        </div>
        <!--페이징 인덱스 수-->
        <c:set value="${reviewList.size()/4}" var="pages"/>
        <div class="Wrapper_Paging">
            <div class="paging">
                <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold"  onclick="onPageClick(-1)">&lt;</button>
                <button width="40px" height="40px" color="#3397ff"  class="pactive index_page_btn" font-size="18px" font-weight="bold"  onclick="onPageClick(this)">1</button>
                <c:forEach begin="2" end="${pages+(1-(pages%1))%1}" var="paging">
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold" class="index_page_btn"  onclick="onPageClick(this)">${paging}</button>
                </c:forEach>
                <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold" onclick="onPageClick(0)">></button>
            </div>
        </div>
    </div>
    <script>
        $(".index_page_btn").css("display","none");
        //console.log($(".index_page").index());
        if($(".index_page_btn").length>3){
            $(".index_page_btn").slice(0,3).show();
        }else{
            $(".index_page_btn").show();
        }
    </script>


    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>
   


  
</body>