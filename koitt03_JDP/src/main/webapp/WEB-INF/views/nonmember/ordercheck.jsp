<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
   <!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />
<c:if test="${nonOk!=o_num }">
	<script type="text/javascript">
		alert('잘못된 접근입니다');
		window.location.href='/membership/login';
	</script>
</c:if>	

<script type="text/javascript">
	function retu_cancel(a){
		if(confirm("반품/교환 신청을 취소하시겠습니까?")){
		       
			$.ajax({
		        url : "/delChangeOne",   // 받을 url
		        type : "POST",   
		        data: JSON.stringify({key:a}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
		        contentType: "application/json",
		        success : function (data) {
		           if(data== 1){ //리턴값이 ok일 경우
		        	  location.reload(); //새로고침 해준다.
		              alert('취소 완료');
		           }else if(data == 0){
						alert('취소 실패');
					}
		        },
		        error : function(){ //오류일경우 경고창을 띄움
		           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: deleteError)");
		        }
		     });
			}
	}
</script>	

<script type="text/javascript">
	//입금전 취소
	function order_cancel(a){
		if(confirm("주문을 취소하시겠습니까? \n같은 주문번호에 해당하는 상품은 모두 취소됩니다.")){
		       
			$.ajax({
		        url : "/delOrderTypeA",   // 받을 url
		        type : "POST",   
		        data: JSON.stringify({o_num:a}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
		        contentType: "application/json",
		        success : function (data) {
		           if(data== 1){ //리턴값이 ok일 경우
		              alert('취소 완료 \n 메인으로 돌아갑니다');
		              window.location.href='/main';
		           }else if(data == 0){
						alert('취소 실패 \n 잠시 후 다시 시도해주세요 ');
						location.reload(); //새로고침 해준다.
					}
		        },
		        error : function(){ //오류일경우 경고창을 띄움
		           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: deleteError)");
		        }
		     });
			}
	}
</script>

<script type="text/javascript">
	//입금후 취소
	function order_cancel2(a){
		if(confirm("주문을 취소하시겠습니까? \n같은 주문번호에 해당하는 상품은 모두 취소되며 \n 영업일기준 최소 3일이상 소요됩니다")){
		       
			$.ajax({
		        url : "/delOrderTypeB",   // 받을 url
		        type : "POST",   
		        data: JSON.stringify({o_num:a}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
		        contentType: "application/json",
		        success : function (data) {
		           if(data== 1){ //리턴값이 ok일 경우
		              alert('취소 완료 \n 진행상황은 익일부터 고객센터로 문의바랍니다.');
		              location.reload(); //새로고침 해준다.
		           }else if(data == 0){
						alert('취소 실패 \n 잠시 후 다시 시도해주세요 ');
					}
		        },
		        error : function(){ //오류일경우 경고창을 띄움
		           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: deleteError)");
		        }
		     });
			}
	}
</script>
<script type="text/javascript">
	//입금후 취소를 철회
	function retu_cancel2(a){
		if(confirm("주문취소를 철회하시겠습니까?")){
		       
			$.ajax({
		        url : "/delChangeOneB",   // 받을 url
		        type : "POST",   
		        data: JSON.stringify({o_num:a}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
		        contentType: "application/json",
		        success : function (data) {
		           if(data== 1){ //리턴값이 ok일 경우
		              alert('취소 완료 \n 진행상황은 익일부터 고객센터로 문의바랍니다.');
		              location.reload(); //새로고침 해준다.
		           }else if(data == 0){
						alert('취소 실패 \n 잠시 후 다시 시도해주세요 ');
					}
		        },
		        error : function(){ //오류일경우 경고창을 띄움
		           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: deleteError)");
		        }
		     });
			}
	}
