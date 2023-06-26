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
                    
        <!-- 콘텐츠 리스트 -->

        <div font-size="18" class="ProductSectionHeader_Header">
            <h2 class="ProductSectionHeader_Title_all title">####</h2>
            <span>${list.size()}</span>
        </div>
        <script>
            let search=decodeURI(window.location.search);
            let index=search.indexOf("=");
            search=search.substring(index+1,search.length);
            console.log(search);
            $(".title").text(search+" 검색 결과");
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
                <c:if test="${list.size()==0}">
                    검색결과없음
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

                                            let avg${vs.index}=${product.review_avg};

                                            for(let i=0;i<=9;i++){
                                                let htmlAppend="";
                                                //console.log(i/2);
                                                if(i%2==0){
                                                    if(avg${vs.index}==parseFloat(i/2)){
                                                        //console.log("d");
                                                        for (let k = 0; k < i * 0.5; k++) {
                                                            htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                        }
                                                        $(".review_star"+'${vs.index}').append(htmlAppend);
                                                        break;
                                                    }
                                                }else if(avg${vs.index}==0.5*i){
                                                    //console.log("ddd");
                                                    //console.log(i);
                                                    for (let k = 0; k < (i * 0.5-0.5); k++) {
                                                        htmlAppend += "<img src='/img/star.png' class='Home_recommend_star''>";
                                                    }
                                                    htmlAppend += "<img src='/img/halfstar.png' class='Home_recommend_star''>";
                                                    $(".review_star"+'${vs.index}').append(htmlAppend);
                                                    break;
                                                }else if(avg${vs.index}>0.5*i && avg${vs.index}<0.5*(i+1)){
                                                    console.log("dddd");
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
                                                }else if(avg${vs.index}<=5&&(avg${vs.index}>4.5)){
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

        // URL에서 카테고리 정보 가져오기
        const urlSearchParams = new URLSearchParams(window.location.search);

        let categoryText1;

        // 모달창에서 새로운 카테고리를 선택한 경우 이전 정보를 대체한다.
        if (localStorage.getItem('newCategory')) {
            urlSearchParams.delete("category");
            const newCategory = localStorage.getItem("newCategory");
            localStorage.removeItem("newCategory");
            categoryText1 = newCategory;
        } else {
            categoryText1 = urlSearchParams.get("category");
        }

        // 카테고리 이름 설정
        if (categoryText1) {
            // 카테고리 텍스트를 동적으로 변경
            $("#selectedCategory").text(categoryText1);
            const productSectionTitle = ` ${categoryText1} 해빗 `;
            $(".ProductSectionHeader_Title_all").text(productSectionTitle);
        }

        // 대분류 카테고리 단 클릭 시 모달창 열기
        $('.CategoryNav_Wrapper').on('click', function() {
            $('.modal_root').css('display', 'block');
            $('body').css('overflow', 'hidden'); // 스크롤 비활성화
        });
        
        // 닫기 버튼 클릭 시 모달창 닫기
        function modalCategory() {
            $('.modal_root').css('display', 'none');
            $('body').css('overflow', 'auto'); // 스크롤 복원
        }
        
        // 닫기 버튼에 클릭 이벤트를 바인딩
        $('button[name="CloseBtn"]').on('click', modalCategory);

        $(".CategoryItem-A").on("click", function (event) {
            // 클릭한 카테고리에 맞게 된 원래 클릭 경로로 변경
            event.preventDefault();

            // 선택한 카테고리 이름 가져오기
            const selectedCategory = $(event.currentTarget).data("category");

            // 새롭게 선택한 카테고리를 로컬 저장소에 저장한다
            localStorage.setItem("newCategory", selectedCategory);

            // 새로운 카테고리 페이지로 이동
            const newUrl = `itemlist.html?category=${selectedCategory}`;
            location.href = newUrl;
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