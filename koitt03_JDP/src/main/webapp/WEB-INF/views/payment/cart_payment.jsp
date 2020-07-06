<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<jsp:include page="../common/header.jsp"/>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<c:if test="${list==null }">
	<script type="text/javascript">
		alert('잘못된 접근입니다.');
		location.href='/main';
	</script>
</c:if>

    <script type="text/javascript">
    function post(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	jQuery("#zip1").val(data.zonecode);
	      		jQuery("#address1").val(data.address);
	      		jQuery("#address2").focus();
	        }
	    }).open();
	}
    function post2(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	jQuery("#zip2").val(data.zonecode);
	      		jQuery("#address3").val(data.address);
	      		jQuery("#address4").focus();
	        }
	    }).open();
	}
    
    </script>
 <!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="/main">HOME</a></li>
				<li class="last">주문/결제</li>
			</ol>
		</div>
		
		<div id="outbox">		
			
			<!-- maxcontents -->
			<div id="maxcontents">
				<div id="mypage">
					<h2><strong>주문/결제</strong></h2>
					
					<!-- 주문 상품 --><%--주문상품은 session에서 정보를 가져온다 --%>
					<h3 class="dep">주문 제품 확인</h3>
					<div class="orderDivNm">
						<table summary="주문 제품 확인 게시판으로 상품명, 가격, 수량, 합계순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>주문 제품 확인</caption>
							<colgroup>
							<col width="*" />
							<col width="16%" class="tnone" />
							<col width="14%" />
							<col width="16%" class="tw28"/>
							</colgroup>
							<thead>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격  <c:if test="${member!=null }">/포인트</c:if></th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
							</thead>
							<tbody>
								<c:forEach var="dtos" items="${list }">
									<tr>
										<td class="left">
											<p class="img"><img src="${dtos.pdto.front_image1 }" alt="상품" width="66" height="66" /></p>
	
											<ul class="goods">
												<li>
													<a href="/product/detail?pro_num=${dtos.pdto.pro_num }">${dtos.pdto.product_name }</a>
												</li>
											</ul>
										</td>
										<td class="tnone">
											<em><fmt:formatNumber value="${dtos.pdto.sales_price }" pattern="#,###" /></em> 원
											<c:if test="${member!=null }">
												<!-- 회원일 시 -->
												<br/><span class="pointscore"><fmt:formatNumber value="${dtos.pdto.sales_price*0.01 }" pattern="#,###" /> Point</span>
												<!-- //회원일 시 -->
											</c:if>
										</td>
										<td><span>${dtos.bmdto.count }</span> 개</td>
										<td class="cart_price"><span><fmt:formatNumber value="${dtos.pdto.sales_price*dtos.bmdto.count }" pattern="#,###" /></span> 원</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="poroductTotal">
						<ul>	
							<li class="whole_total">상품 합계금액 <strong>1,132,310</strong> 원</li>
							<li class="whole_deliver">+ 배송비 <strong>2,500</strong> 원</li>
							<li class="result_total">= 총 합계 <strong>1,134,810</strong> 원</li>
						</ul>
					</div>
					<!-- //주문 상품 -->
					

			<!-- 주문자 주소 입력 -->
					<form  action="/DoOrder" name="form1" method="post" class="ko_order">
					<h3 class="diviLeft">주문자 주소 입력</h3>
					<c:if test="${member!=null }">
					<div class="diviRight">
						<ul>
							<li>수정 내용을 회원정보에도 반영합니다.&nbsp;&nbsp;</li>
							<li  id="saveMemInfo"><a href="javascript:;">회원정보반영</a></li>
						</ul>
					</div>
					</c:if>
					<div class="checkDiv">
						<table summary="주문자 주소를 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문자 주소 입력</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<c:choose>
									<c:when test="${member!=null }">
										<td><input type="text" class="w134" value="${member.name }" name="name" readonly="readonly"/></td>
									</c:when>
									<c:otherwise>
										<td><input type="text" class="w134" value="" name="name" /></td>
									</c:otherwise>
									</c:choose>
								</tr>

								<tr>
									<th scope="row"><span>주소</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="text" class="w134" id="zip1" value="${member.address1 }" readonly="readonly" name="address1"/>&nbsp;
											</li>
											<li><a href="javascript:;" onclick="post()" class="addressBtn"><span>우편번호 찾기</span></a></li>
											<li class="pt5"><input type="text" class="addressType2" name="address2" id="address1" value="${member.address2 }" readonly="readonly"/></li>
											<li class="pt5"><input type="text" class="addressType2" name="address3" id="address2" value="${member.address3 }" /></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>이메일</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" class="w136" value="${member.email1 }" name="email1"/></li>
											<li><span class="valign">&nbsp;@&nbsp;</span></li>
											<li class="r10"><input type="text" class="w135" name="email2" value="${member.email2 }"/></li>
											<li>
												<select name="lstMail" class="select01" style="width: 150px"
                                    onchange="document.form1.email2.focus();
                              document.form1.email2.value =document.form1.lstMail[document.form1.lstMail.selectedIndex].value;
                            " id="emailOne">
													<option value="">직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="hanmail.net">hanmail.net</option>
													<option value="nate.com">nate.com</option>    
													<option value="yahoo.co.kr">yahoo.co.kr</option>    
													<option value="gmail.com">gmail.com</option>    
												</select>&nbsp;&nbsp;&nbsp;
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰 번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="phone1" id="phoneOne">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" value="${member.phone2 }" name="phone2" /> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" class="w74" maxlength="4" name="phone3"  value="${member.phone3 }"/> 
											<c:if test="${member==null }">
											<span style="color:#fe6124;display: inline-block;margin: 4px;">*주문 조회시 사용됩니다</span>
											</c:if>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>전화번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="tel1" id="telOne">
													<option value="02">02</option>
													<option value="031">031</option>
													<option value="032">032</option>
													<option value="033">033</option>
													<option value="041">041</option>
													<option value="042">042</option>
													<option value="043">043</option>
													<option value="051">051</option>
													<option value="052">052</option>
													<option value="053">053</option>
													<option value="054">054</option>
													<option value="055">055</option>
													<option value="061">061</option>
													<option value="062">062</option>
													<option value="063">063</option>
													<option value="064">064</option>
													<option value="070">070</option>
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" value="${member.tel2 }" name="tel2"/> <span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" value="${member.tel3 }"  name="tel3"/></li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문자 주소 입력 -->
   <script type="text/javascript">
		$("#saveMemInfo").click(function(){
		var ad=document.getElementById('zip1').value;
    	var namech=/^[가-힣]{2,10}$/;
    	if(form1.name.value==''){
    		alert('주문자명이 입력되지 않았습니다.');
    		form1.name.focus();
    		return false;
    	}
    	if(!(namech.test(form1.name.value))){
    		alert('이름의 형식이 잘못되었습니다.');
    		form1.name.value='';
    		form1.name.focus();
    		return false;
    	}
    	if(ad==''){
    		alert('주소가 입력되지않았습니다');
    		form1.address2.focus();
    		return false;
    	}
    	if(form1.email1.value==''){
    		alert('이메일이 입력되지 않았습니다.');
    		form1.email1.focus();
    		return false;
    	}
    	if(form1.email2.value==''){
    		alert('이메일이 입력되지 않았습니다.');
    		form1.email2.focus();
    		return false;
    	}
    	if(form1.phone2.value==''){
    		alert('휴대폰번호가 입력되지 않았습니다.');
    		form1.phone2.focus();
    		return false;
    	}
    	if(form1.phone3.value==''){
    		alert('휴대폰번호가 입력되지 않았습니다.');
    		form1.phone3.focus();
    		return false;
    	}
    	if(form1.tel2.value==''){
    		alert('전화번호가 입력되지 않았습니다.');
    		form1.tel2.focus();
    		return false;
    	}
    	if(form1.tel3.value==''){
    		alert('전화번호가 입력되지 않았습니다.');
    		form1.tel3.focus();
    		return false;
    	}
    	
 	       if(confirm("회원정보에 반영하시겠습니까?")){
    		
	 	       var ad1=document.getElementById('zip1').value;
	 	       var ad2=document.getElementById('address1').value;
    		$.ajax({
    	        url : "/mypage/updateMemInfo",   // 받을 url
    	        type : "POST",   
    	        data: JSON.stringify({
    	        	name:form1.name.value,
    	        	address1:String(ad1),
    	        	address2:String(ad2),
    	        	address3:String(form1.address3.value),
    	        	email1:String(form1.email1.value),
    	        	email2:String(form1.email2.value),
    	        	phone1:String(form1.phone1.value),
    	        	phone2:String(form1.phone2.value),
    	        	phone3:String(form1.phone3.value),
    	        	tel1:String(form1.tel1.value),
    	        	tel2:String(form1.tel2.value),
    	        	tel3:String(form1.tel3.value)
    	        }),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
    	        contentType: "application/json",
    	        success : function (data) {
    	           if(data== 1){ //리턴값이 ok일 경우
    	              alert('회원정보가 업데이트 되었습니다');
    	           }else if(data == 0){
    					alert('업데이트 실패\n 잠시후 다시 시도해주세요');
    				}
    	        },
    	        error : function(){ //오류일경우 경고창을 띄움
    	           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: updateError)");
    	        }
    	     });
    	}
    	
    })
    
    
    </script>

			<!-- 수취자 주소 입력 -->
					<h3 class="dep">
						수취자 주소 입력
						<input type="checkbox" id="infosame" onclick="sameInfo()" />
						<label for="infosame">주문자 정보와 동일</label>
					</h3>
					</form>
					
					<form  action="/DoOrder" name="form2" method="post" class="ko_order">
					<div class="checkDiv">
						<table summary="수취자 주소를 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>수취자 주소 입력</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td><input type="text" class="w134" name="p_name"  /></td>
								</tr>

								<tr>
									<th scope="row"><span>주소</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="text" class="w134" id="zip2" name="p_address1" readonly="readonly"/>&nbsp;
											</li>
											<li><a href="javascript:;" onclick="post2()" class="addressBtn"><span>우편번호 찾기</span></a></li>
											<li class="pt5"><input type="text" class="addressType2" name="p_address2" id="address3" readonly="readonly"/></li>
											<li class="pt5"><input type="text" class="addressType2" name="p_address3" id="address4" /></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰 번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="p_phone1" id="p_phone1">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4"  name="p_phone2"/> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" class="w74" maxlength="4"  name="p_phone3" /></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>전화번호</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="p_tel1" id="p_tel1">
													<option value="02">02</option>
													<option value="031">031</option>
													<option value="032">032</option>
													<option value="033">033</option>
													<option value="041">041</option>
													<option value="042">042</option>
													<option value="043">043</option>
													<option value="051">051</option>
													<option value="052">052</option>
													<option value="053">053</option>
													<option value="054">054</option>
													<option value="055">055</option>
													<option value="061">061</option>
													<option value="062">062</option>
													<option value="063">063</option>
													<option value="064">064</option>
													<option value="070">070</option>
												</select>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" name="p_tel2"/> <span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" name="p_tel3"/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>배송시 요구사항</span></th>
									<td><textarea class="demandtta" name="p_demand"></textarea></td>
								</tr>
							</tbody>
						</table>
						
					</div>
					</form>
			<!-- //수취자 주소 입력 -->
		<!-- //주문자 주소 입력 -->
			<c:if test="${member!=null }">
					<form  action="/DoOrder" method="post" name="coupoint"  class="ko_order">
			<!-- 쿠폰 및 포인트 사용 -->
					<h3 class="dep">쿠폰 및 포인트 사용</h3>
					<div class="checkDiv">
						<table summary="쿠폰 및 포인트를 입력 또는 확인 할 수 있는 란으로 총 주문금액, 배송비, 쿠폰할인, 포인트 사용, 총 결제금액 순으로 입력 또는 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>쿠폰 및 포인트 사용</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>총 주문금액</span></th>
									<td class="whole_total"><strong>1,132,310</strong> 원</td>
								</tr>
								<tr>
									<th scope="row"><span>배송비</span></th>
									<td class="whole_deliver"><strong>2,500</strong> 원 (선불)</td>
								</tr>
								<tr>
									<th scope="row"><span>쿠폰 할인</span></th>
									<td>
										<ul class="pta">
											<li class="r10">
												<input type="text" class="w134" id="topCou" value="" disabled="disabled"/>&nbsp;&nbsp;
												<span class="valign"><strong></strong><input type="text" name="coupon_num" hidden=""  id="coucou" value="">원</span>
											</li>
											<li class="r10"><span class="valign">( 보유 쿠폰 내역 : ${member.couponCount }장 )&nbsp;</span></li>
											<c:if test="${member.couponCount>0 }">
												<li><a href="coupon_cart_list" class="nbtn">쿠폰목록</a></li>
											</c:if>
										</ul>
									</td>
								</tr>

								<!-- 회원 일시 -->
								<tr>
									<th scope="row"><span>포인트 사용</span></th>
									<td>
										<ul class="pta">
											<li class="r10">
												<input type="text" class="w134" id="topPoin" value="" name="pay_point" onblur="changePoint(this)"/>&nbsp;&nbsp;
												<span class="valign"><strong>Point</strong></span>
											</li>
											<li>
												<span class="valign">( 사용 가능 포인트 : </span>
												<span class="orange"><fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
												<span class="valign"> Point)</span>
											</li>
										</ul>
									</td>
								</tr>
								<!-- //회원 일시 -->
								
								<tr>
									<th scope="row"><span>총 결제금액</span></th>
									<td>
										<ul class="pta">
											<li><span class="valign"><span class="money whole_total"><strong>1,133,810 </strong>원</span> (총주문금액 <span class="whole_total"><strong>1,132,310</strong></span>원 + 배송비 <span class="whole_deliver"><strong>1,132,310</strong></span>원
											 - 포인트 <span><strong class="mempoint">0</strong></span>원 - 쿠폰할인 <span><strong id="midCou">0</strong></span>원 = <span class="money whole_total"><strong>1,133,801</strong></span>원)</span></li>
										</ul>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
					</form>
			<!-- //쿠폰 및 포인트 사용 -->
			</c:if>

			<!-- 총 주문금액 -->
					<div class="amount">
						
						<c:choose>
							<c:when test="${member!=null }">
								<!-- 회원 일때 -->
								<h4 class="member">총 주문금액</h4>
								<!-- 회원 일때 -->
							</c:when>
							<c:otherwise>
								<!-- 비회원 일때  -->
								<h4>총 주문금액</h4>
							</c:otherwise>
						</c:choose>	

						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won whole_total"><strong>1,132,310</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won whole_deliver"><strong>2,500</strong> 원</span>
							</li>
							<c:if test="${member!=null }">
								<!-- 회원 일때만 -->
								<li>
									<span class="title">포인트 할인</span>
									<span class="won">-<strong class="mempoint">0</strong> P</span>
								</li>
								<li>
									<span class="title">쿠폰 할인</span>
									<span class="won">-<strong id="boCou">0</strong> 원</span>
								</li>
								<!-- //회원 일떄만 -->
							</c:if>
							<li style="color:#fe6124;border-bottom: none;">
								<span class="won del_text"><strong style="color:#fe6124;"></strong></span>
							</li>
						</ul>

						<ul class="total">
							<c:if test="${member!=null }">
								<!-- 회원 일때만 -->
								<li class="mileage">(적립 포인트 <strong>11,324</strong> Point) </li>
								<!-- //회원 일때만 -->
							</c:if>

							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money result_total"><span id="jardinTotal">1,134,810</span> 원</li>
						</ul>
					</div>
			<!-- //총 주문금액 -->


			<!-- 결제수단 선택 -->
				<form name="payMethod" method="post"  class="ko_order" action="/DoOrder">
					<h3 class="dep">결제수단 선택</h3>
					<div class="checkDiv">
						<table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>결제수단 선택</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>결제수단</span></th>
									<td>
										<ul class="pta">
											<li>
												<input type="radio" id="method01" name="method" checked="checked" value="card"/><label for="method01">신용카드 결제</label>
											</li>
											<li>
												<input type="radio" id="method02" name="method" value="bankpay"/><label for="method02">실시간 계좌이체</label>
											</li>
											<li>
												<input type="radio" id="method03" name="method" value="banktemp"/><label for="method03">가상계좌</label>
											</li>
											<li>
												<input type="radio" id="method04" name="method" value="banktemp2"/><label for="method04">가상계좌(에스크로)</label>
											</li>
											<li>
												<input type="radio" id="method05" name="method" value="banktemp3"/><label for="method05">무통장 입금</label>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				<!-- //결제수단 선택 -->

					<div class="disnone method01"><!-- 신용카드 -->
						<p class="orderalert"><strong>[신용카드]</strong> 온라인상에서 소유하신 신용카드를 통해, 전자결제를 진행합니다.</p>
					</div>
					<div class="disnone method02"><!-- 실시간 계좌이체 -->
						<p class="orderalert"><strong>[실시간 계좌이체]</strong> 주민번호, 계좌 정보, 공인인증서를 통해 실시간 계좌이체를 진행합니다.</p>
					</div>
					<div class="disnone method03"><!-- 가상계좌 -->
						<p class="orderalert"><strong>[가상계좌]</strong> 원하시는 은행으로 가상계좌를 발급해 드리며, 발급된 계좌로 구매대금을 직접 송금합니다.</p>
					</div>
					<div class="disnone method04"><!-- 가상계좌 에스크로 -->
						<p class="orderalert"><strong>[가상계좌 에스크로]</strong> 원하시는 은행으로 가상계좌를 발급해 드리며, 발급된 계좌로 구매대금을 직접 송금합니다.(에스크로 안전결제)</p>
					</div>

					<div class="disnone method05"><!-- 무통장 입금 -->
						<p class="orderalert"><strong>[무통장 입금]</strong> 쇼핑몰의 대표 계좌로 구매대금을 직접 송금합니다.</p>

						<div class="checkDiv">
							<table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다." class="checkTable" border="1" cellspacing="0">
								<caption>결제수단 선택</caption>
								<colgroup>
								<col width="22%" class="tw30" />
								<col width="*" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><span>입금은행</span></th>
										<td>
											<select name="bank">
												<option value="" disabled="disabled" selected="selected">선택하세요.</option>
												<option value="국민">국민</option>
												<option value="신한">신한</option>
												<option value="우리">우리</option>
												<option value="농협">농협</option>
												<option value="카카오뱅크" >카카오뱅크</option>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><span>입금자 명</span></th>
										<td><input type="text" class="w134" name="bank_name"/></td>
									</tr>
									<tr>
										<th scope="row"><span>영수증 신청</span></th>
										<td>
											<select name="receiptChk">
												<option value="none">신청안함</option>
												<option value="individual">개인소득공제</option>
												<option value="corporate">사업자 지출증빙</option>
											</select>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						
						<!-- 개인소득공제 -->
						<div class="receipt individual">
							<dl>
								<dt>발급방식</dt>
								<dd>
									<ul>
										<li><input type="radio" name="individual" id="phone" checked="checked" value="phone" /><label for="phone">휴대폰</label></li>
