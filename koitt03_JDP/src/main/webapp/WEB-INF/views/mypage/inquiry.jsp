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


				<div class="orderDivNm">
					<table summary="NO, 종류, 적립포인트, 적립날짜, 상태 순으로 현재 적립된 포인트를 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
						<caption>적립내역 보기</caption>
						<colgroup>
						<col width="9%" class="tnone" />
						<col width="14%" class="tw20" />
						<col width="*" />
						<col width="15%" class="tnone" />
						<col width="15%" class="tw30" />
						</colgroup>
						<thead>
							<th scope="col" class="tnone">NO.</th>
							<th scope="col">분류</th>
							<th scope="col">제목</th>
							<th scope="col" class="tnone">등록일</th>
							<th scope="col">처리상태</th>
						</thead>
						<tbody>
							<tr>
								<td class="tnone">4</td>
								<td>배송</td>
								<td class="left"><a href="#">배송문의 드립니다!</a></td>
								<td class="tnone">14-05-31</td>
								<td>
									<ul class="state">
										<li><div class="nbtnMini iw83">답변대기</div></li>
									</ul>
								</td>
							</tr>

							<tr>
								<td class="tnone">3</td>
								<td>상품</td>
								<td class="left"><a href="#">상품 재입고 언제 되나요? (1)</a></td>
								<td class="tnone">14-05-31</td>
								<td>
									<ul class="state">
										<li><div class="obtnMini iw83">답변완료</div></li>
									</ul>
								</td>
							</tr>

							<tr>
								<td class="tnone">2</td>
								<td>반품/교환</td>
								<td class="left"><a href="#">문의드립니다. (1)</a></td>
								<td class="tnone">14-05-31</td>
								<td>
									<ul class="state">
										<li><div class="obtnMini iw83">답변완료</div></li>
									</ul>
								</td>
							</tr>

							<tr>
								<td class="tnone">1</td>
								<td>기타</td>
								<td class="left"><a href="#">상품 문의 드립니다 (1)</a></td>
								<td class="tnone">14-05-31</td>
								<td>
									<ul class="state">
										<li><div class="obtnMini iw83">답변완료</div></li>
									</ul>
								</td>
							</tr>

						</tbody>
					</table>

					<div class="noData">
						문의 하신 내용이 없습니다.
					</div>
				</div>


				<div class="btnAreaList">

					<div class="bwright">
						<ul>
							<li><a href="#" class="writeBtn">글쓰기</a></li>
						</ul>
					</div>

					<!-- 페이징이동1 -->
					<div class="allPageMoving1">

					<a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
					<strong>1</strong>
					<a href="#">2</a>
					<a href="#">3</a>
					<a href="#">4</a>
					<a href="#">5</a>
					<a href="#" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="#" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

					</div>
					<!-- //페이징이동1 -->
				</div>

				<div class="searchWrap">
					<div class="search">
						<ul>
							<li class="web"><img src="../images/txt/txt_search.gif" alt="search" /></li>
							<li class="se">
								<select>
									<option value="" />제목</option>
								</select>
							</li>
							<li><input type="text" class="searchInput" /></li>
							<li class="web"><a href="#"><img src="../images/btn/btn_search.gif" alt="검색" /></a></li>
							<li class="mobile"><a href="#"><img src="../images/btn/btn_search_m.gif" alt="검색" /></a></li>
						</ul>
					</div>
				</div>

			</div>
		</div>
		<!-- //contents -->


	</div>
</div>
<!-- //container -->
<jsp:include page="../common/footer.jsp"/>