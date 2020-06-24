<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp"/>
<%
    if(session.getAttribute("loginInfo") == null){
        response.sendRedirect("/membership/login");
    }
%>
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="/main">HOME</a></li>
				<li><a href="/mypage/ordercheck">MY PAGE</a></li>
				<li class="last">회원정보 수정</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title">MY PAGE<span>마이페이지</span></div>
				<ul>	
					<li><a href="ordercheck" id="leftNavi1">주문/배송 조회</a></li>
	                <li><a href="takeback_delivery" id="leftNavi2">반품/배송 현황</a></li>
	                <li><a href="cart" id="leftNavi3">장바구니</a></li>
	                <li><a href="wishlist" id="leftNavi4">위시리스트</a></li>
	                <li><a href="coupon" id="leftNavi5">나의 쿠폰</a></li>
	                <li><a href="point" id="leftNavi6">나의 포인트</a></li>
	                <li><a href="inquiry" id="leftNavi7">1:1문의</a></li>
	                <li><a id="leftNavi8">회원정보 수정</a></li>
	                <li class="last"><a href="get_leave" id="leftNavi9">회원 탈퇴</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(8,0);</script> 


			<!-- contents -->
			<div id="contents">
				<form action="modifyMember" method="post">  
				<div id="mypage">
					<h2><strong>회원정보 수정</strong><span>회원님의 개인 정보를 수정하실 수 있습니다.</span></h2>
					
					<div class="memberbd">
						<table summary="이름, 아이디, 비밀번호, 비밀번호 확인, 이메일, 이메일수신여부, 주소, 휴대폰, 유선전화, 생년월일 순으로 회원가입 정보를 수정할수 있습니다." class="memberWrite" border="1" cellspacing="0">
							<caption>회원가입 수정</caption>
							<colgroup>
								<col width="22%" class="tw30" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td>${mdto.name }</td>
								</tr>
								<tr>
									<th scope="row"><span>아이디</span></th>
									<td>${mdto.id }</td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호 변경 *</span></th>
									<td><input type="password" name="pw"/></td>
									<!-- <td><a href="password_change.html" class="nbtnMini iw86">비밀번호 변경</a></td> -->
								</tr>
								<tr>
									<th scope="row"><span>이메일</span></th>
										<script>
												function selectEmail(frm) {
													var email = frm.emailList.selectedIndex;
													switch(email){
														case 0:
															frm.email2.value='';
															break;
														case 1:
															frm.email2.value = 'naver.com';
															break;
														case 2:
															frm.email2.value = 'damu.net';
															break;
														case 3:
															frm.email2.value = 'nate.com';
															break;
														case 4:
															frm.email2.value = 'gmail.com';
															break;
													}
													return true;
												}
											</script>
									<td>
										<ul class="pta">
											<li><input type="text" class="w134" name="email1" id="email1" value="${mdto.email1 }"/></li>
											<li><span class="valign">@</span></li>
											<li class="r10"><input type="text" class="w134" name="email2" value="${mdto.email2 }"/></li>
											<li><select id="emailList" onchange="selectEmail(this.form)" name="emailList">
													<option value=0 selected="selected">직접입력</option>
													<option value=1>naver.com</option>
													<option value=2>daum.net</option>
													<option value=3>nate.com</option>
													<option value=4>gmail.com</option>
											</select>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>이메일 수신여부 *</span></th>
									<td>
										<p>쟈뎅에서 진행되는 이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까?</p>
										<ul class="question">
											<li>
												<input type="radio" name="email_check" id="receive_yes" class="radio_t" checked="checked"/><label for="receive_yes">예</label>
											</li>
											<li>
												<input type="radio"name="email_check" id="receive_no" class="radio_t"/><label for="receive_no">아니오</label>
											</li>
										</ul>
										<p class="gray">* 거래관련 정보는 고객님의 거래안전을 위하여 이메일 수신거부와 관계없이 발송됩니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>주소 *</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" id="address1" class="w134" name="address1" readonly="readonly" value="${mdto.address1 }"/>&nbsp;</li>
											<li><input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"></li>
											<li class="pt5"><input type="text" id="address2" class="addressType" name="address2" value="${mdto.address2 }" readonly /></li>
											<li class="pt5"><input type="text" id="address3" class="addressType" name="address3" placeholder="상세주소" value="${mdto.address3 }"/></li>
											<li>
												<span class="mvalign">※ 상품 배송 시 받으실 주소입니다. 주소를 정확히 적어 주세요.</span>
											</li>
											<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
												<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
											</div>
											<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
											<script>
												// 우편번호 찾기 화면을 넣을 element
												var element_layer = document.getElementById('layer');

												function closeDaumPostcode() {
													// iframe을 넣은 element를 안보이게 한다.
													element_layer.style.display = 'none';
												}

												function sample2_execDaumPostcode() {
													new daum.Postcode({
														oncomplete: function(data) {
															// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

															// 각 주소의 노출 규칙에 따라 주소를 조합한다.
															// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
															var addr = ''; // 주소 변수

															//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
															if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																addr = data.roadAddress;
															} else { // 사용자가 지번 주소를 선택했을 경우(J)
																addr = data.jibunAddress;
															}


															// 우편번호와 주소 정보를 해당 필드에 넣는다.
															document.getElementById('address1').value = data.zonecode;
															document.getElementById("address2").value = addr;
															// 커서를 상세주소 필드로 이동한다.
															document.getElementById("address3").focus();

															// iframe을 넣은 element를 안보이게 한다.
															// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
															element_layer.style.display = 'none';
														},
														width : '100%',
														height : '100%',
														maxSuggestItems : 5
													}).embed(element_layer);

													// iframe을 넣은 element를 보이게 한다.
													element_layer.style.display = 'block';

													// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
													initLayerPosition();
												}

												// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
												// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
												// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
												function initLayerPosition(){
													var width = 300; //우편번호서비스가 들어갈 element의 width
													var height = 400; //우편번호서비스가 들어갈 element의 height
													var borderWidth = 5; //샘플에서 사용하는 border의 두께

													// 위에서 선언한 값들을 실제 element에 넣는다.
													element_layer.style.width = width + 'px';
													element_layer.style.height = height + 'px';
													element_layer.style.border = borderWidth + 'px solid';
													// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
													element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
													element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
												}
											</script>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰 *</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="phone1">
													<option value="${mdto.phone1 }">${mdto.phone1 }</option>
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
											</li>
											<li><span class="valign">-</span></li>
											<li><input type="text" name="phone2"class="w74" maxlength="4" value="${mdto.phone2 }"/> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" name="phone3" class="w74" maxlength="4" value="${mdto.phone3 }"/></li>
											<li class="cb pt5"><span class="mvalign">※ SMS 서비스를 받아보시겠습니까?</span></li>
											<li class="pt5">
												<ul class="baseQues">
													<li>
														<input type="radio" name="sms" id="sms_yes" class="radio_t" value="y"/><label for="sms_yes">예</label>
													</li>
													<li>
														<input type="radio" name="sms" id="sms_no" class="radio_t" value="n"/><label for="sms_no">아니오</label>
													</li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>유선전화</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="tel1" id="tel1">
												<!-- <script>
													var index = $("#tel1 option").index($("#tel1 option:selected"));
												</script> -->
												<%-- <option value="${mdto.tel1 }">${mdto.tel1 }</option> --%>
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
												<script>
												var selectValue = ${mdto.tel1};
													$("#tel1").var("selectValue").attr("selected", "selected");
												</script>
											</li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" name="tel2" class="w74" maxlength="4" value="${mdto.tel2 }"/>
												<span class="valign">-</span>&nbsp;</li>
											<li><input type="text" name="tel3" class="w74" maxlength="4" value="${mdto.tel3 }"/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>생년월일</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="birth1">
													<option value='${mdto.birth1 }' selected="selected">${mdto.birth1 }</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1940; i<=2014; i++){
															document.write("<option value=''>" + i + "</option>");	
															
														};
													//]]>
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign">년</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select name="birth2">
													<option value='${mdto.birth2 }' selected="selected">${mdto.birth2 }</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=12; i++){
															if(i<10){
																document.write("<option value=''>0" + i +"</option>");
															}else{
																document.write("<option value=''>" + i + "</option>");
															};
														};
													//]]>
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign">월</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select name="birth3">
													<option value='${mdto.birth3 }' selected="selected">${mdto.birth3 }</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=31; i++){
															if(i<10){
																document.write("<option value=''>0" + i +"</option>");
															}else{
																document.write("<option value=''>" + i + "</option>");
															};
														};
													//]]>
													</script>
												</select>
											</li>
											<li class="r20">&nbsp;<span class="valign">일</span></li>
											<li class="pt5">
												<ul class="baseQues">
													<li>
														<input type="radio" name="calender_check" id="solar" class="radio_t" value="solar"/><label for="solar">양력</label>
													</li>
													<li>
														<input type="radio" name="calender_check" id="lunar" class="radio_t" value="lunar"/><label for="lunar">음력</label>
													</li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
							</table>
						</div>
						

					</div>

					
					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>
								<li><a href="#" class="nbtnbig">취소하기</a></li>
								<li><button type="submit" class="sbtnMini">수정하기</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					</form>
					


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
	}else{
		var layerCheck = 320;
	}

	$(".addressBtn, .nbtnMini").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});


});
</script>


				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->
<jsp:include page="../common/footer.jsp"/>