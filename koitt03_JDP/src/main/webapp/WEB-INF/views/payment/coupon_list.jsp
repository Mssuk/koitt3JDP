<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/content.css" />
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
$(function() {

});
</script>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">쿠폰 조회</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

		<div id="member">
			<h3 class="dep">쿠폰 적용</h3>
			<div class="orderDivNm">
				<table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
					<caption>상품 게시판</caption>
					<colgroup>
					<col width="*" />
					<col width="16%" />
					<col width="14%" class="tw30" />
					<col width="16%" class="pnone" />
					</colgroup>
					<thead>
						<th scope="col">상품명</th>
						<th scope="col">수량</th>
						<th scope="col">판매가</th>
						<th scope="col" class="pnone">배송비</th>
					</thead>
					<tbody>
						<tr>
							<td class="left">
								<p class="img"><img src="/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

								<ul class="goods">
									<li>
										<a href="#">${dto.product_name}</a>
									</li>
								</ul>
							</td>
							<td>${spin} 개</td>
							<c:set var="total" value="${dto.product_price * spin}"/>
							<td>${total} 원</td>					<!-- total = 물품 가격 * 수량 -->
							<td class="pnone"> 2,500 원</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="popGraybox">
				<div class="choose">
					쿠폰선택&nbsp;&nbsp;

					<select id="couponValue" onchange="informCoupon()">
						<c:forEach var="list" items="${cList}">
						<option value="${list.coupon_num}">
							${list.coupon_name} ${list.coupon_pay}
						</option>
						</c:forEach>
					</select>
				</div>



				<div class="result">
					<div class="point">* 옵션가와 배송비는 제외</div>
					<div class="discount">
						쿠폰 할인 금액 : <span id="choice"></span> 원
					</div>
				</div>
				<script>
					function informCoupon(){
						const coupon = $('#couponValue option:selected').text().trim().split(' ')[1];	//trim - 빈칸 줄이기
																										//split - 괄호 안의 기호로 나눠서 배열로 생성
						$('#choice').text(coupon);

						const total = ${total + 2500};

						$('#totalCoupon').text(total-parseInt(coupon));


					}
				</script>
			</div>


			<!-- 쿠폰할인 금액 합계 -->
			<div class="amount popamount">
				<ul class="coupon">
					<li>쿠폰 할인 금액 합계 : <span id="totalCoupon" class="orange"></span> 원</li>
				</ul>
			</div>
			<!-- //쿠폰할인 금액 합계 -->

			
			<!-- 나의 쿠폰 내역 -->
			<h3 class="dep">나의 쿠폰 내역</h3>
			<div class="couponrDiv">
				<table summary="No, 쿠폰번호/쿠폰내용, 등록날짜/사용기간, 할인금액, 상태, 적용순으로 쿠폰내역을 조회하실 수 있습니다." class="orderTable3" border="1" cellspacing="0">
					<caption>나의 쿠폰 내역</caption>
					<colgroup>
					<col width="8%" class="tnone" />
					<col width="*" class="tw40" />
					<col width="26%" class="tw40" />
					<col width="12%" class="tnone" />
					<col width="10%" class="tw20" />
					<col width="10%" class="tnone" />
					</colgroup>
					<thead>
						<th scope="col" class="tnone">NO.</th>
						<th scope="col">쿠폰번호</th>
						<th scope="col">등록날짜 / <span>만기날짜</span></th>
						<th scope="col" class="tnone">할인금액</th>
					</thead>
					<tbody>
						<c:forEach var="list" items="${cList}">
						<tr>
							<td class="tnone">${list.coupon_num}</td>
							<td class="left">${list.coupon_name}</td>
							<td>${list.startday}<br/><span>${list.endday}</span></td>
							<td class="tnone">${list.coupon_pay}</td>
						</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<!-- //나의 쿠폰 내역 -->
			
			<!-- Btn Area -->
			<div class="btnArea">
				<div class="bCenter">
					<ul>
						<li><input type="button" onclick="sendData($('#couponValue option:selected').val())" class="sbtnMini" value="확인"></li>
						<li><a onclick="parent.$.fancybox.close();" href="javascript:window.close()" class="nbtnbig">취소</a></li>
					</ul>
				</div>
			</div>

			<script>
				function sendData(couponData) {

					console.log($('#couponValue option:selected').val());
					var coupon = document.getElementById("choice").innerText;
					var useCoupon = couponData;

					opener.document.getElementById("pInput").value = coupon;
					opener.document.getElementById("pInput1").innerText = coupon;
					opener.document.getElementById("couponStore").value = useCoupon;

					opener.document.getElementById("pInput").onchange();

					window.close();
				}

			</script>
			<!-- //Btn Area -->

		</div>

	</div>

</div>


</div>
</body>
</html>