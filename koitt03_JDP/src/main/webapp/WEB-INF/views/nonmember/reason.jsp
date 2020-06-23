<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title> JARDIN SHOP </title>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="JARDIN"/>
    <meta name="keywords" content="JARDIN"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no"/>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../css/content.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
       function modiClaim(){
	    	if(reasonM.c_reason.value==''){
	    		alert('상세이유를 작성해주세요');
	    		return false;
	    	}
	    	document.reasonM.target = "_parent";
	    	document.reasonM.submit();
	    	self.close();
       }
</script>
<div id="layerWrap">
    <form class="inputWrap" name="reasonM" method="post" action="/nonmember/updateChange">

        <div class="inputBody">
            <div class="title">사유 보기
            
            <span style="font-size: 12px;color:#f7703c;">*변경 후 수정버튼 클릭시 수정가능합니다.</span>
            
            </div>
            <p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;" style="display: inline-block;"><img
                    src="../images/btn/btn_input_close.gif" alt="닫기"/></a></p>

			<c:choose>
				<c:when test="${type=='신청'}">
					<input type="text" name="key" value="${key }" hidden="">
					<input type="text" name="o_num" value="${o_num }" hidden="">
					<textarea class="reasontta" name="c_reason">${reason }</textarea>
		            <div class="btnArea">
						<div class="bCenter">
							<ul>								
								<li><a href="javascript:;" onclick="modiClaim()" class="sbtnMini">수정</a></li>
								<li><a onclick="parent.$.fancybox.close();" href="javascript:;" class="nbtnbig">확인</a></li>
							</ul>
						</div>
					</div>
				</c:when>
				<c:otherwise>
	            <textarea class="reasontta" disabled="disabled" >${reason }</textarea>
				<div class="centerbrn pd10">
	                <a onclick="parent.$.fancybox.close();" href="javascript:;">확인</a>
	            </div>
				</c:otherwise>
			</c:choose>
        </div>

    </form>


</div>
</body>
</html>