
window.onload=function(){
    //common.js
    common();
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
        success: function(response) {
            var boards = response.data;
            $(".board-list").html(boards);
        }
    });
}