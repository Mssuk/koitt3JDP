<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    if(session.getAttribute("loginInfo") != null){
        response.sendRedirect("/main");
    }
%>

<jsp:include page="../common/header.jsp"/>
<script>
    function phone_auth(form) {
        alert('인증되었습니다.');
        form.submit();
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
            <div id="title2">MEMBERSHIP<span>멤버쉽</span></div>
            <ul>
                <li><a href="login" id="leftNavi1">로그인</a></li>
                <li><a href="" id="leftNavi2">회원가입</a></li>
                <li><a href="idsearch" id="leftNavi3">아이디/<span>비밀번호 찾기</span></a></li>
                <li><a href="#" id="leftNavi4">회원약관</a></li>
                <li><a href="#" id="leftNavi5">개인정보<span>취급방침</span></a></li>
                <li class="last"><a href="#" id="leftNavi6">이메일무단<span>수집거부</span></a></li>
            </ul>
        </div>
        <script type="text/javascript">initSubmenu(2, 0);</script>


        <!-- contents -->
        <div id="contents">
            <div id="member">
                <h2><strong>회원가입</strong><span>회원으로 가입하시면 보다 더 다양한 혜택을 누리실 수 있습니다.</span></h2>

                <!-- STEP -->
                <div class="stepWrap">
                    <div class="step stepon">
                        <p class="web">STEP 01</p>
                        <p class="txt">실명확인</p>
                        <p class="ck"><img src="../images/bg/bg_step.png" alt="현재위치"/></p>
                    </div>

                    <div class="step">
                        <p class="web">STEP 02</p>
                        <p class="txt">약관 동의</p>
                    </div>

                    <div class="step">
                        <p class="web">STEP 03</p>
                        <p class="txt"><span>회원정보</span> <span>입력</span></p>
                    </div>

                    <div class="step">
                        <p class="web">STEP 04</p>
                        <p class="txt"><span>회원가입</span> <span>완료</span></p>
                    </div>
                </div>
                <!-- //STEP -->


                <div class="alertBox">
                    <ul>
                        <li>회원님의 실명확인 및 가입 여부를 확인하는 절차입니다.</li>
                        <li>회원님의 개인 정보 보호를 위해 실명확인을 실시하고 있습니다.</li>
                    </ul>
                </div>


                <!-- Btn Area -->
                <div class="btnAreaCenter">
                    <form action="join2" method="post">
                        <!-- <a href="#" class="gbtn">휴대폰인증</a></li> -->
                        <button type="button" onclick="phone_auth(this.form)" class="gbtn">휴대폰 인증</button>
                    </form>
                </div>
                <!-- //Btn Area -->


            </div>
        </div>
        <!-- //contents -->


    </div>
</div>
<!-- //container -->
<jsp:include page="../common/footer.jsp"/>