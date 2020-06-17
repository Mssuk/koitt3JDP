<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<c:if test="${loginInfo==null }">
<script type="text/javascript">
	alert('1:1문의는 로그인 후 이용가능합니다.');
	window.location.href='/membership/login';
</script>
</c:if>
<script type="text/javascript">
 function inquiry_check(){
	 if(inquiry.q_title.value==''){
		 alert('문의글 제목을 입력하세오');
		 inquiry.q_title.focus();
		 return false;
	 }
	 if(inquiry.q_content.value==''){
		 alert('문의글 내용을 입력하세오');
		 inquiry.q_content.focus();
		 return false;
	 }
	 
	 alert('파일 업로드시 시간이 소요됩니다^^');
	 inquiry.submit();
 }
</script>

<c:if test="${inqu_ch!=null }">
	<c:choose>
		<c:when test="${inqu_ch==1 }">
			<script type="text/javascript">
				alert('1:1문의 작성 완료.mypage에서 답변을 확인하세요');
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('1:1문의 작성 실패');
			</script>
		</c:otherwise>
	</c:choose>
</c:if>


    <!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />
	
	

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="notice">CUSTOMER</a></li>
				<li class="last">1:1문의</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<jsp:include page="customer_left_bar.jsp" />
			<script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>1:1문의</strong><span>쟈뎅에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
					
					<form class="checkMt" name="inquiry" method="post" action="inqlist" enctype="multipart/form-data">
						<table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1">
							<caption>1:1문의</caption>
							<colgroup>
							<col width="19%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>분류</span></th>
									<td>
										<select name="q_type">
											<option value="product">상품문의</option>
											<option value="exchange">교환/반품</option>
											<option value="delivery">배송</option>
											<option value="inquiry_other">기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>제목</span></th>
									<td>
										<input type="text" class="wlong" name="q_title" />
									</td>
								</tr>
								<tr>
									<th scope="row"><span>상세 내용</span></th>
									<td>
										<textarea class="tta" name="q_content" placeholder=""></textarea>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>첨부파일</span></th>
									<td>
										<input type="file" class="fileType" name="q_file" />
									</td>
								</tr>
							</tbody>
						</table>
						<!-- Btn Area -->
						<div class="btnArea">
							<div class="bCenter">
								<ul>																
									<li><input type="reset" class="nbtnbig inq_btn" value="취소"></li>
									<li><input type="button" onclick="inquiry_check()" class="sbtnMini inq_btn" value="확인"></li>
								</ul>
							</div>
						</div>
						<!-- //Btn Area -->
					</form>

					
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