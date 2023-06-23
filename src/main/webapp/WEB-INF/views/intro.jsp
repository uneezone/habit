<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title></title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/reset.css?after">
  <link rel="stylesheet" href="css/intro.css?after">
  
  <script src="js/jquery.cookie.js"></script>
  <script src="js/intro.js?after"></script>

  
</head>
<body> 

     
    <!--헤더시작--> 
    <header>
      <div class="global1">
        <div class="global_topbar">
            <div class="global_topbar_menu1" >
            <a href="/host"><div class="global_topbar_menu1_menu">호스트 센터</div></a>
            </div>
            <div class="global_topbar_menu2" >
                <c:choose>
                    <c:when test="${sessionScope.s_id==null}">
                        <a href="/newMember" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu">회원가입</div></a>
                        <a href="/login" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu">로그인</div></a>
                    </c:when>
                    <c:otherwise>
                        <a href="/mygage" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu"><span>${sessionScope.s_name}</span>님</div></a>
                        <a href="/logout.do" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu"><button style="display: inline-block; border:0.5px solid rgb(165, 165, 165); background-color: white; border-radius: 2px;">로그아웃</button></div></a>
                    </c:otherwise>
                </c:choose>
<%--
            <a href="login.html" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu"><span>박해빈</span>님</div></a>
            <a href="login.html" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu"><button style="display: inline-block; border:0.5px solid rgb(165, 165, 165); background-color: white; border-radius: 2px;">로그아웃</button></div></a>
