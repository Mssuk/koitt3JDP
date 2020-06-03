<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">비회원 주문조회</a></li>
				<li class="last">반품/교환 현황</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title">비회원<br/>주문조회</div>
				<ul>	
					<li><a href="#" id="leftNavi1">비회원 주문조회</a></li>
					<li class="last"><a href="#" id="leftNavi2">반품/교환 현황</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>반품/교환 현황</strong><span>비회원 구매하신 주문내역을 확인하실 수 있습니다.</span></h2>
					
			
					<h3 class="dep">반품/교환 상품정보</h3>
					<div class="orderDivNm">
						<table summary="주문일자/주문번호, 분류, 상품명, 가격, 상태, 사유 순으로 반품/교환 현황을 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>반품/교환 현황 사유보기</caption>
							<colgroup>
							<col width="25%" class="tw30" />
							<col width="7%" class="tnone" />
							<col width="*" />
							<col width="13%" class="tnone" />
							<col width="10%" class="tw18"/>
							<col width="15%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col">주문일자 <span>/ 주문번호</span></th>
								<th scope="col" class="tnone">분류</th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">상태</th>
								<th scope="col" class="tnone">사유</th>
							</thead>
							<tbody>
								<tr>
									<td>
										<p class="day">2012-05-30</p>
										<p class="orderNum">201205301204-8057</p>
									</td>
									<td class="tnone"><span class="heavygray">반품</span></td>
									<td class="left">
										쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p
									</td>
									<td class="tnone">999,999 원</td>
									<td><span class="orange">반품신청</span></td>
									<td class="tnone">
										<a href="../mypage/reason.html" class="nbtnbig iwc80">사유보기</a>
									</td>
								</tr>

								<tr>
									<td>
										<p class="day">2012-05-30</p>
										<p class="orderNum">201205301204-8057</p>
									</td>
									<td class="tnone"><span class="heavygray">교환</span></td>
									<td class="left">
										쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p
									</td>
									<td class="tnone">999,999 원</td>
									<td><span class="orange">교환승인</span></td>
									<td class="tnone">
										<a href="../mypage/reason.html" class="nbtnbig iwc80">사유보기</a>
									</td>
								</tr>

								<tr>
									<td>
										<p class="day">2012-05-30</p>
										<p class="orderNum">201205301204-8057</p>
									</td>
									<td class="tnone"><span class="heavygray">반품</span></td>
									<td class="left">
										쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p
									</td>
									<td class="tnone">999,999 원</td>
									<td><span class="orange">반품승인</span></td>
									<td class="tnone">
										<a href="../mypage/reason.html" class="nbtnbig iwc80">사유보기</a>
									</td>
								</tr>

							</tbody>
						</table>

						<div class="noData">
							등록된 상품이 없습니다.
						</div>
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
					

<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){

	$(".iwc80").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : 486,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});

});
</script>


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