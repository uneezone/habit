
window.onload=function(){

    //common.js
    common();

}



function setProfile(event) {
    $('img').remove('.Home_review_imgs');
  
    
    var sel_files=[];
    var files=event.target.files;
    var filesArr=Array.prototype.slice.call(files);
    console.log(files.length);
   
    if(files.length>5){
        alert("5개이하로 업로드 가능합니다");
    }else {
    filesArr.forEach(function(e){
        sel_files.push(e);

        var reader = new FileReader();

        reader.onload = function(event) {
          var img_html="<img class='Home_review_imgs' src=\""+event.target.result+"\"/>";
    
          $('.Home_show_review').append(img_html);
        };
    
        reader.readAsDataURL(e);
    });
    }   

}