--%>
            <a href="" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu">자주 묻는 질문</div></a>
            <a href="" class="global_topbar_menu2_menu"><div class="global_topbar_menu2_menu">공지사항</div></a>
            </div>
        </div>
      </div>

      <!--topvar2-->
      <div class="global2">
        <div class="global_topbar2">
            <div class="global_topbar2_menu1">
                <a href="/category" class="global_topbar2_menu1_a">
                    <div>
                        <img src="img/cate.png" alt="" width="25px"  >
                        <span>카테고리</span>
                    </div>
                </a>
                
                <a href="/" class="global_topbar2_menu1_a_log">
                    <div class="global_topbar2_menu1_a_div">
                        <img src="img/logo%20(2).png" alt="로고" width="70px" >
                    </div>         
                </a>

                <div class="global_topbar2_menu1_search">
                    <div>
                        <form action="search.html">
                            <img src="img/search.png" alt="로고" >
                            <input type="text" class="global_topbar2_menu1_search_input search_input" placeholder="지금 생각나는 취미를 검색하세요.">
                        </form>
                    </div>
                </div>
            </div>

            <div class="global_topbar2_menu2">
                <a href="feed.html">
                    <div class="global_topbar2_menu2_menu">
                        <div>
                            <img src="img/feed.png" alt="로고" width="25px" >
                        </div>
                        <span>피드</span>
                    </div>
                </a>
                <a href="/zzim/list">
                    <div class="global_topbar2_menu2_menu">
                        <div>
                            <img src="img/heartforpage.png" alt="로고" width="25px" >
                        </div>
                        <span>찜</span>
                    </div>
                </a>
                <a href="/cart/list">
                    <div class="global_topbar2_menu2_menu">
                        <div>
                            <img src="img/cart2.png" alt="로고" width="25px" >
                        </div>
                        <span>장바구니</span>
                    </div>
                </a>
                <a href="/mypage">
                    <div class="global_topbar2_menu2_menu">
                        <div>
                            <img src="img/ME.png" alt="로고" width="25px">
                        </div>
                        <span>마이</span>
                    </div>
                </a>
                
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
        </div>
      </div>
    </header>

    <!--헤더끝-->

    <!--모달창-->

    <div class="intro_modal">
        <div class="intro_modal_body">
            <div class="intro_modal_container">
                <img src="img/ask2.png" alt="" class="intro_modal_img">
                <button class="intro_modal_enjoy_btn" onclick="location.href='survey.jsp';">참여하기</button>
            </div>
            <div class="intro_modal_btn">
                <div><input type="checkbox" name="" id="" class="modal_day"> 오늘 하루 보지 않기</div>
                <a><div onclick="closeEvent()" class="modal_close">닫기</div></a>
            </div>
        </div>
    </div>

    <!--모달끝-->

    <!-- 본문 시작 -->

    <div class="Home">
        <div class="Home_wrapper">
            <!--베너-->
            <div class="Home_banner">
                <div class="Home_slider">
                    <div id="slides">
                        <div id="overflow" class="swiper-container">
                          <div class="inner swiper-wrapper">
                            <a>
                            <div data-index="0" class="slide slide_0 swiper-slide" id="slide0">
                                <div class="slide-content">
                                  <h2>Slide0</h2>
                                  <p><img src="img/topban4.png"></p>
                                </div>
                              </div>
                            </a>

                            <a>
                            <div data-index="1" class="slide slide_1 swiper-slide" id="slide1">
                              <div class="slide-content">
                                <h2>Slide1</h2>
                                <p><img src="img/topban.png"></p>
                              </div>
                            </div>
                            </a>
                            <a>
                            <div data-index="2" class="slide slide_2 swiper-slide" id="slide2">
                              <div class="slide-content">
                                <h2>Slide2</h2>
                                <p><img src="img/topban2.png"></p>
                              </div>
                            </div>
                            </a>

                            <a>
                            <div data-index="3" class="slide slide_3 swiper-slide" id="slide3">
                              <div class="slide-content">
                                <h2>Slide3</h2>
                                <p><img src="img/topban3.png"></p>
                              </div>
                            </div>
                            </a>
                  
                            <a>
                            <div data-index="4" class="slide slide_4 swiper-slide" id="slide4">
                              <div class="slide-content">
                                <h2>Slide4</h2>
                                <p><img src="img/topban4.png"></p>
                              </div>
                            </div>
                            </a>


                            <a>
                            <div data-index="5" class="slide slide_5 swiper-slide" id="slide5">
                              <div class="slide-content">
                                <h2>Slide5</h2>
                                <p><img src="img/topban.png"></p>
                              </div>
                            </div>
                            </a>
                          </div>
                        </div>

                    
                    </div>

                      <p class="controller">
                        <!-- &lang: 왼쪽 방향 화살표&rang: 오른쪽 방향 화살표 -->
                        <span class="prev">&lang;</span>  
                        <span class="next">&rang;</span>
                      </p>
                      
                      
                </div>

    

            </div>
            <!--배너끝-->


             <!--아이콘-->
             <div class="Home_icon">
                <div class="Home_icon_wrapper">
                    <div class="Home_icon_container">
                        <a href="" class="Home_icon1_a">
                            <div class="Home_icon1_div">
                                <img src="img/logoBack.png" alt="" >
                                <span>해빗추천</span>
                            </div>
                        </a>
                        <a href="" class="Home_icon1_a">
                            <div class="Home_icon1_div">
                                <img src="img/running.png" alt="">
                                <span>스포츠</span>
                            </div>
                        </a>
                        <a href="" class="Home_icon1_a">
                            <div class="Home_icon1_div">
                                <img src="img/sea.png" alt="">
                                <span>여름시즌</span>
                            </div>
                        </a>
                        <a href="" class="Home_icon1_a">
                            <div class="Home_icon1_div">
                                <img src="img/friendwith.png" alt="">
                                <span>친구초대</span>
                            </div>
                        </a>
                        <a href="" class="Home_icon1_a">
                            <div class="Home_icon1_div">
                                <img src="img/friend.png" alt="" >
                                <span>데이트 추천</span>
                            </div>
                        </a>
                        <a href="" class="Home_icon1_a">
                            <div class="Home_icon1_div">
                                <img src="img/track.png" alt="" >
                                <span>등산</span>
                            </div>
                        </a>
                        <a href="" class="Home_icon1_a">
                            <div class="Home_icon1_div">
                                <img src="img/bake.png" alt="">
                                <span>베이킹</span>
                            </div>
                        </a>
                        <a href="eventList.html" class="Home_icon1_a">
                            <div class="Home_icon1_div">
                                <img src="img/event.png" alt="" >
                                <span>이벤트</span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>

            <!--MD추천-->
            <div class="Home_product_recommend">
                <div class="Home_product_recommend_wrapper">
                    <div>
                        <div>
                            <div class="Home_product_recommend_font1">
                                <h2>MD추천</h2>
                            </div>
                            <div class="Home_product_recommend_font2">
                                <a>전체보기</a>
                            </div>
                        </div>

                        <div class="Home_product_recommend_list">
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/halfstar.png" alt="" class="Home_recommend_star">
                                                    
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/halfstar.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img zzim_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div> 
            
            <!--작은 배너-->
            <div class="Home_smallBanner">
                <div>
                    <img src="" alt="">
                    <div>
                        <a href="#">
                            <img src="img/banner1.png" alt="" class="Home_smallBanner_img">
                        </a>
                        <!--<a>
                            <img src="banner2.png" alt="" class="Home_smallBanner_img">
                        </a>-->
                    </div>
                    <img src="" alt="">
                </div>
            </div>

            <!--인기 목록-->
            <div class="Home_product_recommend">
                <div class="Home_product_recommend_wrapper">
                    <div>
                        <div>
                            <div class="Home_product_recommend_font1">
                                <h2>MD추천</h2>
                            </div>
                            <div class="Home_product_recommend_font2">
                                <a>전체보기</a>
                            </div>
                        </div>

                        <div class="Home_product_recommend_list">
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/halfstar.png" alt="" class="Home_recommend_star">
                                                    
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/halfstar.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img zzim_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div> 
            <!--신규 목록-->
            <div class="Home_product_recommend">
                <div class="Home_product_recommend_wrapper">
                    <div>
                        <div>
                            <div class="Home_product_recommend_font1">
                                <h2>MD추천</h2>
                            </div>
                            <div class="Home_product_recommend_font2">
                                <a>전체보기</a>
                            </div>
                        </div>

                        <div class="Home_product_recommend_list">
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/halfstar.png" alt="" class="Home_recommend_star">
                                                    
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/halfstar.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img zzim_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div> 

            <!--빅데잋처 목록-->
            <div class="Home_product_recommend">
                <div class="Home_product_recommend_wrapper">
                    <div>
                        <div>
                            <div class="Home_product_recommend_font1">
                                <h2>MD추천</h2>
                            </div>
                            <div class="Home_product_recommend_font2">
                                <a>전체보기</a>
                            </div>
                        </div>

                        <div class="Home_product_recommend_list">
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/halfstar.png" alt="" class="Home_recommend_star">
                                                    
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/halfstar.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img zzim_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="Home_product_recommend_p">
                                <a href="" class="href">
                                    <div class="Home_product_recommend_p_div">
                                        <div>
                                            <img src="img/image.jpeg" alt="" width="150px">
                                        </div>
                                        <div>
                                            <button class="Home_product_recommend_p_div_btn zzim_btn" onclick="hello()" onsubmit="return false">
                                                <img src="img/black2.png" alt="" width="40px" class="Home_product_recommend_p_div_img">
                                            </button>
                                        </div>
                                        <div class="Home_product_recommend_p_font">
                                            <div>
                                                <span class="Miniarea">강남/서초</span>
                                                <div>
                                                    청춘유랑단 20 유럽편 With 리슬 모집
                                                </div>
                                                <section class="Home_recommend_img">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                    <img src="img/star.png" alt="" class="Home_recommend_star">
                                                </section>
                                                <hr class="Home_recommend_hr">
                                                <div>
                                                     300,000원
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div> 

            <!--호스트 지원 배너-->
            <div class="Home_smallBanner2">
                <div>
                    <a href="host_newhost.html"><img src="img/host.png" alt=""></a>
                </div>
            </div>

        
        </div>
    </div>

    <!-- 본문 끝-->

<!--footer 시작-->
    <footer>
        <div class="footer">
            <div class="footer_wrap">
                <div class="foot_first">
                        운영시간: 평일/주말 10:00 - 17:00 (점심 : 12:00 - 13:00)
                </div>
                <div class="footer_all">
                        광고/제휴: 123456@gmail.com
                </div>
                <div class="footer_all_2">
                            <h2>HabitBroker</h2>
                            <div>대표 : 2조 | 개인정보 관리 책임자 : 모두</div>
                            <div>서울시 강남구 강남역 3번출구 삼성빌딩</div>
                        <div>

                        </div>
                    </div>
                <div class="footer_all_3">
                        <a>이용약관</a> | 
                        <a>개인정보 처리방침</a> | 
                        <a>위치기반 서비스 이용약관</a>
                </div>
                <div class="footer_copy">
                COPYRIGHT &copy;HABIT
                </div>
            </div>
        </div>
    </footer>
    <!--footer 끝-->

   


  
</body>