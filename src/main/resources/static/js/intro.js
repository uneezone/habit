function hello(){
    $('.href').click(function(){
        return false;
    })
    
}

$(document).ready(function(){
    if($.cookie("modal")!='check'){
        $('.intro_modal').css('display','block');
    }
});


window.onload=function(){

    
    var btn=$('.zzim_btn');

    btn.click(function(){
       //찜아닐떄
        if( this.children[0].src.indexOf("black2.png")!=-1){
          // alert("ddd");
            this.children[0].src="img/redheart2.png";
            
            
        }else {   //찜일떄
            //alert("ddssd");
            this.children[0].src="img/black2.png";
        }

    });
   



    $('.prev').click(function(){
        //alert('hello');
        let matrix=$('.slide').css('transform');
        //alert(matrix);
        maX=matrix.split(',');
        
        //alert(maX[4]);
        if(parseInt(maX[4])%740==0){
            if(maX[4]===' -2960'){
                //alert("ddd");
                $('.slide').css('transition','transform 0s');
                $('.slide').css('transform','translate(0)');
                maX[4]=0;
            }
            else if(matrix==='none'){
                maX[4]=0;
                //alert(maX[4]);
            }
            maX[4]=(maX[4]-740)+'px';
            //alert(maX[4]);
            
            //transition:transform 0.5s;
            setTimeout(function(){
            $('.slide').css('transition','transform 0.5s');
            $('.slide').css('transform','translate('+maX[4]+')');
            },200)
        
        }
    });
    
    $('.next').click(function(){
        //alert('hello');
        let matrix=$('.slide').css('transform');
        //alert(matrix);
        maX=matrix.split(',');
        
        //alert(maX[4]);
        if(parseInt(maX[4])%740==0){
            if(maX[4]===' 0'||maX[4]===undefined){
                //alert("ddd");
                $('.slide').css('transition','transform 0s');
                $('.slide').css('transform','translate(-2960px)');
                maX[4]=-2960;
            }
            else if(matrix==='none'){
                maX[4]=0;
            //alert(maX[4]);
            }
            maX[4]=(parseInt(maX[4])+740)+'px';
            //alert(maX[4]+'123');
             setTimeout(function(){
            $('.slide').css('transition','transform 0.5s');

            $('.slide').css('transform','translate('+maX[4]+')');
            },200)
        }
    });






    $('.search_input').click(function(){
        $('.global_modal').css('display','block');

        let modalHeight=$('.global_modal').css('height');
        let formHeight=$('.global_modal_form').css('height');
        modalHeight=modalHeight.substr(0,modalHeight.length-2);
        formHeight=formHeight.substr(0,formHeight.length-2);
        //alert(modalHeight);
       // alert(formHeight);
        
        let height=modalHeight-formHeight;
         //alert(height);
        $('.global_modal_bottom').css('height',height);
        //alert($('.global_modal_bottom').css('height'));
        $('.global_modal_bottom').click(function(){
            if($('.global_modal').css('display')==='block'){
                $('.global_modal').css('display','none');
            }
        });
        
    });

    function next(){
                //alert('hello');
                let matrix=$('.slide').css('transform');
                //alert(matrix);
                maX=matrix.split(',');
                
                //alert(maX[4]);
                if(parseInt(maX[4])%740==0){
                    if(maX[4]===' -2960'){
                        //alert("ddd");
                        $('.slide').css('transition','transform 0s');
                        $('.slide').css('transform','translate(0)');
                        maX[4]=0;
                    }
                    else if(matrix==='none'){
                        maX[4]=0;
                        //alert(maX[4]);
                    }
                    maX[4]=(maX[4]-740)+'px';
                    //alert(maX[4]);
                    setTimeout(function(){
                    //transition:transform 0.5s;
                    $('.slide').css('transition','transform 0.5s');
                    $('.slide').css('transform','translate('+maX[4]+')');

                },200)
             }
    }

   setInterval(next,3000);



 
}

function setCookie( name, value, exDay ) {
    var todayDate = new Date();
    todayDate.setDate( todayDate.getDate() + exDay ); 
    document.cookie = name+ "=" +  value + "; path=/; expires=" + todayDate.toGMTString() + ";"
    
}



function closeEvent(){
   
    
    if($('.modal_day').is(':checked')){
       
      $.cookie('modal','check',{expires:1});
      console.log($.cookie("modal"));
            
    }

    $('.intro_modal').css('display','none');
    
   
}
   
    
    
  





    