</script>
	
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="/main">HOME</a></li>
				<li><a href="/nonmember/ordercheck_view?o_num=${o_num }">비회원 주문조회</a></li>
				<li class="last">비회원 주문조회</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title">비회원<br/>주문조회</div>
				<ul>	
					<li><a href="/nonmember/ordercheck_view?o_num=${o_num }" id="leftNavi1">비회원 주문조회</a></li>
					<li class="last"><a href="takeback_state?o_num=${o_num}" id="leftNavi2">반품/교환 현황</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>비회원 주문조회</strong><span>비회원 구매하신 주문내역을 확인하실 수 있습니다.</span></h2>
					<h3 class="dep" style="line-height: 0px">주문내역</h3>
					<div class="orderDivNm">
						<table summary="주문일자/주문번호, 상품명, 가격, 수량, 주문상태 순으로 조회를 하실수 있습니다." class="orderTable" border="1" >
							<caption>주문게시판</caption>
							<colgroup>
							<col width="25%" class="tw28" />
							<col width="*" />
							<col width="15%" class="tnone" />
							<col width="8%" class="tnone" />
							<col width="18%" class="tw30" />
							</colgroup>
							<thead>
								<th scope="col">주문일자 <span>/ 주문번호</span></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col" class="tnone">수량</th>
								<th scope="col">주문상태</th>
							</thead>
							<tbody>
								<c:forEach var="dtos" items="${orderList}">
									<tr>
										<td>
											<p class="day"><fmt:formatDate value="${dtos.o_date }" pattern="yyyy-MM-dd"/></p>
											<p class="orderNum">${dtos.o_num }</p>
										</td>
										<td class="left">
											${dtos.product_name }
										</td>
										<td class="tnone"><span><fmt:formatNumber value="${dtos.price }" pattern="#,###" /></span> 원</td>
										<td class="tnone"><span><fmt:formatNumber value="${dtos.o_quant }" pattern="#,###" /></span>개</td>
										<td>
											<c:choose>
												<c:when test="${dtos.c_state!='' }">
													<c:if test="${dtos.c_state=='대기중' }">
														<span class="lightgray">${dtos.c_state }</span>
														<ul class="state">
															<li><a href="javascript:;" onclick="retu_cancel('${dtos.key}')" class="nbtnMini">취소</a></li>
														</ul>	
													</c:if>
													<c:if test="${dtos.c_state=='취소대기중' }">
														<span class="lightgray">${dtos.c_state }</span>
														<ul class="state">
															<li><a href="javascript:;" onclick="retu_cancel2('${dtos.o_num}')" class="nbtnMini">취소</a></li>
														</ul>	
													</c:if>
													<c:if test="${dtos.c_state!='대기중'&&dtos.c_state!='취소대기중' }">
														<span class="orange">${dtos.c_state }</span>
													</c:if>
												</c:when>
												<c:when test="${dtos.c_state=='' }">
													<c:choose>
														<c:when test="${dtos.o_status=='배송완료'||dtos.o_status=='구매확정' }">
															<span class="heavygray">배송완료</span>
															<ul class="state">	
																<li class="r5"><a href="return?num1=${dtos.key }&num2=${dtos.o_num}" class="obtnMini iw40">교환</a></li>
																<li><a href="return?num1=${dtos.key }&num2=${dtos.o_num}" class="nbtnMini iw40">반품</a></li>
																<c:choose>
																	<c:when test="${dtos.o_status=='배송완료'}">
																		<li><a href="#" class="decidebtn">구매확정</a></li>
																	</c:when>
																	<c:when test="${dtos.o_status=='구매확정'}">
																		<li><a href="review" class="popBtn">리뷰작성</a></li>
																	</c:when>
																</c:choose>
															</ul>										
														</c:when>
														<c:when test="${dtos.o_status=='입금대기중' }">
															<span class="lightgray">${dtos.o_status }</span>
															<ul class="state">
																<li><a onclick="order_cancel('${dtos.o_num }')" class="nbtnMini iw83">취소</a></li>
															</ul>										
														</c:when>
														<c:when test="${dtos.o_status=='입금완료' }">
																<span class="lightgray">${dtos.o_status }</span>
																<ul class="state">
																	<li><a onclick="order_cancel2('${dtos.o_num }')" class="nbtnMini iw83">취소</a></li>
																</ul>										
														</c:when>
														<c:otherwise>
																<span class="orange ">${dtos.o_status }</span>									
														</c:otherwise>
													</c:choose>
												</c:when>
												
											</c:choose>
											
										</td>
									</tr>
									
									</c:forEach>
							</tbody>
						</table>

						
					</div>
					

					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="ordercheck_view?o_num=${o_num}&page=1" class="n" title="맨앞으로"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
						<c:choose>
								<c:when test="${pageNum!=1 }">
									<a href="ordercheck_view?o_num=${o_num}&page=${pageNum-1 }" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
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
									<a href="ordercheck_view?o_num=${o_num}&page=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							<c:choose>
								<c:when test="${pageNum!=maxPage }">
									<a href="ordercheck_view?o_num=${o_num}&page=${pageNum+1 }" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
								</c:when>
								<c:otherwise>
									<span class="next" title="뒤페이지가 없습니다."><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></span>
								</c:otherwise>
							</c:choose>
								
								<a href="ordercheck_view?o_num=${o_num}&page=${maxPage}" class="n" title="맨 뒤로"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</div>
						<!-- //페이징이동1 -->
					</div>
					


				</div>
		<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
		<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css">
		<script type="text/javascript">
$(function(){

	// layer popup
	var winWidth = $(window).width();
	if(winWidth > 767){
		var layerCheck = 760;
	}else{
		var layerCheck = 320;
	}

	$(".iw40").fancybox({
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
	$(".popBtn").fancybox({
        'autoDimensions'    : false,
        'showCloseButton'	: false,
        'width' : popCheck,
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
	</div>
	</div>
	<!-- //container -->
<!--footer입니다. -->
<jsp:include page="../common/footer.jsp" />