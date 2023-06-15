function common(){



    //================검색창보이게
    $('.search_input').click(function(){
        //alert("ddd");
        //검색창 높이
        let headerHeight1=$('.global1').css('height');
        let headerHeight2=$('.global2').css('height');
        let bodyHeight=$('body').css('height');
        //alert(bodyHeight);
        headerHeight1=headerHeight1.substr(0,headerHeight1.length-2);
        headerHeight2=headerHeight2.substr(0,headerHeight2.length-2);
        bodyHeight=bodyHeight.substr(0,bodyHeight.length-2);
        let modalheight=bodyHeight-headerHeight1-headerHeight2+20;
        $('.global_modal').css('height',modalheight);
        //alert("ddd");
        $('.global_modal').css('display','block');

        let modalHeight=$('.global_modal').css('height');
        let formHeight=$('.global_modal_form').css('height');
        modalHeight=modalHeight.substr(0,modalHeight.length-2);
        formHeight=formHeight.substr(0,formHeight.length-2);
    
        
        let height=modalHeight-formHeight;
        $('.global_modal_bottom').css('height',height);
       
        $('.global_modal_bottom').click(function(){
            if($('.global_modal').css('display')==='block'){
                $('.global_modal').css('display','none');
            }
        });
        
    });



    //=============찜기능 구현

    var btn=$('.zzim_btn');

    btn.click(function(){
       //찜아닐떄
        if( this.children[0].src.indexOf("black2.png")!=-1){
          // alert("ddd");
            this.children[0].src="/img/redheart2.png";
            //$.ajax 써야 함. async:true 잊지 않고 추가하기
            
        }else {   //찜일떄
            //alert("ddssd");
            this.children[0].src="/img/black2.png";
        }

    });
}



//찜할때 a태그 이동 막기
function preventA(){
    $('.href').click(function(){
        return false;
    })
    
}