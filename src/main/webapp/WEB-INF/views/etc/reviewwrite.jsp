<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>


  <link rel="stylesheet" href="/css/reviewwrite.css?after">
  <link rel="stylesheet" href="/css/reviewstar.css">
  <script src="/js/reviewwrite.js?after"></script>



    <!-- 본문 시작 -->

    <div class="Home">
                <div class="Home_order_sub">리뷰</div>
        <div class="Home_show_wrapper">
            <img src="/img/image.jpeg" alt="" class="Home_show_order_img">
                <div class="Home_show_order_info">
                    <div class="Home_show_date">2022년 5월 24일 23:30 결제</div> 
                    <div>신사 / 가로수길 칵테일 클래스</div>
                    <div>6월 1일 (일) 오후 2시 30분</div>
                </div>
            
        </div>
        <form action="review.jsp">
        <div class="Home_review_wrapper">
            <div class="Home_order_sub2">리뷰 작성</div>
            
                <div class="Home_order_check">
                    <div class="Home_write_con">
                        <div style="margin-bottom: 10px;">
                            <fieldset class="rate">
                                <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                                <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                                <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                                <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                                <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                                <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                                <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                                <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                                <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                                <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>                       
                            </fieldset>
                        </div>
                        <textarea class="Home_write_review" placeholder="리뷰를 작성해주세요"></textarea>
                    </div>
                    <div><hr>
                        <div class="Home_show_review">
                        </div>
                        <label for="file">
                            <div class="btn-upload">파일 업로드하기</div>
                        </label>
                        <div class="Home_show_review_com">
                            * 파일은 5개까지 업로드 가능합니다.<br>
                        </div>
                        <input type="file" name="file" id="file" onchange="setProfile(event)"  multiple >
                       
                    </div>
                </div>
                
        </div>
        <hr>

        <div class="Home_refund_btn">
          <div class="Home_refund_com">
            * 리뷰 작성시 에너지 500포인트 자동 적립 
          </div>
          <div><button class="refund_btn">작성완료</button></div>
        </div>
        </form>
    </div>

    <!-- 본문 끝-->

<%@include file="../footer.jsp"%>
   


  
