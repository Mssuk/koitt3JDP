<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../common/header.jsp" />
<%
	if(session.getAttribute("loginInfo") != null){
			response.sendRedirect("/main");
}
%>

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
	function idCheck(form){

		//id 체크
		var $login_ch = $('#login_ch');
		
		var $id = $('#id').val();
		var $pw = $('#pw').val();
		var Obj = {};
		Obj.id = $id;
		Obj.pw = $pw;

		var jsonData = JSON.stringify(Obj);

// 		console.log(jsonData);

		$.ajax({
			url:`loginCheck`,
			type: 'POST',
			data:jsonData,
			contentType:'application/json',
			dataType:'json',
			success: function (data) {
				if(data == 0){
					$login_ch.text('아이디를 확인해주세요');
				}else if(data == 1){
					form.submit();
				}else if(data == 2){
					$login_ch.text('비밀번호가 틀립니다.');
				}
			},
			error: function (e) {
				console.log(e);
			}
		})
	}
	
	function nonOrderch(form){
		if(o_check.o_num.value==''){
			alert('주문번호를 입력하세오');
			o_check.o_num.focus();
			return false;
		}
		if(o_check.o_tel.value==''){
			alert('휴대폰 번호를 입력하세오');
			o_check.o_tel.focus();
			return false;
		}
		
		$.ajax({
	        url : "/nonmember/ordercheck",   // 받을 url
	        type : "POST",   
	        data: JSON.stringify({o_num:o_check.o_num.value,o_tel:o_check.o_tel.value}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
	        contentType: "application/json",
	        success : function (data) {
	           if(data== 1){ //주문이있는경우
	        	  location.href='/nonmember/ordercheck_view?o_num=o_check.o_num.value';
	           }else if(data == -1){//해당 주문이 있지만 회원주문인경우
					alert('해당 조회는 비회원전용입니다. \n 로그인해주세요');
				}else if(data ==0){//주문이 없을경우
					alert('해당 주문내역이 없습니다.\n주문번호 및 주문휴대폰번호를 잊어버리셨다면 고객센터로  문의해주세요.');
				}
	        },
	        error : function(){ //오류일경우 경고창을 띄움
	           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: deleteError)");
	        }
	     });
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
				<li><a href="/membership/login" id="leftNavi1">로그인</a></li>
				<li><a href="/membership/join1" id="leftNavi2">회원가입</a></li>
				<li><a href="/membership/idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
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
					<!-- form -->
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
							<button type="button" onclick='idCheck(this.form)' class="sbtn">로그인</button>
						</div>
							<span style="color:#ff0000" id="login_ch"></span>  <!-- session으로 id, pw 검증 후 안내 코멘트 -->
						<div class="chk">
							<input type="checkbox" id="idsave" /><label for="idsave">아이디
								저장</label>
						</div>
					</form>
						<div class="point">
							<p>아이디와 비밀번호를 잊으셨나요?</p>
							<a href="/membership/idsearch" class="nbtn">아이디/비밀번호 찾기</a>
						</div>
					</div>
				</div>

				<h3>비회원 주문 조회</h3>
				<div class="informbox">
					<form class="inform" name="o_check" method="post">
						<ul>
							<li><input type="text" class="ordererType" name="o_num"
								onfocus="this.className='mfocus'"
								onblur="if (this.value.length==0) {this.className='ordererType'}else {this.className='mfocusnot'}" /></li>
							<li><input type="text" class="ordernumType" name="o_tel"
								onfocus="this.className='mfocus'"
								onblur="if (this.value.length==0) {this.className='ordernumType'}else {this.className='mfocusnot'}" /></li>
						</ul>

						<div class="btn">
							<a href="#" onclick="nonOrderch(this.form)" class="gbtn">조회하기</a>
						</div>
						<div class="point">
							<p>
								아직 JARDIN 회원이 아니신가요? <span>회원가입하시고 다양한 혜택을 받으세요.</span>
							</p>
							<a href="/membership/join1" class="nbtn">회원가입</a>
						</div>
					</form>
				</div>

			</div>
		</div>
		<!-- //contents -->


	</div>
</div>
<!-- //container -->
<jsp:include page="../common/footer.jsp" />
