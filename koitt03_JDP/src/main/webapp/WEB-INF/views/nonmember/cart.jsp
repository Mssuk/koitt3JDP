<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!-- header입니다. -->
	<jsp:include page="../common/header.jsp" />
	
<c:if test="${list==null }">
	<script type="text/javascript">
		alert('장바구니에 담긴 상품이 없습니다.');
		window.location.href='/main';
	</script>
</c:if>	
	

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li class="last">장바구니</li>
			</ol>
		</div>
		
		<div id="outbox">		
			
			<!-- maxcontents -->
			<div id="maxcontents">
				<div id="mypage">
					<h2><strong>장바구니</strong></h2>
					
				<!-- 장바구니에 상품이 있을경우 -->
					<!-- 장바구니 상품 -->
					<h3 class="dep">장바구니에 담긴 상품</h3>
					<div class="orderDivNm">
						<table summary="장바구니에 담긴 상품들을 전체선택, 상품명, 가격, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>장바구니 상품목록</caption>
							<colgroup>
							<col width="7%"/>
							<col width="*" />
							<col width="14%" class="tnone" />
							<col width="10%" class="tw14"/>
							<col width="14%" class="tw28"/>
							<col width="14%" class="tnone" />
							</colgroup>
							<thead>
								<th scope="col"><input type="checkbox" id="check_all"/></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
								<th scope="col" class="tnone">주문</th>
							</thead>
							<tbody>
								<c:forEach var="dtos" items="${list }">
										<tr>
											<td><input type="checkbox" value="${dtos.pdto.pro_num }" name="pro_num" class="order_pro"/></td>
											<td class="left">
												<p class="img"><img src="${dtos.pdto.front_image1 }" alt="상품" width="66" height="66" /></p>
		
												<ul class="goods">
													<li>
														<a href="/product/detail?pro_num=${dtos.pdto.pro_num }">${dtos.pdto.product_name }</a>
													</li>
												</ul>
											</td>
											<td class="tnone sale_price"><span><fmt:formatNumber value="${dtos.pdto.sales_price }" pattern="#,###" /></span> 원</td>
											<td><input class="spinner" value="${dtos.bmdto.count }" maxlength="3" name="count" onblur="changeSelect(this)"/></td>
											<td class="cart_price"><span><fmt:formatNumber value="${dtos.pdto.sales_price*dtos.bmdto.count }" pattern="#,###" /></span> 원</td>
											<td class="tnone">
												<ul class="order">	
													<li><a href="#" class="obtnMini iw70 buy">바로구매</a></li>
													<li><a href="#" onclick="del_one('${dtos.pdto.pro_num }')" class="nbtnMini iw70">상품삭제</a></li>
												</ul>
											</td>
										</tr>
								</c:forEach>
								
								</tbody>
						</table>
					</div>

					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li id="check_all2"><span class="selectbtn" style="cursor: pointer;">전체선택</span></li>
								<li id="modis"><a href="#" class="selectbtn2">선택수정</a></li>
								<li id="delis"><a href="#" class="selectbtn2">선택삭제</a></li>
							</ul>
						</div>
					</div>
					<!-- //장바구니 상품 -->
					

					<!-- 총 주문금액 -->
					<div class="amount">
						<h4>총 주문금액</h4>
						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won whole_total"><strong></strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won whole_deliver"><strong></strong> 원</span>
							</li>
							<li style="color:#fe6124;border-bottom: none;">
								<span class="won del_text"><strong style="color:#fe6124;"></strong></span>
							</li>
						</ul>
						<ul class="total">
							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money result_total"><span></span> 원</li>
						</ul>
					</div>
					<!-- //총 주문금액 -->

					<div class="cartarea">
						<ul>
							<li><a href="#" class="buys ty1">선택상품 <span>주문하기</span></a></li>
							<li><a href="#" class="buy_all ty2">전체상품 <span>주문하기</span></a></li>
							<li class="last"><a href="/product/list" class="ty3">쇼핑 <span>계속하기</span></a></li>
						</ul>
					</div>


