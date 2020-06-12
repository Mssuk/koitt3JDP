<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />
	<script type="text/javascript">
		$(document).ready(function(){
			var ty='${type}';
			if(ty==''){
				ty='all';
			}
			$("."+ty).addClass("on");
		});
	</script>
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="notice">CUSTOMER</a></li>
				<li class="last">FAQ</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="customer_left_bar.jsp" />
			<script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>FAQ</strong><span>회원님들께서 자주 묻는 질문들을 모아 놓았습니다.</span></h2>
					<div class="faqTab">
						<c:choose>
						<c:when test="${text!='' }">
							<h3><span>'<em class="keyword">${text }</em>'에 대한 FAQ 내 검색 결과입니다.</span></h3>
						</c:when>
						<c:otherwise>
							<h3></h3>
						</c:otherwise>
						</c:choose>
						<ul>
							<li><a href="faq" class="all">전체</a></li>
							<li class="dep"><a href="faq?type=join" class="join">회원가입</a></li>
							<li><a href="faq?type=product" class="product">상품</a></li>
							<li class="last"><a href="faq?type=order" class="order">주문</a></li>
						</ul>						
					</div>	
					
					<!-- FAQ -->
					<div class="faqList">
						<ul>
							<!-- list -->
							<c:choose>
								<c:when test="${list==null }">
									<c:choose>
											<c:when test="${searchflag==null }">
												<%-- 검색x --%>
												<li>
													<div class="question">
													<div class="blet" style="top: 7px">FAQ 준비중입니다.</div>
													</div>
												</li>
											</c:when>
											<c:otherwise>
												<li>
													<div class="question">
													<div class="blet" style="top: 7px">검색 결과가 없습니다.</div>
													</div>
												</li>
											</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:forEach var="dtos" items="${list }">
										<li>
											<a href="javascript:;" class="faqbtn">
												<div class="question">
													<div class="blet">Q</div>
													<div class="category">${dtos.faq_type }</div>
													<div class="title">${dtos.faq_title }</div>
												</div>
											</a>
			
											<div class="faqanswer">
												<div class="faqbox">
													<div class="blet">A</div>
													<div class="text">
		<!-- 												<strong><u>소비자상담실(02-546-3881)</u></strong> -->
														${dtos.faq_content }
													</div>
												</div>
											</div>
										</li>
									</c:forEach>
								
								</c:otherwise>
							</c:choose>
							
						</ul>
					</div>
					<!-- //FAQ -->


					
					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="faq?type=${type }&page=1&text=${text}&search=${search}" class="n" title="맨앞으로"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
						<c:choose>
								<c:when test="${pageNum!=1 }">
									<a href="faq?type=${type }&page=${pageNum-1 }&text=${text}&search=${search}" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
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
									<a href="faq?type=${type }&page=${i}&text=${text}&search=${search}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							<c:choose>
								<c:when test="${pageNum!=maxPage }">
									<a href="faq?type=${type }&page=${pageNum+1 }&text=${text}&search=${search}" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
								</c:when>
								<c:otherwise>
									<span class="next" title="뒤페이지가 없습니다."><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></span>
								</c:otherwise>
							</c:choose>
								
								<a href="faq?type=${type }&page=${maxPage}&text=${text}&search=${search}" class="n" title="맨 뒤로"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</div>
						<!-- //페이징이동1 -->
					</div>
					
					<!-- 검색 -->
					<form class="searchWrap" name="search_bot" method="post" action="faq?type=${type }">
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
