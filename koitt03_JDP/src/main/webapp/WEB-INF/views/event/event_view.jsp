<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<jsp:include page="../common/header.jsp" />

	
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="main">HOME</a></li>
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
					
					<div class="viewDivMt">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li>${event_view.eventDto.event_title }</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">이벤트 기간<span> <fmt:formatDate value="${event_view.eventDto.event_start }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event_view.event.event_end }" pattern="yyyy-MM-dd"/></span></p>
							</div>
						</div>

						<div class="viewContents">
								<c:if test="${event_view.eventDto.event_image2!=null }">
									<img src="../images/img/${dto.event_image2}" alt="" />
								</c:if>
								<c:if test="${event_view.eventDto.event_content!=null }">
									${event_view.eventDto.event_content}
								</c:if>
								<c:if test="${event_view.eventDto.coupon_num!=null }">
								<ul class="coupon_box">
									<li>
											<p><em>${event_view.couponDto.coupon_pay }</em>원</p>
											<p>${event_view.couponDto.coupon_name }</p>
											<p><fmt:formatDate value="${event_view.couponDto.endday }" pattern="yyyy-MM-dd"/>까지 사용가능</p>
								    </li>
								    <li>
										<a href="#" class="download">
											<span>다운로드</span>
										</a>
								    </li>
							    </ul>
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
							<col width="100px" />
							</colgroup>
							<tbody>
								<c:choose>
									<c:when test="${pn_list.size()==0 }">
										<tr>
											<th class="pre">PREV</th>
											<td>이전 글이 없습니다.</td>
											<td>&nbsp;</td>
										</tr>	
										<tr>
											<th class="next">NEXT</th>
											<td>다음 글이 없습니다.</td>
											<td>&nbsp;</td>
										</tr>
									</c:when>
									<c:when test="${pn_list.size()==1 }">
										<c:choose>
											<c:when test="${pn_list.rnum<event_view.eventDto.rnum }">
												<tr>
													<th class="pre">PREV</th>
													<td>이전 글이 없습니다.</td>
													<td>&nbsp;</td>
												</tr>	
												<tr>
													<th class="next">NEXT</th>
													<td><a href="event_view?event_num=${pn_list.get(0).event_num }">${pn_list.get(0).event_title }</a></td>
													<td>&nbsp;</td>
												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<th class="pre">PREV</th>
													<td><a href="event_view?event_num=${pn_list.get(0).event_num }">${pn_list.get(0).event_title }</a></td>
													<td>&nbsp;</td>
												</tr>
												<tr>
													<th class="next">NEXT</th>
													<td>다음 글이 없습니다.</td>
													<td>&nbsp;</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:if test="${pn_list.get(0).rnum>pn_list.get(1).rnum }">
											<c:set var="pre" value="${pn_list.get(0) }"/>
											<c:set var="next" value="${pn_list.get(1) }"/>
										</c:if>
										<c:if test="${pn_list.get(0).rnum<pn_list.get(1).rnum }">
											<c:set var="next" value="${pn_list.get(0) }"/>
											<c:set var="pre" value="${pn_list.get(1) }"/>
										</c:if>
										<tr>
											<th class="pre">PREV</th>
											<td><a href="event_view?event_num=${pre.event_num }">${pre.event_title }</a></td>
											<td>&nbsp;</td>
										</tr>	
										<tr>
											<th class="next">NEXT</th>
											<td><a href="event_view?event_num=${next.event_num }">${next.event_title }</a></td>
											<td>&nbsp;</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->

					
					<!-- 댓글-->
					<form class="replyWrite" name="reply" action="event_reply" method="post">
						<ul>
							<li class="in">
								<input type="text" name="event_num" value="${dto.event_num }" hidden="">
								<input type="text" name="id" value="${id }" hidden="">
								<p class="txt">총 <span class="orange">${reply_count }</span> 개의 댓글이 달려있습니다.</p>
								<p class="password">비밀번호&nbsp;&nbsp;<input type="password" class="replynum" name="pw" /></p>
								<textarea class="replyType" name="event_re_content"></textarea>
							</li>
							<li class="btn"><input type="submit" class="replyBtn" value="등록" style="border:none;cursor: pointer;"></li>
						</ul>
						<p class="ntic">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
					</form>

					<div class="replyBox">
						<c:choose>
						<%--댓글이 있는가?--%>
							<c:when test="${replyList==null }">
								<ul>
									<li>등록된 댓글이 없습니다.</li>
								</ul>
							</c:when>
							<c:otherwise>
								<c:forEach var="re_dtos" items="replyList">
									<%--로그인한아이디가 있는가?--%>
									<c:set var="name"       value="${resultInfo.name}" />
									<c:set var="totalLength" value="${fn:length(name) }" />
									<c:set var="first"      value="${fn:substring(name, 0, 1) }" />
									<c:set var="last"      value="${fn:substring(name, 2, totalLength) }" />
									<c:choose>
										<c:when test="${id==null}">
											<c:choose>
												<c:when test="${re_dtos.pw!=null }">
													<%--비번이 있음 --%>
													<ul class="${re_dtos.event_re_num }">
														<li class="name">${re_dtos.id} <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
														<li class="txt">
														<a href="password" class="passwordBtn"><span class="orange">※ 비밀글입니다.</span></a>
														</li>
													</ul>	
													<%--비번을 맞춤 --%>
													<ul class="${re_dtos.event_re_num }">
														<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
														<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
													</ul>							
												</c:when>
												<c:otherwise>
													<%--비번이없음 --%>
													<ul>
														<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
														<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
													</ul>
												</c:otherwise>
											</c:choose>		
										</c:when>
										<c:when test="${id=='admin' }">
											<%--관리자 --%>
											<ul>
												<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
												<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
											</ul>
										</c:when>
										<c:when test="${id==re_dtos.id }">
											<%--아이디가 같음 --%>
											<c:choose>
											<c:when test="${re_dtos.pw!=null }">
												<%--비번이 있음 --%>
												<ul class="repl_pw_view">
													<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
													<li class="txt">
													<a href="password" class="passwordBtn"><span class="orange">※ 비밀글입니다.</span></a>
													</li>
												</ul>	
												<ul class="hide_reply">
													<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
													<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
													<li class="btn">
														<a href="#" class="rebtn">수정</a>
														<a href="#" class="rebtn">삭제</a>
													</li>
												</ul>							
											</c:when>
											<c:otherwise>
												<%--비번이없음 --%>
												<form action="reply_modify" name="reply_modify" method="post" class="${re_dtos.event_re_num }">
													<ul>
														<li class="name">jjabcde <input type="text" value="id" name="id" hidden="">
														<input type="text" value="id" name="event_re_num" hidden="">
														<span>[2014-03-04&nbsp;&nbsp;15:01:59]</span>
														</li>
														<li class="txt"><textarea name="event_re_content" class="replyType">"대박!!! 이거 저한테 완전 필요한 이벤트였어요!!"</textarea></li>
														<li class="btn">
														<input type="submit" class="rebtn" value="수정" style="border:none;cursor: pointer;padding-top: 0px;">
														<a href="deleteEvReply?event_re_num=${re_dtos.event_re_num }" class="rebtn">삭제</a>
														</li>
													</ul>	
												</form>
												<ul class="${re_dtos.event_re_num }">
													<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
													<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
													<li class="btn">
														<a href="re_modify_view(${re_dtos.event_re_num })" class="rebtn">수정</a>
														<a href="deleteEvReply?event_re_num=${re_dtos.event_re_num }" class="rebtn">삭제</a>
													</li>
												</ul>
											</c:otherwise>
											</c:choose>				
										</c:when>
										<c:otherwise>
										<%--아이디가 로그인한 아이디와 다름 --%>
											<c:choose>
											<c:when test="${re_dtos.pw!=null }">
												<%--비번이 있음 --%>
												<ul class="${re_dtos.event_re_num }">
													<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
													<li class="txt">
													<a href="password" class="passwordBtn"><span class="orange">※ 비밀글입니다.</span></a>
													</li>
												</ul>	
												<%--비번을 맞춤 --%>
												<ul class="${re_dtos.event_re_num }">
													<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
													<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
												</ul>							
											</c:when>
											<c:otherwise>
												<%--비번이없음 --%>
												<ul>
													<li class="name">jjabcde <span>[2014-03-04&nbsp;&nbsp;15:01:59]</span></li>
													<li class="txt">대박!!! 이거 저한테 완전 필요한 이벤트였어요!!</li>
												</ul>
											</c:otherwise>
											</c:choose>							
										</c:otherwise>									
									</c:choose>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- //댓글 -->


					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href="javascript:history.go(-1)" class="sbtnMini mw">목록</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					
				</div>
			</div>
			<!-- //contents -->


<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){
	
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 540;
	}else{
		var layerCheck = 320;
	}

	$(".passwordBtn").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : layerCheck,
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
		<!-- quickmenu -->
		<jsp:include page="../common/quickmenu.jsp" />
		<!-- //quickmenu -->

	</div>
	<!-- //container -->




<!--footer입니다. -->
<jsp:include page="../common/footer.jsp" />