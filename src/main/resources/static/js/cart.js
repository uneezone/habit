


  window.onload=function(){
    //common.js
    common();

    //수량 플러스 마이너스
    let min=$('.btn_min');

    min.click(function(){
        //alert(this.previousSibling.previousSibling.innerText);
        if(parseInt(this.previousSibling.previousSibling.innerText)==1){
            this.previousSibling.previousSibling.innerText=1;
        }else{
        this.previousSibling.previousSibling.innerText-=1;
        }
    })

    let plus=$('.btn_plus');

    plus.click(function(){

        this.previousSibling.previousSibling.previousSibling.previousSibling.innerText
        =parseInt(this.previousSibling.previousSibling.previousSibling.previousSibling.innerText)+1;
    })


    //전체선택
    $('.all_select').click(function(){
      //alert("ddd");
      $('.Home_cart_check').prop('checked',true);
    });



}


 // 선택한 체크박스에 해당하는 cl_no 가져오기
  function selectedCartno(){
    var arr=[];
    let checkboxSize=$(".Home_cart_check").length;
    let checkCart="";
    for(let i=0;i<checkboxSize;i++){
        if($("#ck"+i).is(":checked")==true){
            checkCart+=$("#ck"+i).val()+"#";
            arr.push();
        }

    }
    return arr;
    console.log(checkCart);


  }

  function order(){
      let checkboxSize=$(".Home_cart_check").length;
      let checkCart="";
      for(let i=0;i<checkboxSize;i++){
              if($("#ck"+i).is(":checked")==true){
                  checkCart+=$("#ck"+i).val()+"-";
              }

              console.log(checkCart);


              }

              if(checkCart!=""){
                   if(confirm("주문할까요?")){
                          location.href='/cart/order/payPage?cartno='+checkCart;
                    }
              }

  }
