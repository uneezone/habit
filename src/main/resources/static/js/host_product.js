
$(function(){

});

function changeStatus(e){
    //alert(e);
    let status=$("#staus"+e).val();
    //alert(status);
    let params={"payd_no":e,"status":status};
    if(status=="R"){
        alert("'사용중' 상태 이외의 상태로 처리해주세요.");
    }else {
        let check = confirm("상태를 변경하시겠습니까?");
        if (status == "Y" || status=="C" && check) {
            $.ajax({
                type: "POST"
                , url: "/host/status"
                , data: params
                , async: false
                , success: function (data) {
                    alert(data);
                    if (data == "ROK" || data =="COK") {
                        location.reload(true);
                    };
                }
            });
        }

    };
}