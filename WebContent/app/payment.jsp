<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CookpangPayment</title>
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--로고글씨체-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Josefin+Slab:ital@1&display=swap" rel="stylesheet">
<!--글씨체 여기까지3줄-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/payment.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/payment.js">

  <script>
    window.onload = function(){
        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
            //카카오 지도 발생
            new daum.Postcode({
                oncomplete: function(data) { //선택시 입력값 세팅
                    document.getElementById("address_kakao").value = data.address; // 주소 넣기
                    document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
                }
            }).open();
        });
    }
  </script>
  



</head>
<body>
    <div class="Payment-main">
        <div class="Payment-body">
          <div class="Payment-bodytools">
            <div class="Payment-body-header">
                <div class="pay-logo">
                  <a href="#">Payment</a>
                  <h3>결제하기</h3>
                </div>
            </div>


            <div class="Payment-body-main">
              <!--아코디언메뉴-->
              <form action="/order/orderListOk.or" method="post"><!--맨마지막 버튼 이후에 닫기있음-->
               <div class="que">
               <span>주문 고객</span>
              </div>
              <div class="anw">
                <span>
                  <label for="anw1">
                   <h3>주문 고객 이름</h3>
                    <input id="anw1-1" type="text" name="userName" value="${order.getUserName()}">
                    <h3>휴대전화 번호</h3>
                    <input id="anw1-2" type="text" name="userPhoneNumber" value="${order.getUserPhoneNumber()}">
                    <h3>(필수)이메일 주소</h3>
                    <input id="anw1-3" type="text" name="userEmail" value="${order.getUserEmail()}" >
                   </label>
                 </span>
              </div>

               <div class="que2">
                <span>배송지</span>
              </div>
              <div class="anw2">
               <span>
                  <h3>받는분 이름</h3>
                   <input id="anw2-1" type="text" name="orderRecipient" >
                   <h3>주소</h3>
                   <input type="text" class="anw2-2" id="address_kakao" name="address" placeholder="주소 찾기" readonly />
                   <h3>상세 주소</h3>
                   <input id="anw2-3" type="text" placeholder="상세주소를 입력해 주세요." name="addressDetail" />
                   <h3>(선택)배송 메세지</h3>
                   <input id="anw2-4" type="text" placeholder="배송메세지를 입력해 주세요" name="orderMessage"/>
               </span>
              </div>
               <!--여기까지 배송지입력-->

            <div class="pmt">
              <span>주문상품</span>
                <img src="#" alt="">
                <span>여기에 주문 상품 갯수 적기</span>
             </div>

             <div class="amt">
              <div class="checkoutProductMainSection">
                <span>
                      <div class="checkoutProductSection" style="display: flex;">
                        <img src="#" alt="#"><!--물품사진-->
                        <li class="CheckoutProductsSectionstyle">
                  <span>
                  <a class="productName" href="#">
                  <input type="hidden" name="selectedValues">
                  <!-- 여기는 모달창에서 선택된 체크박스의 이름을 넣어야함 -->
                  
                  </a>
                    <ul>
                      <li>
                        <p name="orderItemNumber">아이템</p>
                        <!-- 수량은 버튼수량 갯수를 확인 후 해야함 / 금액도...  -->
                        <p name="orderItemQuantity"> 아이템</p>
                        <p name="ingredientPrice"> 아이템</p>
                      </li>
                    </ul>
                  </span>
                  </li>
            </div>
           </span>


           <span>
            <div class="checkoutProductSection" style="display: flex;">
              <img src="#" alt="#"><!--물품사진-->
              <li class="CheckoutProductsSectionstyle">
        <span>
        <a class="productName" href="#"> </a>
          <ul>
            <li>
              <p>본품 금액</p>
              <p></p>
              <p>총 금액</p>
            </li>
          </ul>
        </span>
        </li>
        </div>
      </span>
          </div>
             </div>

          <!--여기까지 제품목록-->
            </div> <!--바디툴-->
  <div class="Payment-body-footer">
              <div class="amount">
              <p>결제 금액</p>
              <strong style="color: red;">
              93,000원
              </strong> 
               </div>

               <div class="amount-tag">
                <p>총 상품금액</p>
                <p style="text-align: end;">39,000원</p>
                <p>총 배송비</p>
                <p style="text-align: end;">2000원</p>
                <p>할인금액</p>
                <p style="text-align: end;">0원</p>
               </div>
               <!--여기까지 결제금액-->

               <div class="pay-method">
                <p>결제 수단</p>
                <span class="pay-mtd">신용카드</span>
                 </div>


                 <div class="pay-method-radio-section">
                  <ul class="pay-radio">

                    <li>
                      <div class="radioButton">
                        <input type="radio" id="card" name="payMethod">
                        <label for="card">
                          <span>신용카드</span>
                        </label>
                      </li>

                      <li>
                      <input type="radio" id="card" name="payMethod">
                      <label for="card">
                          <span>휴대폰</span>
                        </label>
                      </li>


                      <li>
                        <input type="radio" id="card" name="payMethod">
                        <label for="card">
                            <span>무통장 입금</span>
                          </label>
                        </li>

                        <li>
                          <input type="radio" id="card" name="payMethod">
                          <label for="card">
                              <span>payco</span>
                            </label>
                          </li>

                          <li>
                            <input type="radio" id="card" name="payMethod">
                            <label for="card">
                                <span>네이버페이</span>
                              </label>
                            </li>

                            <li>
                              <input type="radio" id="card" name="payMethod">
                              <label for="card">
                                  <span>카카오페이</span>
                                </label>
                              </li>
                    </ul>
                  </div>
              <!----------여기까지 결제수단---------->
                  <div class="pay-last-button">
                    <button type="submit" class="pay-button-style">결제하기</button>
                  </div>

                </form><!--요기 닫기-->


                 </div>
              </div>
           </div>
          </div>
        </div>
    </div>


    <script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/assets/js/payment.js"></script>
  </body>

  



</html>