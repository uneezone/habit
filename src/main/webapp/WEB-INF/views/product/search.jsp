<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/css/search.css?after" />
<script src="/js/search.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <!--* 본문 시작 -->
  <div class="Home">
  <div class="PageWrapper">
    <div class="Fade_Wrapper" style="opacity: 1; display: block;">

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
                    
        <!-- 콘텐츠 리스트 -->

        <div font-size="18" class="ProductSectionHeader_Header">
            <h2 class="ProductSectionHeader_Title_all title">####</h2>
            <span>${list.size()}</span>
        </div>
        <script>
            let search=decodeURI(window.location.search);
            console.log(search);
            let showname;
            let index=search.indexOf("=");
            let index2=search.indexOf("&");
            if(index2!=-1){
                showname=search.substring(index+1,index2);
                console.log(showname);
                let filter=search.substring(index2+8,search.length);

                switch ( filter )
                {
                    case 'popularity' :
                        showname+=' 인기순';
                        break;
                    case 'date' :
                        showname+=' 날짜순';
                        break;
                    case 'rating' :
                        showname+=' 평점순';
                        break;
                    case 'highPrice' :
                        showname+=' 가격 높은순';
                        break;
                    case 'lowPrice' :
                        showname+=' 가격 낮은순';
                        break;
                }
            }else {
                showname=search.substring(index+1,search.length);
                console.log(showname);
            }
            console.log(showname);
            $(".title").text(showname+" 검색 결과");
        </script>


        <!-- 날짜 필터 버튼 -->
        <div class="Filter_Wrapper">
            <div class="Filter__FilterButtonWrapper">
                <div class="FilterOther">
                    <div class="FilterOpenButton">
                        <button height="auto" color="initial" font-size="14px" font-weight="500" class="Button1">필터</button>
                    </div>
                </div>
            </div>


               <!-- * 전체 아이템 리스트 시작 -->
            <div class="Home_product_recommend_list">
                <c:if test="${list==null}">
                    <span style="font-size: 16px;font-weight: 600;">검색결과없음</span>
                </c:if>
                <c:forEach items="${list}" var="product" varStatus="vs">
                    <div class="Home_product_recommend_p">
                        <a href="detailpage.jsp" class="href">
                            <div class="Home_product_recommend_p_div">
                                <div>
                                    <img src="/storage/${product.cont_img}" alt="" style="width:150px; height: 150px;">
                                </div>
                                <div>
                                    <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="preventA()" onsubmit="return false">
                                        <img src="/img/black2.png"  id="cont_no${product.cont_no}" alt="" width="40px" class="Home_product_recommend_p_div_img">

                                    </button>
                                </div>
                                <div class="Home_product_recommend_p_font">
                                    <div>
                                        <span class="Miniarea">
                                            ${product.cont_addr1}
                                        </span>
                                        <div>
                                            ${product.cont_name}
                                        </div>
                                        <section class="Home_recommend_img">
                                            <c:if test="${product.review_count!=0}">
                                                <span class="review_star${vs.index}">
                                                </span>
                                                <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);"> 후기 ${product.review_count}</span>
                                            </c:if>
                                            <c:if test="${product.review_count==0}">
                                                <span style="font-size: 10px; font-weight: bold; color: rgb(119, 119, 119);"> 후기 0</span>
                                            </c:if>
                                        </section>

                                        <script>


                                            for(let i=0;i<=9;i++){
                                                let htmlAppend="";

                                                if(parseFloat(${product.review_avg})%2==0.0){

                                                    if( parseFloat(${product.review_avg})==parseFloat(i/2)){

                                                        for (let k = 0; k < i * 0.5; k++) {
                                                            htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                        }
                                                        $(".review_star"+'${vs.index}').append(htmlAppend);
                                                        break;
                                                    }
                                                    continue;
                                                }else if( parseFloat(${product.review_avg})==0.5*i){

                                                    for (let k = 0; k < (i * 0.5-0.5); k++) {
                                                        htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                    }
                                                    htmlAppend += "<img src='/img/halfstar.png' class='Home_recommend_star''>";
                                                    $(".review_star"+'${vs.index}').append(htmlAppend);
                                                    break;
                                                }else if( parseFloat(${product.review_avg})>0.5*i &&  parseFloat(${product.review_avg})<0.5*(i+1)){

                                                    if(i%2==0) {
                                                        for (let k = 0; k < i * 0.5; k++) {
                                                            htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                        }
                                                        htmlAppend += "<img src='/img/halfstar.png' class='Home_recommend_star''>";
                                                        $(".review_star"+'${vs.index}').append(htmlAppend);
                                                        break;
                                                    }else{
                                                        for (let k = 0; k < i * 0.5; k++) {
                                                            htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                        }
                                                        $(".review_star"+'${vs.index}').append(htmlAppend);
                                                        break;
                                                    }
                                                }else if(parseFloat(${product.review_avg})<=5.0 &&(parseFloat(${product.review_avg})>4.5)){
                                                    for(let k=0;k<5;k++){
                                                        htmlAppend+="<img src='/img/star.png' class='Home_recommend_star''>";
                                                    }
                                                    $(".review_star"+'${vs.index}').append(htmlAppend);
                                                    break;
                                                }
                                            }

                                        </script>
                                        <hr class="Home_recommend_hr">
                                        <div>
                                            <fmt:formatNumber value="${product.price}" pattern="#,###"/> 원
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

            <c:set value="${list.size()/2}" var="pages"></c:set>

            <footer class="Wrapper_Paging">
                <div class="paging">
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold"  onclick="onPageClick(-1)">&lt;</button>
                    <button width="40px" height="40px" color="#3397ff"  class="pactive index_page_btn" font-size="18px" font-weight="bold"  onclick="onPageClick(this)">1</button>
                    <c:forEach begin="2" end="${pages+(1-(pages%1))%1}" var="paging">
                        <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold" class="index_page_btn"  onclick="onPageClick(this)">${paging}</button>
                    </c:forEach>
                    <button width="40px" height="40px" color="#3397ff" font-size="18px" font-weight="bold" onclick="onPageClick(0)">></button>
                </div>
            </footer>

            <script>
                $(".index_page_btn").css("display","none");
                //console.log($(".index_page").index());
                if($(".index_page_btn").length>3){
                    $(".index_page_btn").slice(0,3).show();
                }else{
                    $(".index_page_btn").show();
                }
            </script>
            
            

 
        </div>



        </div>
    </div>
</div>
  </div>


   <!-- 본문 끝 -->


<%@include file="../footer.jsp"%>


    

    <script>

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



            //필터 기능 구현
            applyFilterButton.addEventListener("click", function () {
                let selectedFilter;
                for (const radio of radioButtons) {
                    if (radio.checked) {
                        selectedFilter = radio.value;
                        break;
                    }
                }
                let url=new URL(window.location.href);
                const urlParams = url.searchParams;
                let recentSearch = urlParams.get("recentSearch");
                //alert(recentSearch);

                const newPath = "/search?recentSearch="+recentSearch+"&filter="+selectedFilter;
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
            console.log(userId);
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
                           // $("#newcont_no"+value).attr("src", "/img/redheart2.png");
                        });
                    }

                });
            }
        }
    </script>
    


</body>