<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="css/detailpage.css?after" />

    <!-- 본문 시작 -->
    <div class="PageWrapper">
        <div class="PageWrapperflex">
            <img src="/img/thumnail.png">
            <div style="margin-left: 20px; width: 280px;">
                <div style="height: 255px;">
                    <div style="display: flex;">
                        <div style="font-size: 20px;">보컬레슨, 녹음하며 정복하자! (예약 가능)</div>
                        <img src="/img/share.svg">
                    </div>
                    <div style="display: flex; align-items: flex-end; margin-top: 20px;">
                        <div style="color: rgb(255, 115, 0); font-weight: bold; font-size: 20px; margin-right: 10px;">
                            47%</div>
                        <div style="font-weight: bold; font-size: 20px; margin-right: 4px">20,000원</div>
                        <div style="font-size: 13px; color: rgb(184, 184, 184); text-decoration:line-through;">37,500원
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
                                <div>일단해봐용 > </div>
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
            <span style="color: deeppink; padding:5px;">★★★★★</span>
            <span style="font-weight: bold; padding:5px;">5.0</span>
            <span style="font-weight: bold;">706개 후기</span>
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
                    <a href="/review.html">706개 후기 더보기</a>
                </div>
                <hr>
            </div>



            <div class="Classintroduction">
                <h2>해빗 소개</h2> 
            </div>
            <hr>
            <div class="Classplace">
                <h2>진행하는 장소</h2> 
            </div>
            <hr> 
            <div class="Classsupplies">
                <h2 style="margin-bottom: 15px;">포함 사항</h2>
                <span class="RoundTag">장비 대여비</span>
                <span class="RoundTag">레슨비</span> 
                <span class="RoundTag">장소 대여비</span> 
            </div>
            <hr>
            <div class="Classsupplies2">
                <h2 style="margin-top: 15px; margin-bottom: 15px;">불포함 사항</h2>
                <span class="RoundTag_un">주차</span>
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
        <div class="Wrapper_Paging">
            <div class="paging">
                <button onclick="movePage(1)">1</button>
                <button onclick="movePage(2)">2</button>
                <button onclick="movePage(3)">3</button>
                <button onclick="movePage(4)">4</button>
                <button onclick="movePage(5)">5</button>
            </div>
        </div>
    </div>

    <script>
        <!-- 슬라이드 -->
        let slideIndex = 1;
        showSlides(slideIndex);

        function plusSlides(n) {
            slideIndex += n;
            if (slideIndex > 4) {
                slideIndex = 1;
            } else if (slideIndex < 1) { slideIndex = 4; } showSlides(slideIndex);
        } function showSlides(n) {
            let i;
              let slides = document.getElementsByClassName("Reviewgreen"); for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                } slides[slideIndex - 1].style.display = "block";
        } </script>

        <!-- 본문 끝-->

<%@include file="../footer.jsp"%>


</body>