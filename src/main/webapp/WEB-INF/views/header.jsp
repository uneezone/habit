<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/reset.css?after">
  <link rel="stylesheet" href="css/basic.css?after" />
  <script src="js/jquery.cookie.js"></script>
  <link rel="stylesheet" href="css/modal.css">
  <script src="js/common.js"></script>
  

</head>
<body> 
   <!--헤더시작--> 
   <header>
    <div class="global1">
      <div class="global_topbar">
          <div class="global_topbar_menu1" >
          <a href="/host"><div class="global_topbar_menu1_menu">호스트센터</div></a>
          </div>
          <div class="global_topbar_menu2" >
          <a href="member/newMember.html" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu">회원가입</div></a>
          <a href="member/login.html" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu">로그인</div></a>
          <a href="" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu">자주 묻는 질문</div></a>
          <a href="" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu">공지사항</div></a>
          </div>
      </div>
    </div>

    <!--topvar2-->
    <div class="global2">
      <div class="global_topbar2">
          <div class="global_topbar2_menu1">
              <a href="" class="global_topbar2_menu1_a">
                  <div>
                      <img src="img/cate.png" alt="" width="25px"  >
                      <span>카테고리</span>
                  </div>
              </a>
              
              <a href="/" class="global_topbar2_menu1_a_log">
                  <div class="global_topbar2_menu1_a_div">
                      <img src="img/logo (2).png" alt="로고" width="70px" >      
                  </div>         
              </a>

              <div class="global_topbar2_menu1_search">
                  <div>
                      <form action="">
                          <img src="img/search.png" alt="로고" >
                          <input type="text" class="global_topbar2_menu1_search_input search_input" placeholder="지금 생각나는 취미를 검색하세요.">
                      </form>
                  </div>
              </div>
          </div>

          <div class="global_topbar2_menu2">
              <a href="">
                  <div class="global_topbar2_menu2_menu">
                      <div>
                          <img src="img/feed.png" alt="로고" width="25px" >  
                      </div>
                      <span>피드</span>
                  </div>
              </a>
              <a href="member/zzim.html">
                  <div class="global_topbar2_menu2_menu">
                      <div>
                          <img src="img/heartforpage.png" alt="로고" width="25px" >  
                      </div>
                      <span>찜</span>
                  </div>
              </a>
              <a href="order/cart.html">
                <div class="global_topbar2_menu2_menu">
                    <div>
                        <img src="img/cart2.png" alt="로고" width="25px" >  
                    </div>
                    <span>장바구니</span>
                </div>
            </a>
              <a href="member/mypage.html">
                  <div class="global_topbar2_menu2_menu">
                      <div>
                          <img src="img/ME.png" alt="로고" width="25px">  
                      </div>
                      <span>마이</span>
                  </div>
              </a>
          </div>
      </div>
    </div>


    <div class="global_modal">
        <div class="global_modal_form">
            <div class="global_topbar2_search">
                <div class="global_modal_wrapper">
                    <div>
                        <section>
                            <div class="global_modal_search">
                                <div>최근검색어</div>
                                <a href="#"><div class="global_modal_search_del">지우기</div></a>
                            </div>
                    
                            <a href="#"><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                            <a><div class="global_modal_searchNew">소개팅</div></a>
                        </section>
                        <hr>
                        <section>
                            <div class="global_modal_search">인기검색어</div>
                            <a href="#"><div class="global_modal_searchResult">소개팅</div></a>
                            <a href="#"><div class="global_modal_searchResult">소개팅</div></a>
                            <a href="#"><div class="global_modal_searchResult">소개팅</div></a>
                        </section>
                       
                    </div>
                </div>
            </div>
            
        </div>
        <div class="global_modal_bottom"></div>
    </div>
  </header>

  <!--헤더끝-->