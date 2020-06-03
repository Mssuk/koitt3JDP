<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp"/>
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">MEMBERSHIP</a></li>
				<li class="last">아이디/비밀번호 찾기</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">MEMBERSHIP<span>멤버쉽</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">로그인</a></li>
					<li><a href="#" id="leftNavi2">회원가입</a></li>
					<li><a href="#" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
					<li><a href="#" id="leftNavi4">회원약관</a></li>
					<li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
					<li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="member">
					<h2><strong>아이디/비밀번호 찾기</strong><span>회원님께서 가입하신 아이디와 비밀번호를 찾아드립니다.</span></h2>
					<h3>아이디 찾기</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" class="nameType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='nameType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" /></li>
								<li><input type="password" class="emailType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='emailType'}else {this.className='mfocusnot'}" style="ime-mode:inactive;" /></li>
							</ul>

							<div class="btn"><a href="#" class="gbtn">아이디 찾기</a></div>
						</div>
					</div>



					<h3>비밀번호 찾기</h3>
					<div class="informbox">
						<div class="inform">
							<ul>
								<li><input type="text" class="loginType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}" /></li>
								<li><input type="text" class="emailType" onfocus="this.className='mfocus'" onblur="if (this.value.length==0) {this.className='emailType'}else {this.className='mfocusnot'}" /></li>
							</ul>

							<div class="btn"><a href="#" class="gbtn">비밀번호 찾기</a></div>
						</div>
					</div>


					<p class="alert">쟈뎅 온라인 쇼핑몰에서는 2012년 8월 18일로 시행되는 정보통신망 이용 촉진 및 정보 보호 등에 관한 법률 “주민등록번호의 <span>사용 제한”과 관련하여 주민등록번호를 수집하지 않습니다.</span></p>

				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->
	
<jsp:include page="../common/footer.jsp"/>


=======
	pageEncoding="UTF-8"%>
	<jsp:include page="../common/header.jsp"/>

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
						<ul>
							<li><input type="text" class="loginType"
								onfocus="this.className='mfocus'"
								onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}"
								style="ime-mode: inactive;" /></li>
							<li><input type="password" class="passType"
								onfocus="this.className='mfocus'"
								onblur="if (this.value.length==0) {this.className='passType'}else {this.className='mfocusnot'}"
								style="ime-mode: inactive;" /></li>
						</ul>

						<div class="btn">
							<a href="#" class="sbtn">로그인</a>
						</div>
						<div class="chk">
							<input type="checkbox" id="idsave" /><label for="idsave">아이디
								저장</label>
						</div>

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
<jsp:include page="../common/footer.jsp"/>
>>>>>>> Stashed changes
=======
         pageEncoding="UTF-8" %>
<jsp:include page="../common/header.jsp"/>
<script>

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
                <li><a href="login" id="leftNavi1">로그인</a></li>
                <li><a href="join" id="leftNavi2">회원가입</a></li>
                <li><a href="idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
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
                    <div class="inform" name="inform">
                        <ul>
                            <li><input type="text" class="loginType"
                                       onfocus="this.className='mfocus'"
                                       onblur="if (this.value.length==0) {this.className='loginType'}else {this.className='mfocusnot'}"
                                       style="ime-mode: inactive;"
                                       name="id"/></li>
                            <li><input type="password" class="passType"
                                       onfocus="this.className='mfocus'"
                                       onblur="if (this.value.length==0) {this.className='passType'}else {this.className='mfocusnot'}"
                                       style="ime-mode: inactive;"
                                       name="pw"/></li>
                        </ul>

                        <div class="btn">
                            <a class="sbtn" href="loginForm">로그인</a>
                        </div>
                        <div class="chk">
                            <input type="checkbox" id="idsave"/><label for="idsave">아이디 저장</label>
                        </div>

                        <div class="point">
                            <p>아이디와 비밀번호를 잊으셨나요?</p>
                            <a href="idsearch" class="nbtn">아이디/비밀번호 찾기</a>
                        </div>
                    </div>
                </div>

                <h3>비회원 주문 조회</h3>
                <div class="informbox">
                    <div class="inform">
                        <ul>
                            <li><input type="text" class="ordererType"
                                       onfocus="this.className='mfocus'"
                                       onblur="if (this.value.length==0) {this.className='ordererType'}else {this.className='mfocusnot'}"/>
                            </li>
                            <li><input type="text" class="ordernumType"
                                       onfocus="this.className='mfocus'"
                                       onblur="if (this.value.length==0) {this.className='ordernumType'}else {this.className='mfocusnot'}"/>
                            </li>
                        </ul>

                        <div class="btn">
                            <a href="#" class="gbtn">조회하기</a>
                        </div>
                        <div class="point">
                            <p>아직 JARDIN 회원이 아니신가요? <span>회원가입하시고 다양한 혜택을 받으세요.</span>
                            </p>
                            <a href="join" class="nbtn">회원가입</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- //contents -->


    </div>
</div>
<!-- //container -->
<jsp:include page="../common/footer.jsp"/>
>>>>>>> Stashed changes
