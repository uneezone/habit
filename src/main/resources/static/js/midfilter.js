

$(document).ready(function () {

    let selectedCategory = localStorage.getItem("newCategory") || localStorage.getItem("selectedCategory");
    let selectedMiddle = localStorage.getItem("selectedMiddle");


        if (selectedMiddle && selectedCategory) {
            localStorage.removeItem("newCategory");
            localStorage.setItem("selectedCategory", selectedCategory);


            // 필터단 유동 적용
            const productSectionTitle = `인기 ${selectedMiddle}`;
            $(".ProductSectionHeader_Title_mid_a").text(productSectionTitle);

            const productSectionTitle1 = `금주 ${selectedMiddle}`;
            $(".ProductSectionHeader_Title_mid_b").text(productSectionTitle1);

            const productSectionTitle2 = `신규 ${selectedMiddle}`;
            $(".ProductSectionHeader_Title_mid_c").text(productSectionTitle2);

            const ButtonLinkAllProduct = `${midHotListCount}개의 ${selectedMiddle} 전체보기 `;
            $('.ButtonLinkAllProduct_mid').text(ButtonLinkAllProduct);

        }

    // 중분류 버튼 클릭 이벤트
    $(".midbtn").on("click", function (event) {
        event.preventDefault();

        const selectedMiddle = $(this).text();
        localStorage.setItem("selectedMiddle", selectedMiddle);

        // 전체 클릭 시 기본 url 반환
        if (selectedMiddle === "전체") {
            window.location.href = `/category/${selectedCategory}`;
        } else {
            // 원하는 페이지로 이동
            window.location.href = `/category/${selectedCategory}/${selectedMiddle}`;
        }
    });

    // =====인기===== 전체보기 버튼 클릭 이벤트
    $(".ProductSectionHeader_Link").on("click", function (event) {
        event.preventDefault();

        // 원하는 페이지로 이동
        window.location.href = `${selectedMiddle}/hot`;
    });

    // =====신규===== 전체보기 버튼 클릭 이벤트
    $(".ProductSectionHeader_Link_new").on("click", function (event) {
        event.preventDefault();

        // 원하는 페이지로 이동
        window.location.href = `${selectedMiddle}/new`;
    });


// =====전체보기====== 버튼 클릭 이벤트
    $(".ButtonLinkAllProduct_mid").on("click", function (event) {
        event.preventDefault();


        // 원하는 페이지로 이동
        window.location.href = `${selectedMiddle}/all`;

    });

});


