<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>

<jsp:include page="../common/header.jsp" />



        <!-- container -->
        <div id="container">

            <div id="location">
                <ol>
                    <li><a href="/main">HOME</a></li>
                    <li class="last">주문/결제</li>
                </ol>
            </div>

            <div id="outbox">

                <!-- maxcontents -->
                <div id="maxcontents">
                    <div id="mypage">
                        <h2><strong>주문/결제</strong></h2>

                        <!-- 주문 상품 -->
                        <h3 class="dep">주문 제품 확인</h3>
                        <div class="orderDivNm">
                            <table summary="주문 제품 확인 게시판으로 상품명, 가격, 수량, 합계순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
                                <caption>주문 제품 확인</caption>
                                <colgroup>
                                    <col width="*" />
                                    <col width="16%" class="tnone" />
                                    <col width="14%" />
                                    <col width="16%" class="tw28"/>
                                </colgroup>
                                <thead>
                                <th scope="col">상품명</th>
                                <th scope="col" class="tnone">가격/포인트</th>
                                <th scope="col">수량</th>
                                <th scope="col">합계</th>
                                </thead>
                                <tbody>
                                <c:forEach var="dtos" items="${confirm.orderlist }">
	                                <tr>
	                                    <td class="left">
	                                        <p class="img"><img src="${dtos.front_image1 }" alt="상품" width="66" height="66" /></p>
	
	                                        <ul class="goods">
	                                            <li>
	                                                <a href="/product/detail?pro_num=${dtos.pro_num }">${dtos.product_name }</a>
	                                            </li>
	                                        </ul>
	                                    </td>
	                                    <td class="tnone">
	                                        <fmt:formatNumber value="${dtos.price/dtos.o_quant }" pattern="#,###" />원
											<c:if test="${confirm.orderInfo.id!=null }">
		                                        <!-- 회원일 시 -->
		                                        <br/><span class="pointscore"><fmt:formatNumber value="${dtos.price/dtos.o_quant/100 }" pattern="#,###" /> Point</span>
		                                        <!-- //회원일 시 -->
											</c:if>
	                                    </td>
	                                    <td>${dtos.o_quant } 개</td>
	                                    <td><fmt:formatNumber value="${dtos.price }" pattern="#,###" /> 원</td>
	                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="poroductTotal">
                            <ul>
                                <li>상품 합계금액 <strong><fmt:formatNumber value="${confirm.orderInfo.o_cost }" pattern="#,###" /></strong> 원</li>
                                <li>+ 배송비 <strong><fmt:formatNumber value="${confirm.deliver }" pattern="#,###" /></strong> 원</li>
                                <li>= 총 합계 <strong><fmt:formatNumber value="${confirm.orderInfo.o_cost+confirm.deliver }" pattern="#,###" /></strong> 원</li>
                            </ul>
                        </div>
                        <!-- //주문 상품 -->


                        <!-- 총 주문금액 -->
                        <div class="amount">
							<c:if test="${confirm.orderInfo.id!=null }">
                            <!-- 회원 일때 -->
                            <h4 class="member">총 주문금액</h4>
                            <!-- 회원 일때 -->
							</c:if>
                            <c:if test="${confirm.orderInfo.id==null }">
                             <h4>총 주문금액</h4>
                            </c:if>
                            <ul class="info">
                                <li>
                                    <span class="title">상품 합계금액</span>
                                    <span class="won"><strong><fmt:formatNumber value="${confirm.orderInfo.o_cost }" pattern="#,###" /></strong> 원</span>
                                </li>
                                <li>
                                    <span class="title">배송비</span>
                                    <span class="won"><strong><fmt:formatNumber value="${confirm.deliver }" pattern="#,###" /></strong> 원</span>
                                </li>
								<c:if test="${confirm.orderInfo.id!=null }">
                                <!-- 회원 일때만 -->
                                <li>
                                    <span class="title">포인트 할인</span>
                                    <span class="won"><strong>- <fmt:formatNumber value="${confirm.orderInfo.o_point }" pattern="#,###" /></strong> P</span>
                                </li>
                                <li>
                                    <span class="title">쿠폰 할인</span>
                                    <c:choose>
                                    	<c:when test="${confirm.coupon==null }">
                                    		<span class="won"><strong>- 0</strong> 원</span>
                                    	</c:when>
                                    	<c:otherwise>
		                                    <span class="won"><strong>- <fmt:formatNumber value="${confirm.coupon.coupon_pay }" pattern="#,###" /></strong> 원</span>
                                    	</c:otherwise>
                                    </c:choose>
                                </li>
                                <!-- //회원 일떄만 -->
                                </c:if>
                            </ul>

                            <ul class="total">
                            	<c:if test="${confirm.orderInfo.id!=null }">
                                <!-- 회원 일때만 -->
                                <li class="mileage">(적립 포인트 <strong><fmt:formatNumber value="${confirm.orderInfo.o_cost/100 }" pattern="#,###" /></strong> Point) </li>
                                <!-- //회원 일때만 -->
								</c:if>
                                <li class="txt"><strong>결제 예정 금액</strong></li>
                                <li class="money"><span><fmt:formatNumber value="${confirm.payment.o_sum }" pattern="#,###" /></span> 원</li>
                            </ul>
                        </div>
                        <!-- //총 주문금액 -->


                        <!-- 주문자 정보확인 -->
                        <h3 class="dep">주문자 정보</h3>
                        <div class="checkDiv">
                            <table summary="주문자 정보를 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                                <caption>주문자 정보확인</caption>
                                <colgroup>
                                    <col width="17%" class="tw20" />
                                    <col width="*" />
                                    <col width="17%" class="tw20" />
                                    <col width="*" class="tw25" />
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span>이름</span></th>
                                    <td>${confirm.orderInfo.o_name }</td>
                                    <th scope="row"><span>휴대폰 <u>번호</u></span></th>
                                    <td>${confirm.orderInfo.o_tel }</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- //주문자 정보확인 -->


                        <!-- 수취자 정보확인 -->
                        <h3 class="dep">수취자 정보</h3>
                        <div class="checkDiv">
                            <table summary="수취자 정보를 이름, 주소, 이메일, 휴대폰 번호, 전화번호, 배송시 요구사항 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                                <caption>수취자 정보확인</caption>
                                <colgroup>
                                    <col width="17%" class="tw20" />
                                    <col width="*" />
                                    <col width="17%" class="tw20" />
                                    <col width="*" class="tw25" />
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span>이름</span></th>
                                    <td colspan="3">${confirm.payee.p_name }</td>
                                </tr>

                                <tr>
                                    <th scope="row" rowspan="2"><span>주소</span></th>
                                    <td rowspan="2">${confirm.payee.p_address }</td>
                                    <th scope="row"><span>휴대폰 <u>번호</u></span></th>
                                    <td>${confirm.payee.p_phone }</td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>전화<u>번호</u></span></th>
                                    <td>${confirm.payee.p_tel }</td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>배송시 <u>요구사항</u></span></th>
                                    <td colspan="3">${confirm.payee.p_demand }</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- //주문자 정보확인 -->


                        <!-- 결제금액 확인 -->
                        <h3 class="dep">결제금액</h3>
                        <div class="checkDiv">
                            <table summary="결제되는 금액를 총 주문금액, 쿠폰할인, 배송비, 포인트사용, 총 결제금액 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                                <caption>결제금액확인</caption>
                                <colgroup>
                                    <col width="17%" class="tw20" />
                                    <col width="*" />
                                    <col width="17%" class="tw20" />
                                    <col width="*" class="tw25" />
                                </colgroup>
                                <tbody>
	                                <tr>
	                                    <th scope="row"><span>총 주문<u>금액</u></span></th>
	                                    <td><fmt:formatNumber value="${confirm.orderInfo.o_cost }" pattern="#,###" />원</td>
	                                    <th scope="row"><span>배송비</span></th>
	                                    <td><fmt:formatNumber value="${confirm.deliver }" pattern="#,###" /> 원 (선불)</td>
	                                </tr>
									<c:if test="${confirm.orderInfo.id!=null }">
	                                <tr>
	                                    <th scope="row"><span>쿠폰 <u>할인</u></span></th>
	                                    <c:choose>
                                    	<c:when test="${confirm.coupon==null }">
                                    		<td>0원</td>
                                    	</c:when>
                                    	<c:otherwise>
		                                    <td><fmt:formatNumber value="${confirm.coupon.coupon_pay }" pattern="#,###" /> 원</td>
                                    	</c:otherwise>
                                    </c:choose>
	                                    <th scope="row"><span>포인트 <u>사용</u></span></th>
	                                    <td><fmt:formatNumber value="${confirm.orderInfo.o_point }" pattern="#,###" /> Point</td>
	                                </tr>
	                                </c:if>
	                                <tr>
	                                    <th scope="row"><span>총 결제<u>금액</u></span></th>
	                                    <td colspan="3"><strong><fmt:formatNumber value="${confirm.payment.o_sum }" pattern="#,###" /> 원</strong></td>
	                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- //결제금액 확인 -->


                        <!-- 주문 정보 확인 -->
                        <h3 class="dep">주문 정보</h3>
                        <div class="checkDiv">
                            <table summary="주문정보를 주문번호, 결제수단, 주문일, 입금은행, 요구사항, 입금자 명 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                                <caption>주문 정보</caption>
                                <colgroup>
                                    <col width="17%" class="tw20" />
                                    <col width="*" />
                                    <col width="17%" class="tw20" />
                                    <col width="*" class="tw25" />
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span>주문번호</span></th>
                                    <td>${confirm.payment.o_num}</td>
                                    <th scope="row"><span>결제수단</span></th>
                                    <td>${confirm.payment.o_way}</td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>주문일</span></th>
                                    <td><fmt:formatDate value="${confirm.orderInfo.o_date }" pattern="yyyy-MM-dd"/></td>
                                    <th scope="row"><span>요구사항</span></th>
                                    <td>${confirm.payee.p_demand }</td>
                                </tr>
                                 <tr>
                                    <th scope="row"><span>주문상태</span></th>
                                    <td colspan="3">${confirm.orderInfo.o_status }</td>
                                </tr>
								<c:if test="${confirm.payment.o_way=='무통장입금' }">
	                                <tr>
	                                    <th scope="row"><span>입금은행</span></th>
	                                    <td>신한은행 1234-45-786135 (주)쟈뎅</td>
	                                    <th scope="row"><span>입금자 <u>명</u></span></th>
	                                    <td>${confirm.payment.bank_name}</td>
	                                </tr>
								</c:if>
								<c:if test="${fn:contains(confirm.payment.o_way,'가상계좌') }">
									<tr>
	                                    <th scope="row"><span>입금은행</span></th>
	                                    <td colspan="3">신한은행 1234-45-786135 (주)쟈뎅</td>
	                                </tr>    
								</c:if>
                                </tbody>
                            </table>
                        </div>
                        <!-- //주문 정보 확인 -->


                        <!-- Btn Area -->
                        <div class="btnArea">
							<div class="orderCenter">
								<ul>
									<li><a href="/main" class="nbtnbig iw0140">확인</a></li>
									<li><a href="/product/list"  class="sbtnMini iw0140">쇼핑 계속하기</a></li>								
								</ul>
							</div>
						</div>
                        <!-- //Btn Area -->


                    </div>
                </div>
                <!-- //maxcontents -->


            </div>
        </div>
        <!-- //container -->

<jsp:include page="../common/footer.jsp" />