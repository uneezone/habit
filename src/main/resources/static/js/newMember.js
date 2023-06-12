
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

