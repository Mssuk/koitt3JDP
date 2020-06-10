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
				<li class="last">1:1문의</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="customer_left_bar.jsp" />
			<script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>1:1문의</strong><span>쟈뎅에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
					
					<div class="checkMt">
						<table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>1:1문의</caption>
							<colgroup>
							<col width="19%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>분류</span></th>
									<td>
										<select>
											<option value="">선택해주세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>제목</span></th>
									<td>
										<input type="text" class="wlong" />
									</td>
								</tr>
								<tr>
									<th scope="row"><span>상세 내용</span></th>
									<td>
										<textarea class="tta"></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>첨부파일</span></th>
									<td>
										<input type="file" class="fileType" />
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>																
								<li><a href="#" class="nbtnbig">취소</a></li>
								<li><a href="#" class="sbtnMini">확인</a></li>
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