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
<c:if test="${claimList==null||claimList.size()==0 }">
	<script type="text/javascript">
		alert('교환/반품내역이 없습니다.');
		window.location.href='/nonmember/ordercheck_view?o_num='+${o_num };
	</script>
</c:if>
<c:if test="${doChange!=null }">

	<c:choose>
		<c:when test="${doChange==1 }">
		<script type="text/javascript">
			alert('신청이 완료되었습니다.');
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
			alert('신청 실패. \n 잠시후 다시 시도해주세요');
			window.location.href='/nonmember/ordercheck_view?o_num='+${o_num };
			</script>
		</c:otherwise>
	</c:choose>
	
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
	
	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="/main">HOME</a></li>
				<li><a href="/nonmember/ordercheck_view?o_num=${o_num }">비회원 주문조회</a></li>
				<li class="last">반품/교환 현황</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title">비회원<br/>주문조회</div>
				<ul>	
					<li><a href="/nonmember/ordercheck_view?o_num=${o_num }" id="leftNavi1">비회원 주문조회</a></li>
					<li class="last"><a href="takeback_state?o_num=${o_num}" id="leftNavi2">반품/교환 현황</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>반품/교환 현황</strong><span>비회원 구매하신 주문내역을 확인하실 수 있습니다.</span></h2>
					
			
					<h3 class="dep" style="line-height: 0px">반품/교환 상품정보</h3>
					<div class="orderDivNm">
						<table summary="주문일자/주문번호, 분류, 상품명, 가격, 상태, 사유 순으로 반품/교환 현황을 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>반품/교환 현황 사유보기</caption>
							<colgroup>
							<col width="25%" class="tw30" />
							<col width="7%" class="tnone" />
							<col width="*" />
							<col width="13%" class="tnone" />
							<col width="10%" class="tw18"/>
							<col width="15%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col">주문일자 <span>/ 주문번호</span></th>
								<th scope="col" class="tnone">분류</th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">상태</th>
								<th scope="col" class="tnone">사유</th>
							</thead>
							<tbody>
								<c:if test="${claimList!=null }">
								<c:forEach var="dtos" items="${claimList }">
									<tr>
										<td>
											<p class="day"><fmt:formatDate value="${dtos.o_date }" pattern="yyyy-MM-dd"/></p>
											<p class="orderNum">${dtos.o_num }</p>
										</td>
										<td class="tnone"><span class="heavygray">${dtos.c_type }</span></td>
										<td class="left">
											${dtos.product_name }
										</td>
										<td class="tnone"><span><fmt:formatNumber value="${dtos.price }" pattern="#,###" /></span> 원</td>
										<td>
										<span class="orange">${dtos.c_type }${dtos.c_state }</span>
										<c:if test="${dtos.c_state=='신청' }">
										<ul class="state" style="text-align: center; width:50px;">
										<li><a href="javascript:;" onclick="retu_cancel('${dtos.key}')" class="nbtnMini" style="width:50px;">취소</a></li>
										</ul>
										</c:if>
										</td>
										<td class="tnone">
											<a href="reason?num1=${dtos.key }" class="nbtnbig iwc80">사유보기</a>
										</td>
									</tr>
								</c:forEach>
								</c:if>
							</tbody>
						</table>
								<c:if test="${claimList.size()<5 }">
									<div class="noData web">
										이하 여백
									</div>
									<c:forEach begin="0" step="1" end="${3-claimList.size() }">
										<div class="noData web">
											 
										</div>
									</c:forEach>
								</c:if>
					</div>
					

					
					<div class="btnAreaList">
						<!-- 페이징이동1 -->
						<div class="allPageMoving1">

						<a href="takeback_state?o_num=${o_num}&page=1" class="n" title="맨앞으로"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
						<c:choose>
								<c:when test="${pageNum!=1 }">
									<a href="takeback_state?o_num=${o_num}&page=${pageNum-1 }" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
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
									<a href="takeback_state?o_num=${o_num}&page=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							<c:choose>
								<c:when test="${pageNum!=maxPage }">
									<a href="takeback_state?o_num=${o_num}&page=${pageNum+1 }" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
								</c:when>
								<c:otherwise>
									<span class="next" title="뒤페이지가 없습니다."><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></span>
								</c:otherwise>
							</c:choose>
								
								<a href="takeback_state?o_num=${o_num}&page=${maxPage}" class="n" title="맨 뒤로"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</div>
						<!-- //페이징이동1 -->
					</div>
					


				</div>
<script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
<script type="text/javascript">
$(function(){

	$(".iwc80").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : 486,
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
			<!-- //contents -->


		</div>
	<!-- //container -->
<!--footer입니다. -->
<jsp:include page="../common/footer.jsp" />