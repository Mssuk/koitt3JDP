<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <title> JARDIN SHOP </title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="JARDIN" />
    <meta name="keywords" content="JARDIN" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../css/content.css" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script type="text/javascript">
	   
       function retch(){
	    	if(change.c_type.value==''){
	    		alert('교환 혹은 반품 중 선택해주세요');
	    		return false;
	    	}if(change.c_reason.value==''){
	    		alert('상세이유를 작성해주세요');
	    		return false;
	    	}
	    	document.change.target = "_parent";
	    	document.change.submit();
	    	self.close();
       }
    </script>
    <style type="text/css">
        .ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
        .ui-widget-content{border:0;}
        .ui-spinner-input{width:50px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
    </style>
</head>
<body>
<form id="layerWrap" name="change" method="post" action="/doReturn">

    <div class="inputWrap">

        <div class="inputBody">
            <div class="title">반품/교환 상품정보</div>
            <p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;" style="display: inline-block;"><img src="../images/btn/btn_input_close.gif" alt="닫기" /></a></p>

            <div class="orderDivNm">
                <table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
                    <caption>상품 게시판</caption>
                    <colgroup>
                        <col width="18%" class="pnone" />
                        <col width="*" />
                        <col width="8%" class="tw25" />
                        <col width="14%" class="pnone" />
                        <col width="10%" class="pnone" />
                    </colgroup>
                    <thead>
                    <th scope="col" class="pnone">주문일자/주문번호</th>
                    <th scope="col">상품명</th>
                    <th scope="col">수량</th>
                    <th scope="col" class="pnone">가격</th>
                    <th scope="col" class="pnone">주문상태</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="pnone">
                            <p class="day"><fmt:formatDate value="${odto.o_date }" pattern="yyyy-MM-dd"/></p>
                            <p class="orderNum">${odto.o_num }</p>
                        </td>
                        <td class="left">
                            <p class="img"><img src="${photo }" alt="상품" width="66" height="66" /></p>

                            <ul class="goods">
                                <li>
                                    <span>${odto.product_name }</span>
                                </li>
                            </ul>
                        </td>
                        <td><span><fmt:formatNumber value="${odto.o_quant }" pattern="#,###" /></span>개</td>
                        <td class="pnone"><span><fmt:formatNumber value="${odto.price }" pattern="#,###" /></span> 원</td>
                        <td class="pnone">${odto.o_status }</td>
                    </tr>
                    </tbody>
                </table>
            </div>
			<div id="mypage">
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
										<select name="c_type">
											<option disabled="disabled" selected="selected" hidden="" value="">선택해주세요</option>
											<option value="교환">교환</option>
											<option value="반품">반품</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>자세한 이유</span></th>
									<td>
										<textarea class="tta" name="c_reason"></textarea>
										<input type="text" hidden="" name="key" value="${odto.key }"> 
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>								
								<li><a href="javascript:;" onclick="retch()" class="sbtnMini">반품/교환신청</a></li>
								<li><a onclick="parent.$.fancybox.close();" href="javascript:;" class="nbtnbig">취소</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
				

				</div>
			
        </div>

    </div>
				
</form>
</body>
</html>