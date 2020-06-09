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
					
					<div class="orderDivMt">
						<table summary="NO, 제목, 등록일, 조회수 순으로 이벤트 당첨자을 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
							<caption>이벤트 당첨자 보기</caption>
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
								<c:choose>
									<c:when test="${list==null }">
										<tr>
											<td class="tnone"></td>
											<td class="left">
												당첨글이 없습니다.
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
										<c:forEach var="dtos" items="${list }">
											<tr>
												<td class="tnone">${dtos.rnum }</td>
												<td class="left">
													<a href="#">${dtos.w_title }</a>
													<fmt:formatDate value="${dtos.w_regist }" pattern="yyyy-MM-dd" var="write_dt"/>
													<c:if test="${today-1 <= write_dt }">
														<img src="../images/ico/ico_new.gif" alt="NEW" />
													</c:if>
												</td>
												<td><fmt:formatDate value="${dtos.w_regist }" pattern="yy-MM-dd"/></td>
												<td class="tnone right">${dtos.w_hit }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
						


					<!-- //list -->

					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="event?page=1&text=${text}&search=${search}" class="n" title="맨앞으로"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
						<c:choose>
								<c:when test="${pageNum!=1 }">
									<a href="event?page=${pageNum-1 }&text=${text}&search=${search}" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
								</c:when>
								<c:otherwise>
									<span class="pre" title="앞페이지가 없습니다."><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></span>
								</c:otherwise>
						</c:choose>
						<c:forEach var="i" items="${pageNumbering}">
							<c:choose>
								<c:when test="${pageNum == i}">
									<strong>${i}</strong>
							</c:when>
								<c:otherwise>
									<a href="event?page=${i}&text=${text}&search=${search}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							<c:choose>
								<c:when test="${pageNum!=maxPage }">
									<a href="event?page=${pageNum+1 }&text=${text}&search=${search}" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
								</c:when>
								<c:otherwise>
									<span class="next" title="뒤페이지가 없습니다."><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></span>
								</c:otherwise>
							</c:choose>
								
								<a href="event?page=${maxPage}&text=${text}&search=${search}" class="n" title="맨 뒤로"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</div>
						<!-- //페이징이동1 -->
					</div>
					
					<!-- 검색 -->
					<form class="searchWrap" name="search_bot" method="post" action="event">
						<div class="search">
							<ul>
								<li class="web"><img src="../images/txt/txt_search.gif" alt="search" /></li>
								<li class="se">
									<select name="search">
										<option value="all" />전체</option>
										<option value="tit" />제목</option>
										<option value="con" />내용</option>
									</select>
								</li>
								<li><input type="text" class="searchInput" name="text" placeholder="키워드를 입력하세요"/></li>
								<li class="web"><input type="submit" value="" title="검색" ></li>
								<li class="mobile"><input type="submit" value="" title="검색" ></li>
							</ul>
						</div>
					</form>
					<!-- //검색 -->

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