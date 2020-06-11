<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../common/header.jsp"/>
<%--<script>
	function error() {
		if(){

		}
	}
</script>--%>
<script>
	function textCheck(form) {
		if(searchId.name.value==""){
			alert('이름을 입력해주세요');
			searchId.name.focus();
			return false;
		}
		else if(searchId.email.value=="") {
			alert('이메일을 입력해주세요');
			searchId.email.focus();
			return false;
		}
		else
			return searchId.submit();

		if(searchId.id.value==""){
			alert('아이디를 입력해주세요');
			searchPw.id.focus();
			return false;
		}

		else if(searchId.email.value=="") {
			alert('이메일을 입력해주세요');
			searchPw.email.focus();
			return false;
		}

		else
			return searchPw.submit();
	}




</script>
<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li>HOME</li>
				<li>MEMBERSHIP</li>
				<li class="last">아이디/비밀번호 찾기</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">MEMBERSHIP<span>멤버쉽</span></div>
				<ul>	
					<li><a href="login" id="leftNavi1">로그인</a></li>
					<li><a href="join1" id="leftNavi2">회원가입</a></li>
					<li><a href="idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
					<li><a href="#" id="leftNavi4">회원약관</a></li>
					<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
					<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>아이디/비밀번호 찾기</strong><span>회원님께서 가입하신 아이디와 비밀번호를 찾아드립니다.</span></h2>
				<form action="searchId" method="post" name="searchId">
					<h3>아이디 찾기</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" name="name" class="nameType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='nameType'}else {this.className='mfocusnot'}" style="ime-mode:active;" /></li>
								<li><input type="text" name="email" class="emailType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='emailType'}else {this.className='mfocusnot'}" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9@.]/g,'');"/></li>
							</ul>
							<div class="btn"><button type="button" class="gbtn" onclick="textCheck(this.form)">아이디 찾기</button></div>
							<script>
								if(searchId.value().hasData()){
									alert('이메일을 전송햇습니다.');

								}
							</script>
						</div>
					</div>
				</form>
				
				<form action="searchPw" name="searchPw" method="post">
					<h3>비밀번호 찾기</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" name="id" class="loginType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}" /></li>
								<li><input type="text" name="email" class="emailType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='emailType'}else {this.className='mfocusnot'}" /></li>
							</ul>
							<div class="btn"><button type="button" onclick="textCheck(this.form)" class="gbtn">비밀번호 찾기</button></div>
						</div>
					</div>
				</form>


					<p class="alert">쟈뎅 온라인 쇼핑몰에서는 2012년 8월 18일로 시행되는 정보통신망 이용 촉진 및 정보 보호 등에 관한 법률 “주민등록번호의 <span>사용 제한”과 관련하여 주민등록번호를 수집하지 않습니다.</span></p>

				</div>
				</from>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->
	
	<jsp:include page="../common/footer.jsp"/>