<!-- 										<li><input type="radio" name="individual" id="securitynumber" /><label for="securitynumber">주민등록번호</label></li> -->
										<li><input type="radio" name="individual" id="cashreceipts" value="cashreceipts"/><label class="fn" for="cashreceipts">현금영수증카드</label></li>
									</ul>
								</dd>
							</dl>
							
							<ul class="inform phone"><!-- 휴대폰 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" name="phone_name"/></li>
								<li class="title cb">휴대폰</li>
								<li><input type="text" class="w134" name="phone_num"/></li>
							</ul>

<!-- 							<ul class="inform securitynumber">주민등록번호 -->
<!-- 								<li class="title">이름</li> -->
<!-- 								<li class="interval"><input type="text" class="w134" /></li> -->
<!-- 								<li class="title cb">주민등록번호</li> -->
<!-- 								<li><input type="text" class="w134" /></li> -->
<!-- 							</ul> -->

							<ul class="inform cashreceipts"><!-- 현금영수증카드 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" name="cashreceipts_name"/></li>
								<li class="title2 cb">현금영수증카드 번호</li>
								<li><input type="text" class="w134" name="cashreceipts_num"/></li>
							</ul>

							<p class="txt">* 번호 입력시 하이픈(-)을 제외한 숫자만 입력하세요.</p>
						</div>
						<!-- //개인소득공제 -->

						<!-- 사업자 지출증빙 -->
						<div class="receipt corporate">
							<dl>
								<dt>발급방식</dt>
								<dd>
									<ul>
										<li><input type="radio" name="corporate" id="corporatenumber" checked="checked" value="corporatenumber"/><label for="corporatenumber">사업자번호</label></li>
										<li><input type="radio" name="corporate" id="corporate_cash" value="corporate_cash" /><label class="fn" for="corporate_cash">현금영수증카드</label></li>
									</ul>
								</dd>
							</dl>

							<ul class="inform corporatenumber"><!-- 사업자번호 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134" name="corporatenumber_name"/></li>
								<li class="title2 cb">사업자등록 번호</li>
								<li><input type="text" class="w134" name="corporatenumber_num"/></li>
							</ul>

							<ul class="inform corporate_cash"><!-- 현금영수증카드 -->
								<li class="title">이름</li>
								<li class="interval"><input type="text" class="w134"  name="corporate_cash_name"/></li>
								<li class="title2 cb">현금영수증카드 번호</li>
								<li><input type="text" class="w134" name="corporate_cash_num"/></li>
							</ul>

							<p class="txt">* 번호 입력시 하이픈(-)을 제외한 숫자만 입력하세요.</p>
						</div>
						<!-- //사업자 지출증빙 -->

					</div>
					</form>

						
				
					

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="orderCenter">
							<ul>
								<li><a href="javascript:history.go(-1);" class="nbtnbig iw0140">뒤로가기</a></li>
								<li><a href="javascript:;" id="OrdergoGo" class="sbtnMini iw0140">주문 / 결제</a></li>								
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					<script type="text/javascript">
		$("#OrdergoGo").click(function(){
    	
    	var namech=/^[가-힣]{2,10}$/;
    	 var ad1=document.getElementById('zip1').value;
	       var ad2=document.getElementById('zip2').value;
    	//주문자
    	if(form1.name.value==''){
    		alert('주문자명이 입력되지 않았습니다.');
    		form1.name.focus();
    		return false;
    	}
    	if(!(namech.test(form1.name.value))){
    		alert('이름의 형식이 잘못되었습니다.');
    		form1.name.value='';
    		form1.name.focus();
    		return false;
    	}
    	if(ad1==''){
    		alert('주소가 입력되지않았습니다');
    		form1.address3.focus();
    		return false;
    	}
    	if(form1.email1.value==''){
    		alert('이메일이 입력되지 않았습니다.');
    		form1.email1.focus();
    		return false;
    	}
    	if(form1.email2.value==''){
    		alert('이메일이 입력되지 않았습니다.');
    		form1.email2.focus();
    		return false;
    	}
    	if(form1.phone2.value==''){
    		alert('휴대폰번호가 입력되지 않았습니다.');
    		form1.phone2.focus();
    		return false;
    	}
    	if(form1.phone3.value==''){
    		alert('휴대폰번호가 입력되지 않았습니다.');
    		form1.phone3.focus();
    		return false;
    	}
    	if(form1.tel2.value==''){
    		alert('전화번호가 입력되지 않았습니다.');
    		form1.tel2.focus();
    		return false;
    	}
    	if(form1.tel3.value==''){
    		alert('전화번호가 입력되지 않았습니다.');
    		form1.tel3.focus();
    		return false;
    	}
    	//수취자
    	if(form2.p_name.value==''){
    		alert('수취자명이 입력되지 않았습니다.');
    		form2.p_name.focus();
    		return false;
    	}
    	if(!(namech.test(form2.p_name.value))){
    		alert('이름의 형식이 잘못되었습니다.');
    		form2.p_name.value='';
    		form2.p_name.focus();
    		return false;
    	}
    	if(ad2==''){
    		alert('주소가 입력되지않았습니다');
    		form2.p_address3.focus();
    		return false;
    	}
    	if(form2.p_phone2.value==''){
    		alert('휴대폰번호가 입력되지 않았습니다.');
    		form2.p_phone2.focus();
    		return false;
    	}
    	if(form2.p_phone3.value==''){
    		alert('휴대폰번호가 입력되지 않았습니다.');
    		form2.p_phone3.focus();
    		return false;
    	}
    	if(form2.p_tel2.value==''){
    		alert('전화번호가 입력되지 않았습니다.');
    		form2.p_tel2.focus();
    		return false;
    	}
    	if(form2.p_tel3.value==''){
    		alert('전화번호가 입력되지 않았습니다.');
    		form2.p_tel3.focus();
    		return false;
    	}
    	if(payMethod.method.value=='banktemp3'){
    		if(payMethod.bank_name.value==''){
    			alert('입금자명을 입력해주세오.');
    			payMethod.bank_name.focus();
        		return false;
    		}
    	}
 	    
    	var params = $('form').serialize();
 	       
    		$.ajax({
    	        url : "/DoOrder",   // 받을 url
    	        type : "POST",   
    	        data: params,  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
    	        success : function (data) {
    	        	var findString = "까지";
    	           if(data!= 0&&data.indexOf(findString)<0){ //리턴값이 ok일 경우
    	              alert('주문성공');
    	           	  location.href='/orderConfirmC?o_num='+data;
    	           }else if(data == 0){
    					alert('통신오류로 주문실패');
    			   }else if(data.indexOf(findString)>0){
    					alert(data+'\n장바구니로 이동합니다.');
    					location.href='/goCart';
    				}
    	        },
    	        error : function(){ //오류일경우 경고창을 띄움
    	           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: orderError)");
    	        }
    	     });
    	
    })
    
    
    </script>


				</div>
			</div>
			<!-- //maxcontents -->


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	//전화형태
	$('.w74').keyup(function() {
		var c=$(this).val();
		$(this).val(c.replace(/[^0-9]/g,""));
	});
	//이메일형태(뒷주소)
	$('.w135').keyup(function() {
		var c=$(this).val();
		$(this).val(c.replace(/[^a-zA-Z.]/g,""));
	});
	//이메일형태(앞주소)
	$('.w136').keyup(function() {
		var c=$(this).val();
		$(this).val(c.replace(/[^0-9a-zA-Z_]/g,""));
	});
	
	
	
	// select, radio - display check

	// 1 Step Radio
	var firstchk = $("input:radio[name=method]:checked").attr("id");
	$("div." + firstchk).css("display","block");
	$("input:radio[name=method]").click(function(){
		var divchk = $(this).attr("id");		
		$(".disnone").css("display","none");
		$("div." + divchk).css("display","block");
	});
	
	// 2 Step 영수증 Select
	var firstselect = $("select[name=receiptChk] option:selected").attr("value");
	$("div." + firstselect).css("display","block");
	$("select[name=bank]").css("width","125px");
	$("select[name=receiptChk]").css("width","112px");
	$("select[name=receiptChk]").change(function() {
        $(".receipt").css("display","none");
        if($(this).val() == "none"){ $(".receipt").css("display","none"); }
        else if($(this).val() == "individual"){ $(".individual").css("display","block"); }
		else{ $(".corporate").css("display","block"); }

		var firstindi = $("input:radio[name=individual]:checked").attr("id");
		var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
		$("ul." + firstindi).css("display","block");		
		$("ul." + firstcorp).css("display","block");
    });
	
	// 3-1 Step 발급방식 - 개인
	var firstindi = $("input:radio[name=individual]:checked").attr("id");
	$("ul." + firstindi).css("display","block");
	$("input:radio[name=individual]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});

	// 3-2 Step 발급방식 - 사업자
	var firstcorp = $("input:radio[name=corporate]:checked").attr("id");
	$("ul." + firstcorp).css("display","block");
	$("input:radio[name=corporate]").click(function(){
		var divchk = $(this).attr("id");
		$(".inform").css("display","none");
		$("ul." + divchk).css("display","block");
	});

	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var couponCheck = 760;
	}else{
		var couponCheck = 320;
	}

	$(".nbtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : couponCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			$('#fancybox-wrap').css('top','400px');
			$('html,body').animate({ scrollTop: 400 }, 500);
			});
		}
	});
	
		//처음합계
		var first=get_total();
		 $( ".whole_total strong" ).text(first);
		//처음배송료
		var f_deliver=get_deliver(first);
		$( ".whole_deliver strong" ).text(f_deliver);
		//처음 총가격
		var f_total=get_re_total(first,f_deliver);
		$( ".result_total strong" ).text(f_total);
		$( ".result_total span" ).text(f_total);
		$( ".money span" ).text(f_total);
		$( ".money strong" ).text(f_total);
		//처음 포인트(적립예정)
		var f_point=get_point(first);
		$(".mileage strong").text(f_point);
		
		//쿠폰 적용
		$(".nbtn").click(function(){
			$("#topCou").focus();
		})
		
		if($("#topCou").focus()){
			$(window).scroll(function(){
				if($("#topCou").val()!=''){
					var point=$("#topPoin").val();
		 			var coupon=$("#topCou").val();
		 			var total=get_total();
		 			var deliver=get_deliver(total);
		 			//변동 최종 금액
		 			var lastTotal=get_mem_total(total,deliver,coupon,point)
		 			$( ".money span" ).text(lastTotal);
		 			$( ".money strong" ).text(lastTotal);
				}
			});
		}//
});
</script>
<c:if test="${member!=null }">
	<script type="text/javascript">
	$(function(){
	//select박스
	$('select[id="emailOne"]').find('option:contains("${member.email2}")').prop("selected",true);
	$('select[id="phoneOne"]').find('option:contains("${member.phone1}")').prop("selected",true);
	$('select[id="telOne"]').find('option:contains("${member.tel1}")').prop("selected",true);
	
		//사용포인트 변동확인
		$('#topPoin').keyup(function() {
			var c=$(this).val().replace(/(^0+)/, "");
			$(this).val(c.replace(/[^0-9]/g,""));
			var k=$(this).val();
			if(parseInt(k)>'${member.point}'){
				alert('보유 포인트를 넘을 수 없습니다');
				$(this).val('');
			}
		});
	});
	
	</script>
