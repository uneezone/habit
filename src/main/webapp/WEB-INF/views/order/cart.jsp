<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<link rel="stylesheet" href="/css/cart.css" />
<script src="/js/cart.js"></script>

    <!--헤더끝-->
    <!-- 본문 시작 -->
    <div class="Home">
      <h1 style="font-size: 20px; font-weight: bold; margin-top: 20px">
        장바구니
      </h1>
      <hr style="border-width: 1.5px" />
      <form class="Home_form" action="payPage.html" onsubmit="return checkCart()">
        <div>
          <button type="button" class="Home_choice_btn all_select">전체선택</button>
          <button type="button"  class="Home_choice_btn all-delete">선택상품 삭제</button>
        </div>
        <table class="cartlist">
          <tr>
            <td>
              <input type="checkbox" name="" id="" class="Home_cart_check">
            </td>
            <td>
              <img src="img/eggtart.jpg" class="item_img" />
            </td>
            <td>
              <p  class="Home_pro_name">
                스콘 2종(플레인/커피초코칩)<br />16~20개 만들기
              </p>
              <p>가격 :</p>
            </td>
            <td>
              <div class="Home_show_qty">
                <div id="result">0</div>
                <input type="button"   value="-" class="Home_qty_btn_min btn_min"/>
                <input type="button" value="+" class="Home_qty_btn_plus btn_plus"/>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox" name="" id="" class="Home_cart_check">
            </td>
            <td>
              <img src="img/eggtart.jpg" class="item_img" />
            </td>
            <td>
              <p class="Home_pro_name">
                에그타르트 만들기<br />16~20개 만들기
              </p>
              <p>가격 :</p>
            </td>
            <td>
              <div class="Home_show_qty">
                <div id="result">0</div>
                <input type="button"   value="-" class="Home_qty_btn_min btn_min"/>
                <input type="button"  value="+" class="Home_qty_btn_plus btn_plus"/>
              </div>
              
            </td>
            
          </tr>
          
          <tr>
            <td>
              <input type="checkbox" name="" id="" class="Home_cart_check">
            </td>
            <td>
              <img src="img/eggtart.jpg" class="item_img" />
            </td>
            <td>
              <p class="Home_pro_name">
                에그타르트 만들기<br />16~20개 만들기
              </p>
              <p>가격 :</p>
            </td>
            <td>
              <div class="Home_show_qty">
                <div id="result">0</div>
                <input type="button"   value="-" class="Home_qty_btn_min btn_min"/>
                <input type="button"  value="+" class="Home_qty_btn_plus btn_plus"/>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <input type="checkbox" name="" id="" class="Home_cart_check">
            </td>
            <td>
              <img src="img/eggtart.jpg" class="item_img" />
            </td>
            <td>
              <p class="Home_pro_name">
                에그타르트 만들기<br />16~20개 만들기
              </p>
              <p>가격 :</p>
            </td>
            <td>
              <div class="Home_show_qty">
                <div id="result">0</div>
                <input type="button"   value="-" class="Home_qty_btn_min btn_min"/>
                <input type="button" value="+" class="Home_qty_btn_plus btn_plus"/>
              </div>
            </td>
          </tr>
        </table>

        <div class="Home_show_result">
          <hr />
          <p style="font-size: larger; font-weight: bold; display:inline-block">합계금액 :</p>
          <hr />
          <input type="submit" value="결제하러가기" />
        </div>
        
      </form>
    </div>


<%@include file="../footer.jsp"%>