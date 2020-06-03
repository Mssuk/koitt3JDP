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
					
					<div class="orderDivMt">
						<table summary="NO, 제목, 등록일, 조회수 순으로 공지사항을 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
							<caption>공지사항 보기</caption>
							<colgroup>
							<col width="10%" class="tnone" />
							<col width="*" />
							<col width="14%" class="tw25" />
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col" class="tnone">NO.</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
								<th scope="col" class="tnone">조회수</th>
							</thead>
							<tbody>
								<tr>
									<td class="tnone">1</td>
									<td class="left">
										<a href="#">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
										<img src="../images/ico/ico_new.gif" alt="NEW" />
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">2</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">3</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">4</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">5</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">6</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">7</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">8</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">9</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>

								<tr>
									<td class="tnone">10</td>
									<td class="left">
										<a href="#" class="lightgray">쟈뎅 전문 쇼핑몰 쟈뎅샵이 리뉴얼 오픈합니다.</a>
									</td>
									<td>14-01-28</td>
									<td class="tnone right">9999</td>
								</tr>
							</tbody>
						</table>
					</div>
						


					<div class="btnAreaList">
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
					<!-- //포토 구매후기 -->


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