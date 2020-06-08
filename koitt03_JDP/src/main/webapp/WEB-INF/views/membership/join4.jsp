<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="../common/header.jsp" />

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
				<li><a href="#" id="leftNavi1">로그인</a></li>
				<li><a href="#" id="leftNavi2">회원가입</a></li>
				<li><a href="#" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
				<li><a href="#" id="leftNavi4">회원약관</a></li>
				<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
				<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
			</ul>
		</div>
		<script type="text/javascript">
			initSubmenu(2, 0);
		</script>


		<!-- contents -->
		<div id="contents">
			<div id="member">
				<h2>
					<strong>회원가입</strong><span>회원으로 가입하시면 보다 더 다양한 혜택을 누리실 수
						있습니다.</span>
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

					<div class="step">
						<p class="web">STEP 03</p>
						<p class="txt">
							<span>회원정보</span> <span>입력</span>
						</p>
					</div>

					<div class="step stepon">
						<p class="web">STEP 04</p>
						<p class="txt">
							<span>회원가입</span> <span>완료</span>
						</p>
						<p class="ck">
							<img src="../images/bg/bg_step.png" alt="현재위치" />
						</p>
					</div>
				</div>
				<!-- //STEP -->

				<div class="celebrate">
					<div class="img">
						<img src="../images/txt/txt_celebrate01.png"
							alt="JARDIN THECOFFEE CERATOR, SINCE 1984" />
					</div>
					<p class="thx">
						감사합니다. <span>회원가입이 완료되었습니다.</span>
					</p>
					<p class="txt">
						저희 가족이 되어주셔서 감사합니다.<br /> 가입 시 입력하신 이메일로 가입 완료 메일이 전송되었습니다.<br />
						언제나 고객님께 즐겁고 소중한 시간이 되도록 최선을 다 하겠습니다.<br /> <br /> 가입 시 입력하신 정보는
						마이페이지에서 수정하실 수 있습니다.
					</p>
				</div>

				<!-- Btn Area -->
				<div class="btnArea">
					<div class="bCenter">
						<ul>
							<li><a href="#" class="nbtnbig">메인으로</a></li>
							<li><a href="#" class="sbtnMini">로그인</a></li>
						</ul>
					</div>
				</div>
				<!-- //Btn Area -->


			</div>
		</div>
		<!-- //contents -->


	</div>
</div>
<jsp:include page="../common/footer.jsp" />