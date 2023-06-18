function showDetail(adjustNo,e2){
    console.log(adjustNo);
    $(".show-modal").css("display","block");
    let adjustDate=$(e2).children('td:eq(1)').text();
    let adjustName=$(e2).children('td:eq(2)').text();
    $(".adjust-name").text(adjustName);
    $(".adjust-no").text(adjustNo);
    $(".adjust-date").text(adjustDate);

}

//모달창닫기
$(function() {
    $('.close-modal').click(function () {
        $('.show-modal').css("display", "none");
    });
});

$(document).mouseup(function (e){

    var container = $('.show-modal');

    if( container.has(e.target).length === 0){

        container.css('display','none');

    }

});