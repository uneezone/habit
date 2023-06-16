
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


  function join_check() {
      //변수에 담아주기
      var user_id = document.getElementById("user-id");
      var user_pw = document.getElementById("user_pw");
      var user_name = document.getElementById("user_name");
      var user_gender = document.getElementById("user_gender");
      var user_phone = document.getElementById("user_phone");
      var user_email = document.getElementById("user_email");
      var user_birth = document.getElementById("user_birth");

      if (user_id.value == "") { //해당 입력값이 없을 경우 같은말: if(!uid.value)
          alert("아이디를 입력하세요.");
          user_id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
          return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
      };

      if (user_pw.value == "") {
          alert("비밀번호를 입력하세요.");
          user_pw.focus();
          return false;
      };

      // 아이디 길이 검사
      if (user_id.length < 7) {
          alert("아이디는 7자 이상이어야 합니다.");
          return false;
      }

      // 아이디 특수문자 검사
      var re = /^[a-zA-Z0-9_!@#$%^&*()-]+$/;
      if (!re.test(id)) {
          alert("아이디는 영문자, 숫자, 특수문자(_!@#$%^&*())만 사용 가능합니다.");
          return false;
      }
      return true;
      //비밀번호 길이 검사
      if (user_pw.length < 8) {
          alert("비밀번호는 8자 이상이어야 합니다.");
          return false;
      }

      // 닉네임 길이 검사
      if (user_name.length < 3) {
          alert("닉네임은 3자 이상이어야 합니다.");
          return false;
      }


  }
