<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/css/cart.css" />
<script src="/js/cart.js"></script>
<script>
    function order(){
        if(confirm("주문할까요?")){
        location.href='/order/payPage';
        }
    }
</script>
    <!--헤더끝-->
    <!-- 본문 시작 -->
    <div class="Home">
      <h1 style="font-size: 20px; font-weight: bold; margin-top: 20px">
        장바구니
      </h1>
      <hr style="border-width: 1.5px" />

        <script>
            let sum1=0;
            let sum2=0;

            //onChange 이벤트 관련
            function myFunction(){
                    let value = document.getElementById('').value;
                    console.log(value);
                }







        </script>

      <form class="Home_form" action="payPage.html" onsubmit="return checkCart()">
        <div>
          <button type="button" id="allCk" class="Home_choice_btn all_select">전체선택</button>
          <button type="button" id="selectedDel" class="Home_choice_btn all-delete" onclick="">선택상품 삭제</button>
        </div>

          <c:forEach var="item" items="${list1}" varStatus="one_status">
          <table class="cartlist">
          <tr>
            <td class="img_td">
              <img src="/img/${item.cont_img}" class="item_img" />
            </td>
            <td>
              <div class="show_pro_info">
                <p >
                  ${item.cont_name}
                </p>
                <p >가격 : ${item.one_price}</p>
              </div>
            </td>
            <td>
              <div class="Home_show_qty">
                <div id="result">${item.cl_qty}</div>
                <input type="button"   value="-" class="Home_qty_btn_min btn_min" />
                <input type="button"  value="+" class="Home_qty_btn_plus btn_plus"/>
              </div>
              <div class="Home_show_checkBox">
                <input type="checkbox" id="oneck${one_status.index}" class="Home_cart_check">
              </div>
            </td>
           </tr>
           </table>
          </c:forEach>




          <c:forEach var="item" items="${list2}" varStatus="prod_status">
          <table class="cartlist">
          <tr>
            <td class="img_td">
              <img src="/img/${item.cont_img}" class="item_img" />
            </td>
            <td>
              <div class="show_pro_info">
                <p >
                    ${item.cont_name}
                </p>
                <p >가격 : ${item.prod_price}</p>
              </div>
            </td>
            <td>
              <div class="Home_show_qty">
                <div id="result">${item.cl_qty}</div>
                <input type="button"   value="-" class="Home_qty_btn_min btn_min"/>
                <input type="button"  value="+" class="Home_qty_btn_plus btn_plus"/>
              </div>
              <div class="Home_show_checkBox">
                <input type="checkbox" id="prodck${prod_status.index}" class="Home_cart_check">
              </div>
            </td>
          </tr>
           </table>
          </c:forEach>



        <div class="Home_show_result">
          <hr />
          <p style="font-size: larger; font-weight: bold; display:inline-block">합계금액 :  </p>
          <hr />
          <input type="submit" value="결제하러가기" onsubmit="order()"/>
        </div>

      </form>
    </div>


<%@include file="../footer.jsp"%>