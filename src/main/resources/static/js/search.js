
//보여줄 상품 갯수
let showPro=2;

window.onload=function(){

    //common.js
    common();

    $(".Home_product_recommend_p").slice(0, showPro).css('display','block'); // 초기갯수

}

$(document).ready(function() {
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

    // 카테고리 아이템 클릭 이벤트
    $('.modal_root .CategoryItem-A').on('click', function(event) {
        event.preventDefault(); // 기본 이벤트 취소
        const categoryText = $(this).data("category"); // 클릭한 카테고리의 데이터 가져오기
    
        // #### 위치의 span 태그에 카테고리 이름 표시
        $('.CategoryNav_Wrapper span').text(categoryText);

        // 모달창 닫기
        modalCategory();

        // 필터단 유동 적용
        const productSectionTitle = `인기 ${categoryText}`;
        $('.ProductSectionHeader_Title').text(productSectionTitle);

        const productSectionTitle1 = `금주 ${categoryText}`;
        $('.ProductSectionHeader_Title_a').text(productSectionTitle1);

        const productSectionTitle2 = `신규 ${categoryText}`;
        $('.ProductSectionHeader_Title_b').text(productSectionTitle2);
    
    });



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
    


});


function onPageClick(ele) {

    //=====인덱스 전후 번튼 클릭시 페이징
    if(ele==-1) {
        //전버튼
        //console.log(ele);
        let activeIndex = $(".pactive").index();
        //console.log(activeIndex);
        if(activeIndex!='1'){
            paging($('.pactive'),ele);
        }


    }else if(ele==0){
        //후버튼
        //console.log(ele);
        let activeIndex = $(".pactive").index();
        //console.log(activeIndex);
        let length=$(".index_page_btn").length;

        if(activeIndex!=length){
            let way=1;
            paging($('.pactive'),way);
        }
    }else {
        //=====인덱스 숫자 클릭시 페이징
        $(".Home_product_recommend_p").css('display', 'none');

        let indexpage = $(ele).index();
        //console.log("기초"+$(ele).index());
        //console.log($(".index_page_btn").length);
        $(".Home_product_recommend_p").slice(showPro * (indexpage - 1), showPro * indexpage).show();


        //=====인덱스 화면상에서  3개만 보이게
        //첫번째 인덱스 클릭시
        if (indexpage == 1) {
            $(".index_page_btn").eq(indexpage - 1).css("display", "block");
            $(".index_page_btn").eq(indexpage).css("display", "block");
            $(".index_page_btn").eq(indexpage + 1).css("display", "block");
            //마지막 인덱스 클릭시
        } else if (indexpage == $(".index_page_btn").length) {
            $(".index_page_btn").eq(indexpage - 3).css("display", "block");
            $(".index_page_btn").eq(indexpage - 2).css("display", "block");
            $(".index_page_btn").eq(indexpage - 1).css("display", "block");
        } else {
            //인덱스 화면상에서  3개만 보이게
            $(".index_page_btn").css("display", "none");
            $(".index_page_btn").eq(indexpage - 2).css("display", "block");
            $(".index_page_btn").eq(indexpage - 1).css("display", "block");
            $(".index_page_btn").eq(indexpage).css("display", "block");
        }
        //클릭한 인덱스 색깔 바꾸기
        $(".paging>button").removeClass("pactive");
        $(ele).addClass("pactive");

    }
}

//인덱스전후 버튼 함수
function paging(ele,way){
    //=====인덱스 숫자 클릭시 페이징
    $(".Home_product_recommend_p").css('display', 'none');

    let indexpage = parseInt($(ele).index())+parseInt(way);
    //console.log(indexpage);
    //console.log("함수"+$(ele).index());
    //console.log($(".index_page_btn").length);
    $(".Home_product_recommend_p").slice(showPro* (indexpage - 1), showPro * indexpage).show();

    //첫번째 인덱스 클릭시
    if (indexpage == 1) {
        $(".index_page_btn").eq(indexpage - 1).css("display", "block");
        $(".index_page_btn").eq(indexpage).css("display", "block");
        $(".index_page_btn").eq(indexpage + 1).css("display", "block");
        //마지막 인덱스 클릭시
    } else if (indexpage == $(".index_page_btn").length) {
        $(".index_page_btn").eq(indexpage - 3).css("display", "block");
        $(".index_page_btn").eq(indexpage - 2).css("display", "block");
        $(".index_page_btn").eq(indexpage - 1).css("display", "block");
    } else {
        //인덱스 화면상에서  3개만 보이게
        $(".index_page_btn").css("display", "none");
        $(".index_page_btn").eq(indexpage - 2).css("display", "block");
        $(".index_page_btn").eq(indexpage - 1).css("display", "block");
        $(".index_page_btn").eq(indexpage).css("display", "block");
    }

    if(way==-1) {
        //클릭한 인덱스 색깔 바꾸기
        $(".paging>button").removeClass("pactive");
        $(ele).prev().addClass("pactive");
    }else{
        //클릭한 인덱스 색깔 바꾸기
        $(".paging>button").removeClass("pactive");
        $(ele).next().addClass("pactive");
    }
}

   
    
    
  





    




