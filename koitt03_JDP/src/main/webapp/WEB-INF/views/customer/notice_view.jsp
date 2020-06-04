<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />

<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">CUSTOMER</a></li>
				<li class="last">NOTICE</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">CUSTOMER<span>고객센터</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">NOTICE</a></li>
					<li><a href="#" id="leftNavi2">1:1문의</a></li>
					<li><a href="#" id="leftNavi3">FAQ</span></a></li>
					<li class="last"><a href="#" id="leftNavi4">이용안내</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>NOTICE</strong><span>쟈뎅샵 소식을 전해드립니다.</span></h2>

					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">작성일<span>14.01.28</span></p>
							</div>
						</div>

						<div class="viewContents">
							안녕하세요. 쟈뎅샵입니다.<br/>
							늘 저희 쟈뎅을 사랑해주시는 많은 고객님들께 감사 인사드립니다.<br/>
							변함없는 고객님들의 사랑에 보답하고자, 쟈뎅이 온라인 쇼핑몰을 새롭게 리뉴얼 오픈하게 되었습니다.<br/>
							기존에 tea24로 이용하시던 쟈뎅 제품 전문 쇼핑몰이 쟈뎅샵(jardinshop)이라는 새로운 공간으로<br/>
							오픈하게 되었습니다.<br/>
							더욱 새로운 모습과 늘 발전하는 모습으로 찾아뵙도록 하겠습니다.<br/><br/>

							감사합니다.
						</div>
					</div>


					<!-- 이전다음글 -->
					<div class="pnDiv web">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1" cellspacing="0">
							<caption>이전다음글</caption>
							<colgroup>
							<col width="100px" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th class="pre">PREV</th>
									<td><a href="#">상품 재입고는 언제 되나요?</a></td>
								</tr>

								<tr>
									<th class="next">NEXT</th>
									<td>다음 글이 없습니다.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->


					<!-- Btn Area -->
					<div class="btnArea btline">
						<div class="bRight">
							<ul>
								<li><a href="#" class="sbtnMini mw">목록</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					
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
		