<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
 <!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />
	<!-- container -->

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="event">EVENT</a></li>
				<li class="last">당첨자 발표</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="event_left_bar.jsp" />
			<script type="text/javascript">initSubmenu(3,0);</script>
			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>당첨자 발표</strong><span>쟈뎅샵의 특별한 혜택이 가득한 이벤트의 당첨자를 발표합니다. </span></h2>

					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>${dtos.dto.w_title }</li>
								</ul>
							</div>
							<div class="data">
								<ul>
									<li>등록일<span><fmt:formatDate value="${dtos.dto.w_regist }" pattern="yyyy-MM-dd"/></span></li>
									<li>조회수<span><fmt:formatNumber value="${dtos.dto.w_hit }" pattern="#,###" /></span></li>
								</ul>
							</div>
						</div>

						<div class="viewContents">
							${dtos.dto.w_content}<br>
							<c:if test="${dtos.dto.w_image!=null}">
							<img src="${dtos.dto.w_image}" alt=""/>
							</c:if>
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
										<c:otherwise>
											<td><a href="prizewinner_view?event_num=${dtos.pre.w_num }">${dtos.pre.w_title }</a></td>
										</c:otherwise>
									</c:choose>
								</tr>

								<tr>
									<th class="next">NEXT</th>
									<c:choose>
										<c:when test="${dtos.next==null }">
											<td>다음 글이 없습니다.</td>
										</c:when>
										<c:otherwise>
											<td><a href="prizewinner_view?event_num=${dtos.next.w_num }">${dtos.next.w_title }</a></td>
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
								<li><a href="prizewinner" class="sbtnMini mw">목록</a></li>
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