</c:if>

<script type="text/javascript">
		//회원 합계(합계+배송비-포인트-쿠폰가격)
		function get_mem_total(a,b,c,d){
			a=a.replace(/[^0-9]/g,'');
			a=Number(a);
			b=b.replace(/[^0-9]/g,'');
			b=Number(b);
			c=c.replace(/[^0-9]/g,'');
			c=Number(c);
			if(d==''){d=0;}else{
			d=d.replace(/[^0-9]/g,'');}
			d=Number(d);
			var result=a+b-c-d;
			if(result<0){
				result=0;
			}
			result=result.toLocaleString();
			return result;
		}
		//포인트 반영
		function changePoint(a){
			var point=a.value;
			if(point==''){
				point=0;
			}
			$(".mempoint").text(point);
			var coupon=$("#topCou").val();
			var total=get_total();
			var deliver=get_deliver(total);
			//변동 최종 금액
			var lastTotal=get_mem_total(total,deliver,coupon,point)
			$( ".money span" ).text(lastTotal);
			$( ".money strong" ).text(lastTotal);
		}	

		
//전체 상품 금액합계
function get_total() {
		var cnt=$(".cart_price").length;
		var sum=0;
		for(var i=0;i<cnt;i++){
		var cart=$(".cart_price span").eq(i).text();
		cart=cart.replace(/[^0-9]/g,'');
		cart=Number(cart);
		sum+=cart;
		}
		sum=sum.toLocaleString();
		return sum;
}
//배송비
function get_deliver(x){
	var del=2500;
	x=x.replace(/[^0-9]/g,'');
	x=Number(x);
	if(x>=15000){
		del=0;
	}
	if(del==0){
		$( ".del_text strong" ).text("*15,000원 이상 구매시 배송비 무료");
	}else{
		$( ".del_text strong" ).text("");
	}
	
	del=del.toLocaleString();
	return del;
}
//적립예정포인트
function get_point(x){
	x=x.replace(/[^0-9]/g,'');
	x=Number(x);
	var point=0.01*x;
	point=parseInt(point);
	point=point.toLocaleString();
	return point;
}



