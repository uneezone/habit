<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>결제하기</title>
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>
      <link
      href="https://fonts.googleapis.com/css?family=Montserrat"
      rel="stylesheet"/>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="css/payPage.css">
      <link rel="stylesheet" href="css/reset.css?after" />
    <link rel="stylesheet" href="css/basic.css?after" />
    <script src="html.js?after"></script>

    <script src="js/payPage.js"></script>
    <link rel="stylesheet" href="css/modal.css">
  </head>

  <body>
    <!--헤더시작-->
    <header>
      <div class="global1">
        <div class="global_topbar">
          <div class="global_topbar_menu1">
            <a href=""
              ><div class="global_topbar_menu1_menu">호스트지원</div></a
            >
          </div>
          <div class="global_topbar_menu2">
            <a href="" class="global_topbar_menu2_menu"
              ><div class="global_topbar_menu2_menu">회원가입</div></a
            >
            <a href="" class="global_topbar_menu2_menu"
              ><div class="global_topbar_menu2_menu">로그인</div></a
            >
            <a href="" class="global_topbar_menu2_menu"
              ><div class="global_topbar_menu2_menu">자주 묻는 질문</div></a
            >
            <a href="" class="global_topbar_menu2_menu"
              ><div class="global_topbar_menu2_menu">공지사항</div></a
            >
          </div>
        </div>
      </div>

      <!--topvar2-->
      <div class="global2">
        <div class="global_topbar2">
          <div class="global_topbar2_menu1">
            <a href="" class="global_topbar2_menu1_a">
              <div>
                <img src=" img/cate.png" alt="" width="25px" />
                <span>카테고리</span>
              </div>
            </a>

            <a href="intro.html" class="global_topbar2_menu1_a_log">
              <div class="global_topbar2_menu1_a_div">
                <img src=" img/logo (2).png" alt="로고" width="70px" />
              </div>
            </a>

            <div class="global_topbar2_menu1_search">
              <div>
                <form action="">
                  <img src=" img/search.png" alt="로고" />
                  <input
                    type="text"
                    class="global_topbar2_menu1_search_input search_input"
                    placeholder="지금 생각나는 취미를 검색하세요."
                  />
                </form>
              </div>
            </div>
          </div>

          <div class="global_topbar2_menu2">
            <a href="">
              <div class="global_topbar2_menu2_menu">
                <div>
                  <img src=" img/feed.png" alt="로고" width="25px" />
                </div>
                <span>피드</span>
              </div>
            </a>
            <a href="">
              <div class="global_topbar2_menu2_menu">
                <div>
                  <img src=" img/heartforpage.png" alt="로고" width="25px" />
                </div>
                <span>찜</span>
              </div>
            </a>
            <a href="cart.html">
              <div class="global_topbar2_menu2_menu">
                  <div>
                      <img src="img/cart2.png" alt="로고" width="25px" >
                  </div>
                  <span>장바구니</span>
              </div>
          </a>
            <a href="">
              <div class="global_topbar2_menu2_menu">
                <div>
                  <img src=" img/ME.png" alt="로고" width="25px" />
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

    <!-- 본문 시작 -->
    <div class="Home">
      <section class="Home_form">
      <form action="payDone.html">
        <div id="pagetitle_pay">결제하기</div>

        <p class="paypage_title">프립정보</p>
        <section id="fripinfo">
          <div id="frip_img">
            <img src="img/eggtart.jpg" />
          </div>
          <div>
            <p>[망원] 카페 인기메뉴! 마카오식 에그타르트 만들기</p>
            <span>별점 : 4.9 (후기 106개)</span>
          </div>
        </section>
        <hr />
        <section>
          <ul style="font-size: large; font-weight: bold; padding: 20px">
            옵션정보
          </ul>
          <li>호스트와 연락을 통해 날짜를 지정</li>
          <li>이용권/1개</li>
        </section>
        <hr style="border-width: 4px" />

        <section>
          <p class="paypage_title">결제수단</p>
          <div class="select_payment">
            <input type="radio" id="by_card" name="payby" checked /><label
              for="by_card"
              style="font-size: 15px;" >신용/체크카드</label
            >
            <input type="radio" id="by_etc" name="payby" /><label for="by_etc"
            style="font-size: 15px;">기타결제</label
            >
          </div>
        </section>

        <hr style="border-width: 4px" />
        <section>
          <p class="paypage_title">에너지</p>
          <input type="text" placeholder="  사용할 에너지를 입력하세요" class="pay_energy" />
          <input type="button" value="전액사용" id="E_btn" />
          <p>참고 : 에너지는 100E부터 사용가능합니다.</p>
        </section>

        <hr style="border-width: 4px" />

        <section style="display: inline-block">
          <span class="paypage_title">총 결제금액</span>
          <input type="text" name="tot_price" id="tot_price" value="30,000"  readonly/>
          <hr />
          <br />
          <div style="display: inline-block">
            <a href="#" class="tos_a">개인정보 제 3자 제공 동의</a>
            <button class="tos_btn">보기</button>
            <br /><br />
            <a href="#" class="tos_a">결제 대행 서비스 이용약관</a>
            <button class="tos_btn">보기</button>
          </div>
        </section>
        <hr style="border-width: 4px" />
        <section>
          <p class="paypage_title">이번 프립은 누구와 하시나요?</p>
          <p style="padding: 10px">
            다음번 크루님이 좋아할만한 프립을 추천해드릴게요.
          </p>
          <div id="with_somebody">
            <label class="box-radio-input">
              <input
                type="radio"
                name="cp_item"
                value="옵션1"
                checked="checked"
              />
              <span>혼자</span>
            </label>
            <label class="box-radio-input">
              <input type="radio" name="cp_item" value="옵션2" />
              <span>연인</span>
            </label>
            <label class="box-radio-input">
              <input
                type="radio"
                name="cp_item"
                value="옵션3"
                checked="checked"
              />
              <span>친구</span>
            </label>
            <label class="box-radio-input">
              <input
                type="radio"
                name="cp_item"
                value="옵션4"
                checked="checked"
              />
              <span>가족</span>
            </label>
            <label class="box-radio-input">
              <input
                type="radio"
                name="cp_item"
                value="옵션5"
                checked="checked"
              />
              <span>배우자</span>
            </label>
          </div>
        </section>
        <hr>
        <p
          style="
            text-align: center;
            font-weight: lighter;
            font-size: small;
            margin-top: 40px;
            margin-bottom: 20px;
          "
        >
          위 내용을 모두 확인하였으며, 결제에 동의합니다.
        </p>
        <input type="submit" value="결제하기" />
      </form>
    </section>
    </div>

    <!-- 본문 끝-->

    <!--footer 시작-->
    <footer>
      <div class="footer">
        <div class="footer_wrap">
          <div class="foot_first">
            운영시간: 평일/주말 10:00 - 17:00 (점심 : 12:00 - 13:00)
          </div>
          <div class="footer_all">광고/제휴: 123456@gmail.com</div>
          <div class="footer_all_2">
            <h2>HabitBroker</h2>
            <div>대표 : 2조 | 개인정보 관리 책임자 : 모두</div>
            <div>서울시 강남구 강남역 3번출구 삼성빌딩</div>
            <div></div>
          </div>
          <div class="footer_all_3">
            <a>이용약관</a> | <a>개인정보 처리방침</a> |
            <a>위치기반 서비스 이용약관</a>
          </div>
          <div class="footer_copy">COPYRIGHT &copy;HABIT</div>
        </div>
      </div>
    </footer>
    <!--footer 끝-->
  </body>
</html>