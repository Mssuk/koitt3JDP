<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("loginInfo") != null) {
	response.sendRedirect("/main");
}
%>
<jsp:include page="../common/header.jsp" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script> 
	function id_ch(form) {

		var ch_id = /^[a-zA-Z][0-9][_]{4,16}$/;
	    // 4~16자 까지 가능, 영문, 숫자와 특수기호(_)만 사용 가능
	    var ch_yn = 1;

        var id = document.getElementById("id");

		if (join.id.value == "") {
			alert('아이디를 입력해주세요');
			join.id.focus();
			return false;
		}

		/*
		if(!(ch_id.test(id.value))) {
		    alert('조건을 확인하세요')
		    return false;
		}
		*/

		var $id = $('#id').val();
		var Obj = {};
		Obj.id = $id;

		var jsonData = JSON.stringify(Obj);

		$.ajax({
			url : `idCheck`,
			type : 'POST',
			data : jsonData,
			contentType : 'application/json',
			success : function(data){
				if(data == 0){
					alert('아이디가 이미 존재합니다.')
				} else{
					alert('사용할 수 있는 아이디 입니다.')
				}
			},
			error: function (e) {
				console.log(e)
			}
		})
}

	//var va = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()\-_=+\\\|\[\]{};:\,.<>\/?]).{8,20}$/;
	// ^(?=.*[a-z] [.]=1개씩비교  [*]=모든문자에서  a-z있는지 확인.
	function page_ch() {
		if (join.name.value == "") {
			alert('이름을 입력하세요');
			return false;
		}

		else if (join.id.value == "") {
			alert('아이디를 입력하세요');
			return false;
		}

		/* else if (id_ch() == false) {
			alert('중복체크를 확인하세요')
			return false;
		} */

		else if (join.pw.value == "") {
			alert('비밀번호를 입력하세요');
			return false;
		}

		else if (join.pw2.value == "") {
			alert('비밀번호 확인란을 입력하세요');
			return false;
		}

		else if (join.email1.value == "" || join.email2.value == ""){
			alert('이메일을 입력하세요');
			return false;
			}
		
		else if (join.tel2.value == ""){
			alert('전화번호를 입력하세요');
			return false;
			}
		
		else if (join.tel3.value == ""){
			alert('전화번호를 입력하세요');
			return false;
			}

		else if(join.phone2.value == ""){
			alert('휴대전화 번호를 입력하세요');
			return false;
			}
		
		else if(join.phone3.value == ""){
			alert('휴대전화 번호를 입력하세요');
			return false;
			}

		else if(join.address1.value == ""){
			alert('우편번호를 입력하세요');
			return false;
			}

		else if(join.address3.value == ""){
			alert('상세주소를 입력하세요');
			return false;
			}

		/*if (join.email_check.value == "") {
			alert('이메일 수신 여부를 선택하세요');
			return false;
		}*/

		else
			join.submit();
	}

	</script>