//합계(상품가격+배송비)
function get_re_total(a,b){
	a=a.replace(/[^0-9]/g,'');
	a=Number(a);
	b=b.replace(/[^0-9]/g,'');
	b=Number(b);
	var result=a+b;
	result=result.toLocaleString();
	return result;
}


//수취자 정보 동일
function sameInfo(){
	var chk = $("#infosame").is(":checked");//.attr('checked');
    if(chk) {
		form2.p_name.value=form1.name.value;
	 	form2.p_address1.value=$("#zip1").val();
	 	$("#zip2").attr( 'readonly', true ); 
	 	form2.p_address2.value=$("#address1").val();
	 	$("#address3").attr( 'readonly', true ); 
		form2.p_address3.value=form1.address3.value;
		$("#p_tel1 option[value="+form1.tel1.value+"]").prop("selected", true);
		form2.p_tel2.value=form1.tel2.value;
		form2.p_tel3.value=form1.tel3.value;
		$("#p_phone1 option[value="+form1.phone1.value+"]").prop("selected", true);
		form2.p_phone2.value=form1.phone2.value;
		form2.p_phone3.value=form1.phone3.value;
    }
}

	
</script>


		</div>
	</div>
	<!-- //container -->
 
 
 
 
<jsp:include page="../common/footer.jsp"/>   