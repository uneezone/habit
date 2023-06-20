
window.onload=function(){
    //common.js
    common();

}


function setProfile(event) {
    var reader = new FileReader();

    reader.onload = function(event) {
      $('.Home_proimg').attr('src',event.target.result);
    };

    reader.readAsDataURL(event.target.files[0]);
  }

function checkLength(){


    if($('#user_phone1').val().length!=3){
        $('#user_phone1').val( $('#user_phone1').val().slice(0,3));
    }

    if($('#user_phone2').val().length!=4){
        $('#user_phone2').val($('#user_phone2').val().slice(0,4));
    }

    if($('#user_phone3').val().length!=4){
        $('#user_phone3').val( $('#user_phone3').val().slice(0,4));
    }

}
function myProfile(){
    if($('#user_name').val()==""){
        alert("닉네임을 입력해주세요");
        $("#user_name").focus();
        return false;
    }

    if($("#user_phone1").val()==""||$("#user_phone2").val()==""||$("#user_phone3").val()==""){
        alert("전화번호를 정확하게 입력해주세요");
        $("#user_phone1").focus();
        return false;
    }

    if($("#user_email1").val()==""){
        alert("이메일을 입력해주세요");
        $("#user_email1").focus();
        return false;
    }

    if($("#user_pw").val()=="" || $("#user_pw").val().length<5){
        alert("비밀번호를 5글자이상 입력해주세요");
        $("#user_pw").focus();
        return false;
    }

    if($("#user_birth").val()==""){
        alert("생년월일을 입력해주세요");
        $("#user_birth").focus();
        return false;
    }
}












