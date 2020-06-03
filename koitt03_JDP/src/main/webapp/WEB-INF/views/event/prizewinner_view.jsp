<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />
	<!-- container -->

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">EVENT</a></li>
				<li class="last">당첨자 발표</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="event_left_bar.jsp" />

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>당첨자 발표</strong><span>쟈뎅샵의 특별한 혜택이 가득한 이벤트의 당첨자를 발표합니다. </span></h2>

					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>[11월 체험단 발표] 까페모리 홍차라떼 체험단</li>
								</ul>
							</div>
							<div class="data">
								<ul>
									<li>등록일<span>2014-03-24</span></li>
									<li>조회수<span>99,999</span></li>
								</ul>
							</div>
						</div>

						<div class="viewContents">
							안녕하세요^^ 쟈뎅입니다.<br/><br/>

							지난 11월 18일부터 진행된 까페모리 홍차 라떼&드립 커피 로스트의 체험단 당첨자를 발표합니다~!<br/><br/>

							당첨되신 분은 총 15분이며, 당첨되신 분께는 홍차 라떼와 드립 커피 로스트를 구매하실 수 있는<br/>
							쟈뎅샵 적립금 15,000점을 적립해드렸습니다.<br/><br/>

							혹시, 체험단에 당첨되지 않으셨더라도<br/>
							11월 문화이벤트인 '오! 당신이 잠든 사이'이벤트 페이지를 확인하시고,<br/>
							후기를 예쁘게 작성하셔서 댓글로 URL을 남겨주세요~<br/>
							추첨을 통해 뮤지컬 티켓 2매를 선물로 드릴 예정입니다.<br/><br/>

							올겨울, 따뜻하고 달콤한 까페모리와 드립 커피 로스트의 진한 커피향에 흠뻑 빠져보세요~!<br/><br/>

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

