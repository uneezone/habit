
//참여하기 클릭시 옵션창 출력
$(document).ready(function() {
    function openModal() {
        document.getElementById('openModalButton').style.display = 'none';
        document.getElementById('productOptionsModal').style.display = 'block';
    }

    function closeModal() {
        document.getElementById('openModalButton').style.display = 'block';
        document.getElementById('productOptionsModal').style.display = 'none';
    }

    function hidePurchaseCell() {
        let purchaseCells = document.querySelectorAll('.PurchaseCell_Wrapper');
        purchaseCells.forEach(function(purchaseCell) {
            purchaseCell.style.display = 'none';
        });
    }

    document.getElementById('openModalButton').addEventListener('click', openModal);

    // 페이지 로드 시 productOptionsModal 창을 감춥니다.
    closeModal();
    // 화면 로딩 시 PurchaseCell_Wrapper 클래스를 숨깁니다.
    hidePurchaseCell();

    document.getElementById('openModalButton').addEventListener('click', openModal);

    // 클릭했을 때 닫기 기능을 추가합니다.
    let closeToggle = document.querySelector('.Toggle_Purch');
    closeToggle.onclick = function () {
        closeModal();
    };

    // OptionItem_Wrapper를 클릭했을 때 이벤트 핸들러를 추가합니다.
    let optionItems = document.querySelectorAll('.OptionItem_Wrapper');
    optionItems.forEach(function(optionItem) {
        optionItem.addEventListener('click', function() {
            let purchaseCells = document.querySelectorAll('.PurchaseCell_Wrapper');
            purchaseCells.forEach(function(purchaseCell) {
                purchaseCell.style.display = 'flex'; // 또는 'flex', 'inline-block' 등의 원하는 디스플레이 값을 설정하세요.
            });

            // 클릭 시 BottomContent_Wrapper 창을 표시합니다.
            let bottomContentWrapper = document.querySelector('.BottomContent_Wrapper');
            bottomContentWrapper.style.display = 'block'; // 또는 'flex', 'inline-block' 등의 원하는 디스플레이 값을 설정하세요.

            // 클릭 시 OptionItem_Wrapper 창을 접습니다.
            let optionItemsWrapper = document.querySelector('.OptionItem_Wrapper');
            optionItemsWrapper.style.display = 'none';
        });
    });

    function toggleOptionItems() {
        let optionItemsWrapper = document.querySelector('.OptionItem_Wrapper');
        if (optionItemsWrapper.style.display === 'none' || optionItemsWrapper.style.display === '') {
            optionItemsWrapper.style.display = 'block';
        } else {
            optionItemsWrapper.style.display = 'none';
        }
    }

    let optionSelectTitle = document.querySelector('.OptionSelect_Title');
    optionSelectTitle.addEventListener('click', toggleOptionItems);

});


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
}

function movePage(page) {
    var currentPage = $("#currentPage").val();
    var pageSize = 10;

    // 현재 페이지 번호가 없으면 1페이지로 설정
    if (currentPage == null) {
        currentPage = 1;
    }

    // 이동할 페이지 번호를 구합니다.
    var targetPage = currentPage + page - 1;

    // 이동할 페이지 번호가 범위를 벗어나면 1페이지로 설정
    if (targetPage < 1) {
        targetPage = 1;
    } else if (targetPage > pageCount) {
        targetPage = pageCount;
    }

    // 페이지 번호를 설정
    $("#currentPage").val(targetPage);

    // 게시판의 글을 조회
    getBoards(targetPage, pageSize);
}

// 게시판의 글을 조회
function getBoards(currentPage, pageSize) {
    $.ajax({
        url: "/board/list",
        type: "GET",
        data: {
            currentPage: currentPage,
            pageSize: pageSize
        },
        success: function (response) {
            var boards = response.data;
            $(".board-list").html(boards);
        }
    });
}

