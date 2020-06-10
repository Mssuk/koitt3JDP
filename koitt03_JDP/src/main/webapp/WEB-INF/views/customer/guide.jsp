<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="notice">CUSTOMER</a></li>
				<li class="last">이용안내</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="customer_left_bar.jsp" />
			<script type="text/javascript">initSubmenu(4,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>이용안내</strong><span>이용안내 페이지 입니다.</span></h2>
					

					
				

				</div>
			</div>
			<!-- //contents -->

		</div>
		<!-- quickmenu -->
		<jsp:include page="../common/quickmenu.jsp" />
		<!-- //quickmenu -->

	</div>
	<!-- //container -->
<!--footer입니다. -->
<jsp:include page="../common/footer.jsp" />
