<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
    
<jsp:include page="../common/header.jsp" />
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="event">EVENT</a></li>
				<li class="last">진행중 이벤트</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="event_left_bar.jsp" />

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>진행중 이벤트</strong><span>쟈뎅샵의 특별한 혜택이 가득한 이벤트에 참여해 보세요.</span></h2>
					
					<!-- list -->
					<div class="eventList">
						<ul>
							<!-- 없을때 -->
							<c:choose>
								<c:when test="${list==null }">
									<li>
										<div><span>진행중인 이벤트가 없습니다.</span></div>
									</li>
								</c:when>
								<c:otherwise>
									<!-- 반복 -->
									<c:forEach var="dtos" items="${list }">
										<li>
											<a href="event_view?event_num=${dtos.event_num }">
											<div class="img">
												<img src="../images/img/${dtos.event_image1 }" alt="진행중 이벤트" />
											</div>
											<div class="txt">
												<div class="subject">${dtos.event_title }</div>
												<div class="day">이벤트 기간 : <fmt:formatDate value="${dtos.event_start }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${dtos.event_end }" pattern="yyyy-MM-dd"/></div>
											</div>
											</a>
										</li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- //list -->

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
					
					<!-- 검색 -->
					<form class="searchWrap" name="search_bot" method="post" action="event_view">
						<div class="search">
							<ul>
								<li class="web"><img src="../images/txt/txt_search.gif" alt="search" /></li>
								<li><input type="text" class="searchInput" name="txt" placeholder="키워드를 입력하세요"/></li>
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


<jsp:include page="../common/footer.jsp" />
