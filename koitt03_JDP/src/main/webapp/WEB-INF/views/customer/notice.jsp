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
				<li><a href="/main">HOME</a></li>
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
					<h2><strong>NOTICE</strong><span>쟈뎅샵 소식을 전해드립니다.</span>
					</h2>
					<c:if test="${text!='' }">
						<h3><span>'<em class="keyword">${text }</em>'에 대한 공지사항 내 검색 결과입니다.</span>						</h3>
					</c:if>
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
								<c:choose>
									<c:when test="${list==null }">
										<tr>
											<td class="tnone"></td>
											<c:choose>
											<c:when test="${searchflag==null }">
												<%-- 검색x --%>
												<td class="left">
													공지사항 준비중입니다.
												</td>
											</c:when>
											<c:otherwise>
												<td class="left">
													검색 결과가 없습니다.
												</td>
											</c:otherwise>
											</c:choose>
											<td></td>
											<td class="tnone right"></td>
										</tr>
									</c:when>
									<c:otherwise>
										<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
										<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"/>
										<c:forEach var="dtos" items="${list}">
										<tr>
											<td class="tnone">${dtos.rnum } </td>
											<td class="left">
											<c:choose>
												<c:when test="${text!='' }">
												<a href="notice_view?n_num=${dtos.n_num }&pageNum=${pageNum}&search=${search}&text=${text}" class="lightgray">${dtos.n_title }</a>
												</c:when>
											<c:otherwise>
												<a href="notice_view?n_num=${dtos.n_num }&pageNum=${pageNum}" class="lightgray">${dtos.n_title }</a>
											</c:otherwise>
											</c:choose>
											<fmt:parseDate value="${dtos.n_regist}" var="n_regist" pattern="yyyy-MM-dd"/>
											<fmt:parseNumber value="${n_regist.time / (1000*60*60*24)}" integerOnly="true" var="regist"/>
											<c:set value="${today - regist }" var="dayDiff" />
											<c:if test="${dayDiff < 3}">
												<img src="../images/ico/ico_new.gif" alt="NEW">
											</c:if>
											</td>
											<td>
											<c:choose>
											    <c:when test="${dayDiff == 1 }">
											        <fmt:formatDate value="${dtos.n_regist }" pattern="HH:mm:ss"/>
											    </c:when>
											    <c:otherwise>
											        <fmt:formatDate value="${dtos.n_regist }" pattern="yyyy-MM-dd"/>
											    </c:otherwise>
											</c:choose>
											</td>
											<td class="tnone right">${dtos.n_hit }</td>
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

						<a href="notice?page=1&text=${text}&search=${search}" class="n" title="맨앞으로"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
						<c:choose>
								<c:when test="${pageNum!=1 }">
									<a href="notice?page=${pageNum-1 }&text=${text}&search=${search}" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
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
									<a href="notice?page=${i}&text=${text}&search=${search}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							<c:choose>
								<c:when test="${pageNum!=maxPage }">
									<a href="notice?page=${pageNum+1 }&text=${text}&search=${search}" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
								</c:when>
								<c:otherwise>
									<span class="next" title="뒤페이지가 없습니다."><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></span>
								</c:otherwise>
							</c:choose>
								
								<a href="notice?page=${maxPage}&text=${text}&search=${search}" class="n" title="맨 뒤로"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</div>
						<!-- //페이징이동1 -->
					</div>
					
					<!-- 검색 -->
					<form class="searchWrap" name="search_bot" method="post" action="notice">
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
					<!-- 검색 -->

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