<div id="container">

	<div id="location">
		<ol>
			<li><a href="/main">HOME</a></li>
			<li><a href="location:void(0)">MEMBERSHIP</a></li>
			<li class="last">회원가입</li>
		</ol>
	</div>

	<div id="outbox">
	<div id="left">
	<div id="title2">
		MEMBERSHIP<span>멤버쉽</span>
	</div>
		<ul>
			<li><a href="/membership/login" id="leftNavi1">로그인</a></li>
			<li><a href="location:void(0)" id="leftNavi2">회원가입</a></li>
			<li><a href="/membership/idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
			<li><a href="#" id="leftNavi4">회원약관</a></li>
			<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
			<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
		</ul>
	</div>
	<script type="text/javascript">
		initSubmenu(2, 0);
	</script>

		<!-- contents -->
		<form action="signUp" name="signUp" id="signUp"></form>
		<div id="contents">
			<div id="member">
				<h2>
					<strong>회원가입</strong><span>회원으로 가입하시면 보다 더 다양한 혜택을 누리실 수 있습니다.</span>
				</h2>

				<!-- STEP -->
				<div class="stepWrap">
					<div class="step">
						<p class="web">STEP 01</p>
						<p class="txt">실명확인</p>

					</div>

					<div class="step">
						<p class="web">STEP 02</p>
						<p class="txt">약관 동의</p>
					</div>

					<div class="step stepon">
						<p class="web">STEP 03</p>
						<p class="txt">
							<span>회원정보</span> <span>입력</span>
						</p>
						<p class="ck">
							<img src="/images/bg/bg_step.png" alt="현재위치" />
						</p>
					</div>

					<div class="step">
						<p class="web">STEP 04</p>
						<p class="txt">
							<span>회원가입</span> <span>완료</span>
						</p>
					</div>
				</div>
				<!-- //STEP -->


				<div class="attention">
					<ul>
						<li>* 표시된 항목은 필수 항목이므로 반드시 입력하셔야 회원가입이 진행됩니다.</li>
					</ul>
				</div>

				<!-- 입력 시작 --->
				<!-- form Tag -->
				<form action="signUp" method="post" name="join">
					<div class="memberbd">
						<table
							summary="이름, 아이디, 비밀번호, 비밀번호 확인, 이메일, 이메일수신여부, 주소, 휴대폰, 유선전화, 생년월일 순으로 회원가입 정보를 등록할수 있습니다."
							class="memberWrite" border="1" cellspacing="0">
							<caption>회원가입 입력</caption>
							<colgroup>
								<col width="22%" class="tw30" />
								<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름 *</span></th>
									<td class="r10"><input type="text" class="w134"
										name="name" id="name"/>
								</tr>
								<tr>
									<th scope="row"><span>아이디 *</span></th>
									<td>
										<ul class="pta">
											<li class="r10"><input type="text" class="w134"
												name="id" id="id"/></li>
											<li>
												<a class="nbtnMini" onclick="id_ch(this.form)">중복 확인</a>
											</li>
											<!-- <li><a href="#" class="nbtnMini">중복확인</a></li> -->
											<li class="pt5"><span class="mvalign">첫 글자는 영문으로
													4~16자 까지 가능, 영문, 숫자와 특수기호(_)만 사용 가능</span></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호 *</span></th>
									<td>
										<ul class="pta">
											<li class="r10"><input type="password" class="w134"
												name="pw" id="pw"/></li>
											<li><span class="mvalign">※ 영문 / 숫자 / 특수문자 혼용으로
													8~20자 까지 가능.</span></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>비밀번호 확인 *</span></th>
									<td>
										<ul class="pta">
											<li class="r10"><input type="password" class="w134"
												name="pw2" id="pw2"/></li>
											<li><span class="mvalign orange" id="alert-danger">*
													비밀번호가 일치하지 않습니다.</span></li>
											<li><span class="mvalign black" id="alert-success">*
													비밀번호가 일치합니다.</span></li>
											<script>
												$(function() {
													$("#alert-success").hide();
													$("#alert-danger").hide();
													$("input").keyup(function() {
														var pwd1 = $("#pw").val();
														var pwd2 = $("#pw2").val();
														if (pwd1 != "" || pwd2 != "") {
															if (pwd1 == pwd2) {
																$("#alert-success").show();
																$("#alert-danger").hide();
																$("#submit").removeAttr("disabled")
															} else {
																$("#alert-success").hide();
																$("#alert-danger").show();
																$("#submit").attr("disabled","disabled");
															}
														} else{
															$("#alert-success").hide();
															$("#alert-danger").hide();
														}
													});
												});
											</script>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>이메일 *</span></th>
									<td>
										<ul class="pta">
											<!-- selct 선택하면 email창에 자동으로 입력되는 함수 -->
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
											<li><input type="text" class="w134" name="email1" /></li>
											<li><span class="valign">&nbsp;@&nbsp;</span></li>
											<li class="r10"><input type="text" class="w134" name="email2" /></li>
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
											<li><input type="radio" id="receive_yes"
												class="radio_t" checked="checked" name="email_check" value="y"/><label for="receive_yes">예</label>
											</li>
											<li><input type="radio" id="receive_no"
												class="radio_t" name="email_check" value="n"/><label for="receive_no">아니오</label></li>
										</ul>
										<p class="gray">* 거래관련 정보는 고객님의 거래안전을 위하여 이메일 수신거부와 관계없이
											발송됩니다.</p>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>주소 *</span></th>
									<td>
										<ul class="pta">
											<li><input type="text" id="address1" class="w134" name="address1" readonly="readonly" placeholder="우편번호"/>&nbsp;</li>
											<li><input type="button" class="addressBtn" onclick="sample2_execDaumPostcode()" value="우편번호 찾기"></li>
											<li class="pt5"><input type="text" id="address2" class="addressType" name="address2" placeholder="주소" readonly/></li>
											<li class="pt5"><input type="text" id="address3" class="addressType" name="address3" placeholder="상세주소"/></li>
											<li class="cb">
												<span class="mvalign">
												※ 상품 배송 시 받으실 주소입니다. 주소를 정확히 적어 주세요.
												</span>
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
												function initLayerPosition(){
													var width = 300; //우편번호서비스가 들어갈 element의 width
													var height = 400; //우편번호서비스가 들어갈 element의 height
													var borderWidth = 5;  

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
											<li><select name="phone1">
													<option value="010" selected="selected">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
											</select></li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;
											</li>
											<li><input type="text" class="w74" maxlength="4" name="phone2"/> <span
												class="valign">-</span>&nbsp;</li>
											<li class="r10"><input type="text" class="w74" maxlength="4" name="phone3"/></li>
											<li class="cb pt5"><span class="mvalign">※ SMS
													서비스를 받아보시겠습니까?</span></li>
											<li class="pt5">
												<ul class="baseQues">
													<li><input type="radio" name="sms" id="sms_yes"
														class="radio_t" checked="checked" value="y"/><label for="sms_yes">예</label>
													</li>
													<li><input type="radio" name="sms" id="sms_no"
														class="radio_t" value="n"/><label for="sms_no" >아니오</label></li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>유선전화 *</span></th>
									<td>
										<ul class="pta">
											<li><select name="tel1">
													<option value="02" selected="selected">02</option>
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
											</select></li>
											<li>&nbsp;<span class="valign">-</span>&nbsp;
											</li>
											<li><input type="text" class="w74" maxlength="4" name="tel2"/> <span class="valign">-</span>&nbsp;</li>
											<li><input type="text" class="w74" maxlength="4" name="tel3"/></li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>생년월일</span></th>
									<td>
										<ul class="pta">
											<li><select name="birth1">
													<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
														//<![CDATA[
														for (var i = 1940; i <= 2014; i++) {
															document
																	.write("<option value="+i+">"
																			+ i
																			+ "</option>");
														};
														//]]>
													</script>
											</select></li>
											<li><span class="valign">년</span></li>
											<li><select name="birth2">
													<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
														//<![CDATA[
														for (var i = 1; i <= 12; i++) {
															if (i < 10) {
																document
																		.write("<option value="+i+">0"
																				+ i
																				+ "</option>");
															} else {
																document
																		.write("<option value="+i+">"
																				+ i
																				+ "</option>");
															}
															;
														};
														//]]>
													</script>
											</select></li>
											<li>&nbsp;<span class="valign">월</span>&nbsp;&nbsp;&nbsp;
											</li>
											<li><select name="birth3">
													<option value='' selected="selected">선택하세요</option>
													<script type="text/javascript">
														//<![CDATA[
                                                        var i;
														for (i = 1; i <= 31; i++) {
															if (i < 10) {
																document
																		.write("<option value="+i+">0"
																				+ i
																				+ "</option>");
															} else {
																document
																		.write("<option value="+i+">"
																				+ i
																				+ "</option>");
															}
															;
														};
														//]]>
													</script>
											</select></li>
											<li class="r20">&nbsp;<span class="valign">일</span></li>
											<li class="pt5">
												<ul class="baseQues">
													<li><input type="radio" name="calender_check" id="solar"
														class="radio_t" checked="checked" value="solar"/><label for="solar">양력</label>
													</li>
													<li><input type="radio" name="calender_check" id="lunar"
														class="radio_t" value="lunar"/><label for="lunar">음력</label></li>
												</ul>
											</li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>

						<!-- Btn Area -->
						<div class="btnArea">
							<div class="bCenter">
								<ul>
									<li><a href="#" class="nbtnbig">취소하기</a></li>
									<li><a type="button" class="sbtnMini"
											onclick="page_ch()">가입하기</a></li>
									<!--<li><a href="" role="submit" class="sbtnMini">가입하기</a></li>-->
								</ul>
							</div>
						</div>
						<!-- //Btn Area -->
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- //contents -->

</div>
</div>
<jsp:include page="../common/footer.jsp" />