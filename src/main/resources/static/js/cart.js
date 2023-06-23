


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

      for(let i=0;i<length1;i++){
          let price=$(".oneprice"+i).text();
          price=price.replace(",","");
          let qty=$(".one"+i).val();
          sumprice+=price*qty;
      }

       sumprice = sumprice.toLocaleString();
      $(".totalPrice").text(sumprice);
  }

 // 선택한 체크박스에 해당하는 cl_no 가져오기
  function selectedCartno(){
    var arr=[];
    let checkboxSize=$(".Home_cart_check").length;
    let checkCart="";
    for(let i=0;i<checkboxSize;i++){
        if($("#oneck"+i).is(":checked")==true){
            checkCart+=$("#oneck"+i).val()+"#";
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
              if($("#oneck"+i).is(":checked")==true){
                  checkCart+=$("#oneck"+i).val()+"-";
              }

              console.log(checkCart);


              }

              if(checkCart!=""){

                   if(confirm("주문할까요?")){
                          location.href='/cart/order/payPage?cartno='+checkCart;
                    }
              }

  }


  function deleteCheck(){
        let checkboxSize=$(".Home_cart_check").length;

        let params=[];
        for(let i=0;i<checkboxSize;i++){
            if($("#oneck"+i).is(":checked")==true){
                console.log($("#oneck"+i).val());
                params.push($("#oneck"+i).val());
            }

        }

        console.log(params);

        if(params.length==0){
            alert("장바구니에서 삭제하실 상품을 선택해주세요.");
        }else {

            $.ajax({
                type: "POST"
                , url: "/cart/delete"
                , traditional: true
                , data: {"cl_nos": params}
                , async: false
                , success: function (data) {
                    console.log(data);

                    if(data=="OK"){
                        window.location.reload();
                    }
                }
            })



        }
  }