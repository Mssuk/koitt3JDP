<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<jsp:include page="../common/header.jsp" />
<script type="text/javascript">
				
$(document).ready(function(){
	//댓글수정열기
	$(".modi").click(function(){
		$(this).parent().hide();
		var index=$(".modi").index(this);
		$(".modi_f").eq(index).show();
	});
	$(".reset_re").click(function(){
		var index2=$(".reset_re").index(this);
		$(".modi_f").eq(index2).hide();
		$(".modi").eq(index2).parent().show();
	});
	
	
});
	
	//댓글유효성
	function reply_ok(){
		var croodx = '<%=(String)session.getAttribute("id")%>';
		if(croodx=='null'){
			alert('로그인 후 등록가능합니다.');
			return false;
		}
		
		reply.submit();
	}
	
</script>

	
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
								<p class="txt">이벤트 기간<span> <fmt:formatDate value="${event_view.eventDto.event_start }" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event_view.eventDto.event_end }" pattern="yyyy-MM-dd"/></span></p>
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
								<tr>
									<th class="pre">PREV</th>
									<c:choose>
										<c:when test="${pn_list.eventPre==null }">
											<td>이전 글이 없습니다.</td>
										</c:when>
										<c:otherwise>
											<td><a href="event_view?event_num=${pn_list.eventPre.event_num }">${pn_list.eventPre.event_title }</a></td>
										</c:otherwise>
									</c:choose>
									<td>&nbsp;</td>
									</tr>	
									<tr>
										<th class="next">NEXT</th>
										<c:choose>
										<c:when test="${pn_list.eventNext==null }">
											<td>다음 글이 없습니다.</td>
										</c:when>
										<c:otherwise>
											<td><a href="event_view?event_num=${pn_list.eventNext.event_num }">${pn_list.eventNext.event_title }</a></td>
										</c:otherwise>
										</c:choose>
										<td>&nbsp;</td>
									</tr>
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
							<li class="btn"><input type="button" onclick="reply_ok()" class="replyBtn" value="등록" style="border:none;cursor: pointer;"></li>
						</ul>
						<p class="ntic">※ 비밀번호를 입력하시면 댓글이 비밀글로 등록 됩니다.</p>
					</form>

					<div class="replyBox">
						<c:choose>
						<%--관리자인가?--%>
							<c:when test="${reply_list==null }">
								<ul>
									<li>등록된 댓글이 없습니다.</li>
								</ul>
							</c:when>
							<c:when test="${id=='admin' }">
								<c:forEach var="re_dtos" items="${reply_list }">
								<ul>
									<li class="name">${re_dtos.name } <span>[<fmt:formatDate value="${re_dtos.event_re_modify }" pattern="yyyy-MM-dd  HH:mm:ss"/>]</span></li>
									<li class="txt">${re_dtos.event_re_content }</li>
								</ul>	
								</c:forEach>
							</c:when>
							<c:otherwise>
									<c:forEach var="re_dtos" items="${reply_list }">
									<form action="modify" method="post" name="modify_re">
									<ul>
										<li class="name">${re_dtos.name } <span>[<fmt:formatDate value="${re_dtos.event_re_modify }" pattern="yyyy-MM-dd  HH:mm:ss"/>]</span></li>
									    <c:choose>
									    	<c:when test="${re_dtos.pw!=null }">
												<li class="txt"><a href="password.html" class="passwordBtn"><span class="orange">※ 비밀글입니다.</span></a></li>
									    	</c:when>
									    	<c:otherwise>
											    <li class="txt">${re_dtos.event_re_content }</li>
									    	</c:otherwise>
									    </c:choose>
<%-- 										<c:if test="${re_dtos.id==id }"> --%>
											<li class="btn bt01">
												<a href="javascript:;" onclick="return false;" class="rebtn modi" >수정</a>
												<a href="#" onclick="deleteEvReply?event_re_num=${re_dtos.event_re_num }" class="rebtn">삭제</a>
											</li>
<%-- 										</c:if> --%>
									</ul>	
									<ul class="modi_f" style="display: none;">
										<li style="margin:10px 0;"></li>	
									    <li><textarea style="width:98%">${re_dtos.event_re_content }</textarea></li>
									    <li class="btn bt02">
											<input type="submit" value="저장" class="rebtn" style="border:none;cursor: pointer;">
											<a href="javascript:;" onclick="return false;" class="rebtn reset_re">취소</a>
									</ul>
									</form>
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