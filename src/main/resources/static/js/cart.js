


  window.onload=function(){
    //common.js
    common();

    //총합계산
    calc();

    //수량 플러스 마이너스
    let min=$('.btn_min');

    min.click(function(){
        //alert(this.previousSibling.previousSibling.innerText);
        if(parseInt(this.previousSibling.previousSibling.value)==1){
            this.previousSibling.previousSibling.value=1;
        }else{
        this.previousSibling.previousSibling.value-=1;
        };

        calc();
    })

    let plus=$('.btn_plus');

    plus.click(function(){

        this.previousSibling.previousSibling.previousSibling.previousSibling.value
        =parseInt(this.previousSibling.previousSibling.previousSibling.previousSibling.value)+1;

        calc();
    })


    //전체선택
    $('.all_select').click(function(){
      //alert("ddd");
      $('.Home_cart_check').prop('checked',true);
    });




}

function calc(){
      let sumprice=0;

      let length1=$(".cartlist1").length;
      let length2=$(".cartlist2").length;
      for(let i=0;i<length1;i++){
          let price=$(".oneprice"+i).text();
          price=price.replace(",","");
          let qty=$(".one"+i).val();
          sumprice+=price*qty;
      }

      for(let i=0;i<length2;i++){
          let price=$(".prodprice"+i).text();
          price=price.replace(",","");
          let qty=$(".prod"+i).val();
          sumprice+=price*qty;
      }
       sumprice = sumprice.toLocaleString();
      $(".totalPrice").text(sumprice);
  }

  //장바구니 물건 선택되었는지 확인
  function checkCart(){

    let proSelect=$('input:checkbox[class=Home_cart_check]:checked').length;
    if(proSelect==0){
      alert("구매하실 상품을 선택해주세요");
      return false;
    }


  }




