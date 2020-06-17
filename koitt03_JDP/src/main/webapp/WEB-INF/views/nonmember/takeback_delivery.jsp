<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- header입니다. -->
<!DOCTYPE html>
<html>
<head>
    <title> JARDIN SHOP </title>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="JARDIN SHOP"/>
    <meta name="keywords" content="JARDIN SHOP"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css?v=Y"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/content.css?v=Y"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/top_navi.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/left_navi.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/idangerous.swiper-2.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.anchor.js"></script>
</head>
<body>
	<div id="container">
		
		<div id="outbox">		

			<!-- contents -->
			<div id="contents">
				<form id="mypage" name="claim" action="" method="post">
					<h3 class="dep">반품/교환 사유</h3>
					<div class="checkDiv">
						<table summary="분류, 자세한 이유 순으로 반품/교환 사유를 작성 하실수 있습니다." class="checkTable" border="1">
							<caption>반품/교환 사유</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>분류</span></th>
									<td>
										<select>
											<option value="">선택해주세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>자세한 이유</span></th>
									<td>
										<textarea class="tta"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>								
								<li><a href="#" class="sbtnMini">반품/교환신청</a></li>
								<li><a href="#" class="nbtnbig">취소</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
				

				</form>
			</div>
			<!-- //contents -->


		</div>

	</div>
	<!-- //container -->
</body>
</html>	
	