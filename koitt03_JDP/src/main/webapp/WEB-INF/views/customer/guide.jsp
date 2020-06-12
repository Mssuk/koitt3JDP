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
					
					<div class="cs-inner olyText">
						<div class="">
							<!-- goods notice -->
					<div class="goodsNotice disnone">
						<div class="headTitle depth">
						</div>

						<div class="detailDiv">
						<table summary="정책 및 공지 알림 게시판으로 회원가입안내, 주문안내, 결제안내, 배송안내, 교환/반품안내, 환불안내 순으로 조회 하실수 있습니다. " class="detailTable" border="1" cellspacing="0">
							<caption>정책 및 공지</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>회원가입<br/>안내</span></th>
									<td>
										<ul>
											<li>저희 쇼핑몰은 회원제로 운영합니다.</li>
											<li>회원가입비나 월회비, 연회비 등 어떠한 비용도 청구하지 않는 100% 무료입니다.</li>
											<li>회원님들께는 구매 시 포인트 혜택을 드립니다.</li>
										</ul>
									</td>
								</tr>

								<tr>
									<th scope="row"><span>주문 안내</span></th>
									<td>
										<ul>
											<li>Step 1 : 상품 검색</li>
											<li>Step 2 : 장바구니에 담기</li>
											<li>Step 3 : 회원 ID 로그인 또는 비회원으로 주문하기</li>
											<li>Step 4 : 주문 성공 화면(주문번호)</li>
										</ul>

										<p class="fn12">※비회원 주문인 경우 주문번호와 승인번호(카드 결제 시)를 꼭 메모해 두시기 바랍니다.<br/>&nbsp;&nbsp;&nbsp;단, 회원의 경우 자동으로 저장되므로 따로 관리하실 필요가 없습니다.</p>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><span>결제 안내</span></th>
									<td>
										<ul>
											<li>카드 결제나 무통장 입금을 하시는 경우 입금/결제 확인 후 상품이 배송됩니다.</li>
											<li>무통장 입금 시 주문자와 입금자가 다른 경우 배송이 지연될 수 있습니다. 게시판에 정보를 남겨주셔야 합니다. </li>
										</ul>
									</td>
								</tr>
								
								<tr>
									<th scope="row"><span>배송 안내</span></th>
									<td>
										<ul>
											<li>배송 방법 : 택배</li>
											<li>배송 지역 : 전국 지역 (제주 도서/산간지역 별도)</li>
											<li>배송 비용 : 총 결제금액이 10,000원 미만일 경우 2,500원 추가됩니다.</li>
											<li>배송 안내 : 재고가 없거나 재입고 될 경우 7~14일이 소요됩니다.</li>
										</ul>
									</td>
								</tr>

								<tr>
									<th scope="row"><span>교환/반품<br/>안내</span></th>
									<td>
										<ul>
											<li>저희 쇼핑몰은 교환/반품 정책을 운영하고 있습니다.</li>
											<li>사이즈 교환에 한하여는 1회 교환이 가능합니다. (단, 택배비는 고객 부담입니다.)</li>
											<li>교환 시 제품을 수령한 날로부터 24시간 이내 1:1문의 게시판 혹은 고객센터로 연락을 주시고 3일 이내에 보내주신 상품에 한하여 교환됩니다.</li>
											<li>제품에 하자가 있는 경우에는 동일 사이즈, 동일 디자인으로 재교환 해 드립니다.</li>
										</ul>
									</td>
								</tr>

								<tr>
									<th scope="row"><span>환불 안내</span></th>
									<td>
										<ul>
											<li>환불 시 반품 확인 여부를 확인 한 후 3일 이내에 결제금액을 환불해 드립니다.</li>
											<li>신용카드로 결제하신 경우, 신용카드 승인을 취소하면 결제 대금이 청구되지 않습니다. </li>
										</ul>
									</td>
								</tr>
							</tbody>
						</table>
						</div>
					</div>
						</div>
					</div>
					
					
				

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
