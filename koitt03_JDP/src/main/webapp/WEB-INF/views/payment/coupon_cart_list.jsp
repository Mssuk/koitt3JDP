<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="../css/reset.css" />
<link rel="stylesheet" type="text/css" href="../css/content.css" />
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
function goParent(){
	
	var getTotal=parent.document.getElementById('jardinTotal').innerText;
	getTotal=getTotal.replace(/,/g,"");
	getTotal=Number(getTotal);
	var discount=document.getElementById('coumoney').value;
	discount=discount.replace(/,/g,"");
	discount=Number(discount);
	if(parseInt(getTotal) < parseInt(discount)){
		if(!(confirm('구매금액보다 쿠폰할인금액이 높습니다. \n 정말 사용하시겠습니까?'))){
			return false;
		}
	}
	parent.document.getElementById('topCou').value = document.getElementById('coumoney').value; //쿠폰에 해당하는 금액 보냄
	parent.document.getElementById('midCou').innerText  = document.getElementById('coumoney').value; //쿠폰에 해당하는 금액 보냄
	parent.document.getElementById('boCou').innerText  = document.getElementById('coumoney').value; //쿠폰에 해당하는 금액 보냄
	parent.document.getElementById('coucou').value = document.getElementById('counum').value; //쿠폰 넘버 보냄
	parent.$.fancybox.close();
}


</script>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">쿠폰 조회</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="../images/btn/btn_input_close.gif" alt="닫기" /></a></p>
		<form id="member" name="form1">	
			<!-- 나의 쿠폰 내역 -->
			<div class="couponrDiv">
				<table summary="No, 쿠폰번호/쿠폰내용, 등록날짜/사용기간, 할인금액, 상태, 적용순으로 쿠폰내역을 조회하실 수 있습니다." class="orderTable3" border="1" cellspacing="0">
					<caption>나의 쿠폰 내역</caption>
					<colgroup>
					<col width="8%" class="tnone" />
					<col width="*" class="tw40" />
					<col width="26%" class="tw40" />
					<col width="12%" class="tnone" />
					<col width="10%" class="tnone" />
					</colgroup>
					<thead>
						<tr>
						<th scope="col">쿠폰번호 / <span>쿠폰내용</span></th>
						<th scope="col">등록날짜 / <span>사용기간</span></th>
						<th scope="col">할인금액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dtos" items="${list }">
							<tr>
								<td class="left">${dtos.coupon_num}[${dtos.coupon_type}]<br/><span>${dtos.coupon_name} </span></td>
								<td class="web"><fmt:formatDate value="${dtos.regist_coupon }" pattern="yyyy-MM-dd hh:mm:ss"/><br/><span>(<fmt:formatDate value="${dtos.startday }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${dtos.endday }" pattern="yyyy-MM-dd"/>)</span></td>
								<td class="mobile"><fmt:formatDate value="${dtos.regist_coupon }" pattern="yyyy-MM-dd"/><br/><span>(<fmt:formatDate value="${dtos.startday }" pattern="yyyy-MM-dd"/><br> ~ <fmt:formatDate value="${dtos.endday }" pattern="yyyy-MM-dd"/>)</span></td>
								<td><span class="orange"><fmt:formatNumber value="${dtos.coupon_pay }" pattern="#,###" /></span>원</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- //나의 쿠폰 내역 -->
			<div class="popGraybox">
				<div class="choose">
					쿠폰선택&nbsp;&nbsp;
					<select name="coupon_num" class="select01" style="width: 150px"
                                    onchange="document.form1.coupon_pay.value =document.form1.coupon_num[document.form1.coupon_num.selectedIndex].value;
                               document.form1.num.value =document.form1.coupon_num[document.form1.coupon_num.selectedIndex].text;
                            " id="emailOne">
							<option value="" disabled="disabled" selected="selected">쿠폰선택</option>
						<c:forEach var="selecdto" items="${list }">
							<option value="<fmt:formatNumber value="${selecdto.coupon_pay }" pattern="#,###" />">${selecdto.coupon_num}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<!-- 쿠폰할인 금액 합계 -->
			<div class="amount popamount">
				<ul class="coupon">
					<li>쿠폰 할인 금액 합계 :<input type="text" name="num" value="" hidden="" id="counum"> 
					<input type="text" value="0" name="coupon_pay" disabled="disabled" style="border: none;background-color:white;font-weight: bold;text-align: right;" class="orange" id="coumoney"> 원</li>
				</ul>
			</div>
			<!-- //쿠폰할인 금액 합계 -->
			<!-- Btn Area -->
			<div class="btnArea">
				<div class="bCenter">
					<ul>								
						<li><a href="javascript:;" onclick="goParent()" class="sbtnMini">확인</a></li>
						<li><a onclick="parent.$.fancybox.close();" href="javascript:;" class="nbtnbig">취소</a></li>
					</ul>
				</div>
			</div>
			<!-- //Btn Area -->

		</form>

	</div>

</div>


</div>
</body>
</html>