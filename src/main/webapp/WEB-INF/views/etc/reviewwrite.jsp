<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


  <link rel="stylesheet" href="/css/reviewwrite.css?after">
  <link rel="stylesheet" href="/css/reviewstar.css">
  <script src="/js/reviewwrite.js?after"></script>



    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_order_sub">
           리뷰
            <c:if test="${reviewDTO.review_cont!=null}">
                수정하기
            </c:if>
        </div>
        <div class="Home_show_wrapper">
            <img src="/storage/${reviewDTO.cont_img}" alt="" class="Home_show_order_img">
                <div class="Home_show_order_info">
                    <div class="Home_show_date">결제일 : ${reviewDTO.payd_date} </div>
                    <div style="padding-bottom: 3px;">${reviewDTO.cont_name}</div>
                    <div style="padding-bottom: 3px;">${reviewDTO.op_name}</div>
                </div>
            
        </div>
        <form action="/mypage/review" method="POST" enctype="multipart/form-data" onsubmit="return checkReview()">
        <div class="Home_review_wrapper">
            <div class="Home_order_sub2">
                리뷰 작성
                <c:if test="${reviewDTO.review_cont!=null}">
                    수정하기
                </c:if>
                <span style="float: right; font-size: 14px;" >
                    <input type="checkbox" name="review_feed" id="feedcheck" value="Y" > 해빗 피드에 올리기
                </span>
            </div>
            
                <div class="Home_order_check">
                    <div class="Home_write_con">
                        <div style="margin-bottom: 10px;">
                            <fieldset class="rate">
                                <input type="radio" id="rating10" name="review_star" value="5"><label for="rating10" title="5점"></label>
                                <input type="radio" id="rating9" name="review_star" value="4.5"><label class="half" for="rating9" title="4.5점"></label>
                                <input type="radio" id="rating8" name="review_star" value="4"><label for="rating8" title="4점"></label>
                                <input type="radio" id="rating7" name="review_star" value="3.5"><label class="half" for="rating7" title="3.5점"></label>
                                <input type="radio" id="rating6" name="review_star" value="3"><label for="rating6" title="3점"></label>
                                <input type="radio" id="rating5" name="review_star" value="2.5"><label class="half" for="rating5" title="2.5점"></label>
                                <input type="radio" id="rating4" name="review_star" value="2"><label for="rating4" title="2점"></label>
                                <input type="radio" id="rating3" name="review_star" value="1.5"><label class="half" for="rating3" title="1.5점"></label>
                                <input type="radio" id="rating2" name="review_star" value="1"><label for="rating2" title="1점"></label>
                                <input type="radio" id="rating1" name="review_star" value="0.5"><label class="half" for="rating1" title="0.5점"></label>
                            </fieldset>
                        </div>

                        <textarea class="Home_write_review" name="review_cont" placeholder="리뷰를 작성해주세요"></textarea>
                    </div>
                    <div><hr>
                        <div class="Home_show_review">
                        </div>
                        <label for="file">
                            <div class="btn-upload">파일 업로드하기</div>
                        </label>
                        <div class="Home_show_review_com">
                            * 파일은 5개까지 업로드 가능합니다.<br>
                            * 해빗 피드에 올리시려면 리뷰 사진 하나이상 첨부해야합니다.
                        </div>
                        <input type="file" name="review_imgs" id="file" onchange="setProfile(event)"  multiple >
                        <input type="hidden" name="cont_no" value="${reviewDTO.cont_no}">
                        <input type="hidden" name="payd_no" value="${reviewDTO.payd_no}">
                       
                    </div>

                </div>
                
        </div>
        <hr>
            <div id="with_somebody">
                <span style="margin-bottom: 5px;display: block;">이번 해빗은 누구와 함께 하셨습니까?</span>
                <br>
                <label class="box-radio-input">
                    <input
                            type="radio"
                            name="review_ask"
                            value="WA"
                            class="review_ask"

                    />
                    <span>혼자</span>
                </label>
                <label class="box-radio-input">
                    <input type="radio" name="review_ask" value="WC" class="review_ask"/>
                    <span>연인</span>
                </label>
                <label class="box-radio-input">
                    <input
                            type="radio"
                            name="review_ask"
                            value="WF"
                            class="review_ask"

                    />
                    <span>친구</span>
                </label>
                <label class="box-radio-input">
                    <input
                            type="radio"
                            name="review_ask"
                            value="WB"
                            class="review_ask"

                    />
                    <span>가족</span>
                </label>
            </div>
            <script>
                if(${reviewDTO.review_cont!=null}){

                    $("#rating" + ${reviewDTO.review_star}*2).prop("checked", true);


                    $(".Home_write_review").text('${reviewDTO.review_cont}');
                    let imgs='${reviewDTO.review_img}';
                    let strings = imgs.split("|");
                    console.log(strings);
                    for(let i=0;i<strings.length;i++) {
                        let img=strings[i].trim();
                        console.log(img);
                        var img_html = "<img class='Home_review_imgs' src='/storage/"+img+"'>";
                        $(".Home_show_review").append(img_html);
                    }

                    if('${reviewDTO.review_feed}'=='Y'){
                        $("input:checkbox[name='review_feed']").prop("checked",true);
                    }

                    if('${reviewDTO.review_ask}'=='WF'){
                        $("input:radio[name='review_ask']").eq(2).prop("checked",true);
                    }else if('${reviewDTO.review_ask}'=='WA'){
                        $("input:radio[name='review_ask']").eq(0).prop("checked",true);
                    }else if('${reviewDTO.review_ask}'=='WC'){
                        $("input:radio[name='review_ask']").eq(1).prop("checked",true);
                    }else{
                        $("input:radio[name='review_ask']").eq(3).prop("checked",true);
                    }
                }
            </script>
         <hr>

        <div class="Home_refund_btn">
          <div class="Home_refund_com">
            * 리뷰 작성시 에너지 500포인트 자동 적립 
          </div>
          <div><button class="refund_btn" type="submit">작성완료</button></div>
        </div>
        </form>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>
   


  
