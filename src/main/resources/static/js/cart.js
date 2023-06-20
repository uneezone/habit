


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


  //장바구니 물건 선택되었는지 확인
  function checkCart(){

    let proSelect=$('input:checkbox[class=Home_cart_check]:checked').length;
    if(proSelect==0){
      alert("구매하실 상품을 선택해주세요");
      return false;
    }


  }