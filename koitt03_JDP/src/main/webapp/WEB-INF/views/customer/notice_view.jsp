<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
 <!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />

<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="notice">CUSTOMER</a></li>
				<li class="last">NOTICE</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="customer_left_bar.jsp" />
			<script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>NOTICE</strong><span>쟈뎅샵 소식을 전해드립니다.</span></h2>

					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>${dtos.dto.n_title }</li>
								</ul>
							</div>
							<div class="data">
								<ul>
									<li>등록일<span><fmt:formatDate value="${dtos.dto.n_regist }" pattern="yyyy-MM-dd"/></span></li>
									<li>조회수<span><fmt:formatNumber value="${dtos.dto.n_hit }" pattern="#,###" /></span></li>
								</ul>
							</div>
						</div>

						<div class="viewContents">
							${dtos.dto.n_content}<br>
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
									<c:choose>
										<c:when test="${dtos.pre==null }">
											<td>이전 글이 없습니다.</td>
										</c:when>
										<c:when test="${text!='' }">
											<td><a href="notice_view?n_num=${dtos.pre.n_num }&pageNum=${pageNum}&search=${search}&text=${text}">${dtos.pre.n_title }</a></td>
										</c:when>
										<c:otherwise>
											<td><a href="notice_view?n_num=${dtos.pre.n_num }&pageNum=${pageNum}">${dtos.pre.n_title }</a></td>
										</c:otherwise>
									</c:choose>
								</tr>

								<tr>
									<th class="next">NEXT</th>
									<c:choose>
										<c:when test="${dtos.next==null }">
											<td>다음 글이 없습니다.</td>
										</c:when>
										<c:when test="${text!='' }">
											<td><a href="notice_view?n_num=${dtos.next.n_num }&pageNum=${pageNum}&search=${search}&text=${text}">${dtos.next.n_title }</a></td>
										</c:when>
										<c:otherwise>
											<td><a href="notice_view?n_num=${dtos.next.n_num }">${dtos.next.n_title }</a></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->


					<!-- Btn Area -->
					<div class="btnArea btline">
						<div class="bRight">
							<ul>
								<c:choose>
									<c:when test="${text!='' }">
										<li><a href="notice?pageNum=${pageNum}&search=${search}&text=${text}" class="sbtnMini mw">목록</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="notice?pageNum=${pageNum}" class="sbtnMini mw">목록</a></li>
									</c:otherwise>
								</c:choose>
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
		