<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
.ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
.ui-widget-content{border:0;}
.ui-spinner-input{width:44px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
</style>

<script type="text/javascript">
$(function() {
	var spinner = $( ".spinner" ).spinner({ min: 1, max: 999 });
	//처음합계
	var first=get_total();
	 $( ".whole_total strong" ).text(first);
	//처음배송료
	var f_deliver=get_deliver(first);
	$( ".whole_deliver strong" ).text(f_deliver);
	//처음 총가격
	var f_total=get_re_total(first,f_deliver);
	$( ".result_total span" ).text(f_total);
	//전체체크
	 $("#check_all").click(function(){
	       var chk = $(this).is(":checked");//.attr('checked');
	       if(chk) $(".order_pro").prop('checked', true);
	       else  $(".order_pro").prop('checked', false);
	});
	//전체체크2
	 $("#check_all2").click(function(){
	       var chk = $("#check_all").is(":checked");//.attr('checked');
	       if(chk) {
	    	   $("#check_all").prop('checked', false);
	    	   $(".order_pro").prop('checked', false);
	       }
	       else { 
	    	   $("#check_all").prop('checked', true);
	    	   $(".order_pro").prop('checked', true);
	    	}
	});
});

</script>
<script type="text/javascript">
	//spin개수 변경시 우측합계 변경.
	function changeSelect(a){
		var k=$(".spinner").index(a);
		var ch=$(".spinner").eq(k).val();
		ch=Number(ch);
		var sal=$(".sale_price span").eq(k).text();
		sal=sal.replace(/[^0-9]/g,'');
		sal=Number(sal);
		var total=ch*sal;
		total=total.toLocaleString();
		$(".cart_price span").eq(k).text(total);
		//변동합계
		var last=get_total();
		$( ".whole_total strong" ).text(last);
		//변동배송비
		var last_del=get_deliver(last);
		$( ".whole_deliver strong" ).text(last_del);
		//변동 최종 금액
		var last_total=get_re_total(last,last_del);
		$( ".result_total span" ).text(last_total);
		}
	//전체 상품 금액합계
	 function get_total() {
			var cnt=$(".cart_price").length;
			var sum=0;
			for(var i=0;i<cnt;i++){
			var cart=$(".cart_price").eq(i).text();
			cart=cart.replace(/[^0-9]/g,'');
			cart=Number(cart);
			sum+=cart;
			}
			sum=sum.toLocaleString();
			return sum;
	 }
	//배송비
	function get_deliver(x){
		var del=2500;
		x=x.replace(/[^0-9]/g,'');
		x=Number(x);
		if(x>=15000){
			del=0;
		}
		if(del==0){
			$( ".del_text strong" ).text("*15,000원 이상 구매시 배송비 무료");
		}else{
			$( ".del_text strong" ).text("");
		}
		
		del=del.toLocaleString();
		return del;
	}
	//최종합계
	function get_re_total(a,b){
		a=a.replace(/[^0-9]/g,'');
		a=Number(a);
		b=b.replace(/[^0-9]/g,'');
		b=Number(b);
		var result=a+b;
		result=result.toLocaleString();
		return result;
	}
</script>

<script type="text/javascript">
//삭제 1개
function del_one(a){ // 매개변수를 받는다.
	if(confirm("선택한 제품을 장바구니에서 삭제하시겠습니까?")){
	       
	$.ajax({
        url : "/delCartOne",   // 받을 url
        type : "POST",   
        data: JSON.stringify({pro_num:a}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
        contentType: "application/json",
        success : function (data) {
           if(data== 1){ //리턴값이 ok일 경우
        	  location.reload(); //새로고침 해준다.
              alert('삭제 완료');
           }else if(data == 0){
				alert('삭제 실패');
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
//선택수정
$("#modis").click(function(){ // 매개변수를 받는다.
	if(confirm("개수를 수정하시겠습니까?")){
	var mcnt=$(".order_pro").length;
	var numlist='';
	var countlist='';
	for(var j=0;j<mcnt;j++){
		if($(".order_pro").eq(j).is(":checked")){
			var list=$(".order_pro").eq(j).val();
			var ch=$(".spinner").eq(j).val();
			numlist+=list+"_";
			countlist+=ch+"_";
		}
	}
	if(numlist==''){
		alert('체크된 상품이 없습니다');
		return false;
	}
	
	$.ajax({
        url : "/modiCart",   // 받을 url
        type : "POST",   
        data: JSON.stringify({pro_num:numlist,count:countlist}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
        contentType: "application/json",
        success : function (data) {
           if(data== 1){ //리턴값이 ok일 경우
        	  location.reload(); //새로고침 해준다.
              alert('수정 완료');
           }else if(data == 0){
				alert('수정 실패');
			}
        },
        error : function(){ //오류일경우 경고창을 띄움
           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: modifyError)");
        }
     });
	
	
	}
});	
</script>
<script type="text/javascript">
//선택삭제
$("#delis").click(function(){ // 매개변수를 받는다.
	
	if(confirm("선택한 상품을 삭제하시겠습니까?")){
	var dcnt=$(".order_pro").length;
	var numlist='';
	for(var j=0;j<dcnt;j++){
		if($(".order_pro").eq(j).is(":checked")){
			var list=$(".order_pro").eq(j).val();
			numlist+=list+"_";
		}
	}
	if(numlist==''){
		alert('체크된 상품이 없습니다');
		return false;
	}
	$.ajax({
        url : "/delCart",   // 받을 url
        type : "POST",   
        data: JSON.stringify({pro_num:numlist}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
        contentType: "application/json",
        success : function (data) {
           if(data== 1){ //리턴값이 ok일 경우
        	  location.reload(); //새로고침 해준다.
              alert('삭제 완료');
           }else if(data == 0){
				alert('삭제 실패');
			}
        },
        error : function(){ //오류일경우 경고창을 띄움
           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: deleteError)");
        }
     });
	
	
	}
});	
</script>

<script type="text/javascript">
//구매 1개
$(".buy").click(function(){ // 매개변수를 받는다.
	
	var k=$(".buy").index(this);
	var ch=$(".spinner").eq(k).val();
	var list=$(".order_pro").eq(k).val();
	
	$.ajax({
        url : "/addOrderCart",   // 받을 url
        type : "POST",   
        data: JSON.stringify({pro_num:list,count:ch}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
        contentType: "application/json",
        success : function (data) {
           if(data== 1){ //리턴값이 ok일 경우
        	  location.href='/cartpayment'; //새로고침 해준다.
           }else if(data == 0){
				alert('주문이동 실패');
			}
        },
        error : function(){ //오류일경우 경고창을 띄움
           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: buysError)");
        }
     });
	
});	
</script>
<script type="text/javascript">
//선택구매
$(".buys").click(function(){ // 매개변수를 받는다.
	
	
	var mcnt=$(".order_pro").length;
	var numlist='';
	var countlist='';
	for(var j=0;j<mcnt;j++){
		if($(".order_pro").eq(j).is(":checked")){
			var list=$(".order_pro").eq(j).val();
			var ch=$(".spinner").eq(j).val();
			numlist+=list+"_";
			countlist+=ch+"_";
		}
	}
	if(numlist==''){
		alert('체크된 상품이 없습니다');
		return false;
	}
	
	$.ajax({
        url : "/addOrderCart",   // 받을 url
        type : "POST",   
        data: JSON.stringify({pro_num:numlist,count:countlist}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
        contentType: "application/json",
        success : function (data) {
           if(data== 1){ //리턴값이 ok일 경우
        	  location.href='/cartpayment'; 
           }else if(data == 0){
				alert('주문이동 실패');
			}
        },
        error : function(){ //오류일경우 경고창을 띄움
           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: buysError)");
        }
     });
	
});	
</script>
<script type="text/javascript">
//전체구매
$(".buy_all").click(function(){ // 매개변수를 받는다.
	
	var mcnt=$(".order_pro").length;
	var numlist='';
	var countlist='';
	for(var j=0;j<mcnt;j++){
		var list=$(".order_pro").eq(j).val();
		var ch=$(".spinner").eq(j).val();
		numlist+=list+"_";
		countlist+=ch+"_";
	}
	
	$.ajax({
        url : "/addOrderCart",   // 받을 url
        type : "POST",   
        data: JSON.stringify({pro_num:numlist,count:countlist}),  // 넘길값을 지정해 준다(예시는 두개의 값을 남길경우)
        contentType: "application/json",
        success : function (data) {
           if(data== 1){ //리턴값이 ok일 경우
        	  location.href='/cartpayment'; //새로고침 해준다.
           }else if(data == 0){
				alert('주문이동 실패');
			}
        },
        error : function(){ //오류일경우 경고창을 띄움
           alert("통신 중 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.\n오류가 반복될 경우, 고객센터로 문의 부탁드립니다.\n(error_code: buysError)");
        }
     });
	
});	
</script>



				</div>
			</div>
			<!-- //maxcontents -->


		</div>
	<!-- quickmenu -->
		<jsp:include page="../common/quickmenu.jsp" />
		<!-- //quickmenu -->

	</div>
	<!-- //container -->
<!--footer입니다. -->
<jsp:include page="../common/footer.jsp" />
