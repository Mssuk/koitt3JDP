<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp"/>
<div id="container">

	<div id="location">
		<ol>
			<li><a href="#">HOME</a></li>
			<li><a href="#">MY PAGE</a></li>
			<li class="last">1:1문의</li>
		</ol>
	</div>

	<div id="outbox">
		<div id="left">
			<div id="title">MY PAGE<span>마이페이지</span></div>
			<ul>
				<li><a href="#" id="leftNavi1">주문/배송 조회</a></li>
				<li><a href="#" id="leftNavi2">반품/배송 현황</a></li>
				<li><a href="#" id="leftNavi3">장바구니</a></li>
				<li><a href="#" id="leftNavi4">위시리스트</a></li>
				<li><a href="#" id="leftNavi5">나의 쿠폰</a></li>
				<li><a href="#" id="leftNavi6">나의 포인트</a></li>
				<li><a href="#" id="leftNavi7">1:1문의</a></li>
				<li><a href="#" id="leftNavi8">회원정보 수정</a></li>
				<li class="last"><a href="#" id="leftNavi9">회원 탈퇴</a></li>
			</ul>
		</div><script type="text/javascript">initSubmenu(7,0);</script>


		<!-- contents -->
		<div id="contents">
			<div id="mypage">
				<h2><strong>1:1문의</strong><span>쟈뎅에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>

				<div class="myInfo">
					<ul>
						<li class="info"><strong>가나다</strong> 님의 정보를 한눈에 확인하세요.</li>
						<li>보유 쿠폰<br/><span class="num">199</span> <span class="unit">장</span></li>
						<li class="point">내 포인트<br/><span class="num">100,000</span> <span class="unit">P</span></li>
						<li class="last">진행중인 주문<br/><span class="num">199</span> <span class="unit">건</span></li>
					</ul>
				</div>

				<div class="viewDiv">
					<div class="viewHead">
						<div class="subject">
							<ul>
								<li class="cate">[기타]</li>
								<li>문의 드립니다.</li>
							</ul>
						</div>
						<div class="day">
							<p class="txt">등록일<span>14.01.28</span></p>
							<p class="btn"><span class="obtnMini">답변완료</span></p>
						</div>
					</div>

					<div class="viewContents">
						문의드립니다.<br/>
						빠른 답변 부탁드립니다
					</div>
				</div>

				<!-- 답변 -->
				<div class="answer">
					<div class="inbox">
						<div class="aname">
							<p>담당자 <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></p>
						</div>

						<div class="atxt">
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
							쟈뎅 커피를 사랑해주셔서 감사합니다. 앞으로도 노력하는 쟈뎅이 되겠습니다. 감사합니다.
						</div>
					</div>
				</div>
				<!-- //답변 -->


				<!-- 이전다음글 -->
				<div class="pnDiv web">
					<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1" cellspacing="0">
						<caption>이전다음글</caption>
						<colgroup>
						<col width="100px" />
						<col width="*" />
						<col width="100px" />
						</colgroup>
						<tbody>
							<tr>
								<th class="pre">PREV</th>
								<td><a href="#">상품 재입고는 언제 되나요?</a></td>
								<td>
									<div class="parea">
										<div class="nbtnMini">답변대기</div>
									</div>
								</td>
							</tr>

							<tr>
								<th class="next">NEXT</th>
								<td>다음 글이 없습니다.</td>
								<td>&nbsp;</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- //이전다음글 -->


				<!-- Btn Area -->
				<div class="btnArea">
					<div class="bRight">
						<ul>
							<li><a href="#" class="nbtnbig mw">수정</a></li>
							<li><a href="#" class="nbtnbig mw">삭제</a></li>
							<li><a href="#" class="sbtnMini mw">목록</a></li>
						</ul>
					</div>
				</div>
				<!-- //Btn Area -->

			</div>
		</div>
		<!-- //contents -->
	</div>
</div>
<jsp:include page="../common/footer.jsp"/>