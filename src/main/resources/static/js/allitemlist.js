
window.addEventListener('load',function() {

    common();


      // 페이지 로드 후 페이징 초기화
        onPageClick(1);
    
});//================window.onload 끝


// 페이징 함수
function paginate(page) {
    var itemsPerPage = 8; // 페이지당 아이템 수
    var items = document.getElementsByClassName('Home_product_recommend_p');
    var numPages = Math.ceil(items.length / itemsPerPage); // 전체 페이지 수

    // 보여줄 아이템 계산
    var start = (page - 1) * itemsPerPage;
    var end = start + itemsPerPage;

    // 아이템 숨기기
    for (var i = 0; i < items.length; i++) {
        items[i].style.display = 'none';
    }

    // 현재 페이지 아이템 보여주기
    for (var j = start; j < end; j++) {
        if (items[j]) {
        items[j].style.display = 'block';
        }
    }
}

    var currentPage = 1;
// 페이지 버튼 클릭 이벤트 처리
    function onPageClick(page) {

// 이전 버튼을 클릭한 경우 currentPage에서 1을 빼줍니다.
if (page === -1) {
    currentPage = currentPage > 1 ? currentPage - 1 : 1;
}
// 다음 버튼을 클릭한 경우 currentPage 1을 더해줍니다.
else if (page === -2) {
    var numPages = Math.ceil(document.getElementsByClassName('Home_product_recommend_p').length / 8);
    currentPage = currentPage < numPages ? currentPage + 1 : numPages;
}
else {
    currentPage = page;
}

    paginate(currentPage);

    }

    $(document).ready(function() {
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
    });


   
    
    
  





    




