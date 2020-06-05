<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../common/header.jsp" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
	function idCheck(form){

		//id 란
		var $idran = $('#idran');
		
		var $id = $('#id').val();
		var $pw = $('#pw').val();
		var Obj = {};
		Obj.id = $id;
		Obj.pw = $pw;

		var jsonData = JSON.stringify(Obj);

		console.log(jsonData);

		$.ajax({
			url:`loginCheck`,
			type: 'POST',
			data:jsonData,
			contentType:'application/json',
			dataType:'json',
			success: function (data) {
				if(data == 0){
					$idran.text('아이디가 없습니다.');	
				}else if(data == 1){
					form.submit();
				}else if(data == 2){
					$idran.text('비밀번호가 틀립니다.');
				}
			},
			error: function (e) {
				console.log(e);
			}
		})
	}

</script>

<!-- container -->
<div id="container">

	<div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">MEMBERSHIP</a></li>
			<li class="last">로그인</li>
		</ol>
	</div>

	<div id="outbox">
		<div id="left">
			<div id="title2">
				MEMBERSHIP<span>멤버쉽</span>
			</div>
			<ul>
				<li><a href="#" id="leftNavi1">로그인</a></li>
				<li><a href="#" id="leftNavi2">회원가입</a></li>
				<li><a href="#" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
				<li><a href="#" id="leftNavi4">회원약관</a></li>
				<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
				<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
			</ul>
		</div>
		<script type="text/javascript">
			initSubmenu(1, 0);
		</script>


		<!-- contents -->
		<div id="contents">
			<div id="member">
				<h2>
					<strong>로그인</strong><span>로그인 후 주문하시면 다양한 혜택을 받으실 수 있습니다.</span>
				</h2>
				<h3>회원 로그인</h3>
				<div class="informbox">
					<div class="inform">
					<form action="loginOk" method="post">
						<ul>
							<li><input type="text" class="loginType" id="id"
								onfocus="this.className='mfocus'"
								onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}"
								style="ime-mode: inactive;" name="id" /></li>
							<li><input type="password" class="passType" id="pw"
								onfocus="this.className='mfocus'"
								onblur="if (this.value.length==0) {this.className='passType'}else {this.className='mfocusnot'}"
								style="ime-mode: inactive;" name="pw" /></li>
						</ul>

						<div class="btn">
							<!-- <a href="#" class="sbtn">로그인</a> -->
							<button type="button" onclick='idCheck(this.form)'>로그인</button>
						</div>
							<span style="color:red" id="idran"></span>
						<div class="chk">
							<input type="checkbox" id="idsave" /><label for="idsave">아이디
								저장</label>
						</div>
						</form>
						<div class="point">
							<p>아이디와 비밀번호를 잊으셨나요?</p>
							<a href="#" class="nbtn">아이디/비밀번호 찾기</a>
						</div>
					</div>
				</div>



				<h3>비회원 주문 조회</h3>
				<div class="informbox">
					<div class="inform">
						<ul>
							<li><input type="text" class="ordererType"
								onfocus="this.className='mfocus'"
								onblur="if (this.value.length==0) {this.className='ordererType'}else {this.className='mfocusnot'}" /></li>
							<li><input type="text" class="ordernumType"
								onfocus="this.className='mfocus'"
								onblur="if (this.value.length==0) {this.className='ordernumType'}else {this.className='mfocusnot'}" /></li>
						</ul>

						<div class="btn">
							<a href="#" class="gbtn">조회하기</a>
						</div>
						<div class="point">
							<p>
								아직 JARDIN 회원이 아니신가요? <span>회원가입하시고 다양한 혜택을 받으세요.</span>
							</p>
							<a href="#" class="nbtn">회원가입</a>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- //contents -->


	</div>
</div>
<!-- //container -->
<jsp:include page="../common/footer.jsp" />