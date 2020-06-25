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
									<td><input type="text" value="${mdto.name }" readonly name="name" style="background: #cdcdcd; "></td>
								</tr>
								<tr>
									<th scope="row"><span>아이디</span></th>
									<td><input type="text" value="${mdto.id}" readonly name="id" style="background: #cdcdcd; "></td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호 변경</span></th>
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
												<script type="text/javascript">
													//select박스
													$('select[id="emailList"]').find('option:contains("${mdto.email2}")').prop("selected",true);
												</script>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>이메일 수신여부</span></th>
									<td>
										<p>쟈뎅에서 진행되는 이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까?</p>
										<ul class="question">
											<li>
												<input type="radio" name="email_check" id="receive_yes" value="y" class="radio_t" checked="checked"/><label for="receive_yes">예</label>
											</li>
											<li>
												<input type="radio"name="email_check" id="receive_no" value="n" class="radio_t"/><label for="receive_no">아니오</label>
											</li>
										</ul>
										<script>
											$("input:radio[name='email_check']:radio[value='${mdto.email_check}']").prop("checked", true) ;
										</script>
										<p class="gray">* 거래관련 정보는 고객님의 거래안전을 위하여 이메일 수신거부와 관계없이 발송됩니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>주소</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" id="address1" class="w134" name="address1" readonly="readonly" value="${mdto.address1 }"/>&nbsp;</li>
											<li><input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"></li>
											<li class="pt5"><input type="text" id="address2" class="addressType" name="address2" value="${mdto.address2 }" readonly /></li>
											<li class="pt5"><input type="text" id="address3" class="addressType" name="address3" placeholder="상세주소" value="${mdto.address3 }"/></li>
											<li>
												<span class="mvalign">※ 상품 배송 시 받으실 주소입니다. 주소를 정확히 적어 주세요.</span>
											</li>
											<jsp:include page="post_search.jsp"/>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>휴대폰</span></th>
									<td>
										<ul class="pta">
											<li>
												<select name="phone1" id="phone">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>    
													<option value="019">019</option>    
												</select>
												<script type="text/javascript">
													//select박스
													$('select[id="phone"]').find('option:contains("${mdto.phone1}")').prop("selected",true);
												</script>
											</li>
											<li><span class="valign">-</span></li>
											<li><input type="text" name="phone2"class="w74" maxlength="4" value="${mdto.phone2 }"/> <span class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" name="phone3" class="w74" maxlength="4" value="${mdto.phone3 }"/></li>
											<li class="cb pt5"><span class="mvalign">※ SMS 서비스를 받아보시겠습니까?</span></li>
											<li class="pt5">
												<ul class="baseQues">
													<li>
														<input type="radio" name="sms" id="sms" value="y" class="radio_t" value="y"/><label for="sms_yes">예</label>
													</li>
													<li>
														<input type="radio" name="sms" id="sms" value="n" class="radio_t" value="n"/><label for="sms_no">아니오</label>
													</li>
												</ul>
												<script>
													$("input:radio[name='sms']:radio[value='${mdto.sms}']").prop("checked", true) ;
// 													​$("input:radio[name='sms']:radio[value='${mdto.sms}']").prop("checked",true); 
												</script>
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
												<script type="text/javascript">
													//select박스
													$('select[id="tel1"]').find('option:contains("${mdto.tel1}")').prop("selected",true);
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
												<select name="birth1" id="birth1">
													<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1940; i<=2014; i++){
															document.write("<option value="+i+">" + i + "</option>");	
															
														};
													//]]>
														//select박스
														$('select[id="birth1"]').find('option:contains("${mdto.birth1}")').prop("selected",true);
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign">년</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select name="birth2" id="birth2">
													<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=12; i++){
															if(i<10){
																document.write("<option value="+i+">0" + i +"</option>");
															}else{
																document.write("<option value="+i+">" + i + "</option>");
															};
														};
													//]]>
														$('select[id="birth2"]').find('option:contains("${mdto.birth2}")').prop("selected",true);
													</script>
												</select>
											</li>
											<li>&nbsp;<span class="valign">월</span>&nbsp;&nbsp;&nbsp;</li>
											<li>
												<select name="birth3" id="birth3">
													<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
													//<![CDATA[
														for(var i=1; i<=31; i++){
															if(i<10){
																document.write("<option value="+i+">0" + i +"</option>");
															}else{
																document.write("<option value="+i+">" + i + "</option>");
															};
														};
													//]]>
														$('select[id="birth3"]').find('option:contains("${mdto.birth3}")').prop("selected",true);
													</script>
												</select>
											</li>
											<li class="r20">&nbsp;<span class="valign">일</span></li>
											<li class="pt5">
												<ul class="baseQues">
													<li>
														<input type="radio" name="calender_check" id="solar" value="solar" class="radio_t" value="solar"/><label for="solar">양력</label>
													</li>
													<li>
														<input type="radio" name="calender_check" id="lunar" value="lunar" class="radio_t" value="lunar"/><label for="lunar">음력</label>
													</li>
												</ul>
												<script>
													$("input:radio[name='calender_check']:radio[value='${mdto.calender_check}']").prop("checked", true) ;
												</script>
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