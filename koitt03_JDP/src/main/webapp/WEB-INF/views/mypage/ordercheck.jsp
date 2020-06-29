<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("loginInfo") == null){
        response.sendRedirect("/membership/login");
    }
%>
<jsp:include page="../common/header.jsp"/>

<!-- container -->
<div id="container">

    <div id="location">
        <ol>
            <li><a href="/">HOME</a></li>
            <li><a href="mypage">MY PAGE</a></li>
            <li class="last">주문/배송 조회</li>
        </ol>
    </div>

    <div id="outbox">
        <div id="left">
            <div id="title">MY PAGE<span>마이페이지</span></div>
            <ul>
                <li><a id="leftNavi1">주문/배송 조회</a></li>
                <li><a href="takeback_delivery" id="leftNavi2">반품/배송 현황</a></li>
                <li><a href="cart" id="leftNavi3">장바구니</a></li>
                <li><a href="wishlist" id="leftNavi4">위시리스트</a></li>
                <li><a href="coupon" id="leftNavi5">나의 쿠폰</a></li>
                <li><a href="point" id="leftNavi6">나의 포인트</a></li>
                <li><a href="inquiry" id="leftNavi7">1:1문의</a></li>
                <li><a href="change_info" id="leftNavi8">회원정보 수정</a></li>
                <li class="last"><a href="get_leave" id="leftNavi9">회원 탈퇴</a></li>
            </ul>
        </div>
        <script type="text/javascript">initSubmenu(1, 0);</script>


        <!-- contents -->
        <div id="contents">
            <div id="mypage">
                <h2><strong>주문/배송 조회</strong><span>회원님이 구매하신 주문내역 및 배송정보를 확인하실 수 있습니다.</span></h2>

                <div class="myInfo">
                    <ul>
                        <li class="info"><strong>${loginInfo.name}</strong> 님의 정보를 한눈에 확인하세요.</li>
                        <li>보유 쿠폰<br/><span class="num">${userCoupon}</span> <span class="unit">장</span></li>
                        <li class="point" id="point">내 포인트<br/><span class="num">
                            <fmt:formatNumber value="${userPoint}" pattern="#,###,###"/></span> <span class="unit">P</span></li>
                        <li class="last">진행중인 주문<br/><span class="num">${orderCount}</span> <span class="unit">건</span></li>
                    </ul>
                </div>

                <h3>주문/배송 조회</h3>
                <div class="checkDiv">
                    <table summary="기간별, 상태별, 단어검색별로 주문/배송 조회를 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                        <caption>주문/배송 조회</caption>
                        <colgroup>
                            <col width="22%" class="tw30"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><span>기간별 검색</span></th>
                            <td>
                                <ul class="pta">
                                    <li><input type="text" class="w84"/></li>
                                    <li><span class="mvalign">&nbsp;~&nbsp;</span></li>
                                    <li class="r10"><input type="text" class="w84"/></li>
                                    <li class="rcl4"><button type="button" class="daybtn">오늘</button></li>
                                    <li class="rc4"><button type="button" class="daybtn">1주일</button></li>
                                    <li class="rc4"><button type="button" class="daybtn">1개월</button></li>
                                    <li class="rc4"><button type="button" class="daybtn">6개월</button></li>
                                    <li class="rc4"><button type="button" class="daybtn">1년</button></li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>상태별 검색</span></th>
                            <td>
                                <select>
                                    <option >선택해주세요.</option>
                                    <option value="입금대기중">입금대기중</option>
                                    <option value="입금완료">입금완료</option>
                                    <option value="배송준비중">배송준비중</option>
                                    <option value="배송중">배송중</option>
                                    <option value="배송완료">배송완료</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>단어 검색</span></th>
                            <td>
                                <ul class="pta">
                                    <li class="or10"><input type="text" class="w186"/></li>
                                    <li><button type="button" class="nbtnMini iw56">검색</button></li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>


                <div class="orderDiv">
                    <table summary="주문일자/주문번호, 상품명, 가격, 수량, 주문상태 순으로 조회를 하실수 있습니다." class="orderTable" border="1"
                           cellspacing="0">
                        <caption>주문게시판</caption>
                        <colgroup>
                            <col width="25%" class="tw28"/>
                            <col width="*"/>
                            <col width="15%" class="tnone"/>
                            <col width="8%" class="tnone"/>
                            <col width="18%" class="tw30"/>
                        </colgroup>
                        <thead>
                        <th scope="col">주문일자 <span>/ 주문번호</span></th>
                        <th scope="col">상품명</th>
                        <th scope="col" class="tnone">가격</th>
                        <th scope="col" class="tnone">수량</th>
                        <th scope="col">주문상태</th>
                        </thead>
                        <%-- 상품 구매 목록 --%>
                        <tbody>

                            <%--<c:choose>
                            <c:when test="${orderList != null}">--%>
                              <c:forEach var="order" items="${orderList}">
                              	<c:forEach var="ordersub" items="${order}">
                                <tr>
                                    <td>
                                 		<p class="day"><fmt:formatDate value="${ordersub.o_date}" pattern="yyyy-MM-dd"/></p>
                                    	<p class="orderNum">${ordersub.o_num}</p>
                                    </td>
                                    <td class="left">
                                        ${ordersub.product_name}
                                    </td>
                                    <td class="tnone">
                                    	<fmt:formatNumber value="${ordersub.price}" pattern="#,###,###"/>원 </td>
                                    <td class="tnone">${ordersub.o_quant}개</td>
                                    <td>
                                        <span class="heavygray">${ordersub.o_status}</span>
                                        <c:choose>
											<c:when test="${ordersub.o_status=='취소신청' }">
												<ul class="state">
													<li><a href="javascript:;" onclick="retu_cancel2('${ordersub.o_num}')" class="nbtnMini">취소</a></li>
												</ul>
											</c:when>
											<c:when test="${ordersub.o_status=='배송완료'||ordersub.o_status=='구매확정' }">
												<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
												<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today"/>
												<fmt:parseDate value="${ordersub.o_update_date}" var="n_regist" pattern="yyyy-MM-dd"/>
												<fmt:parseNumber value="${n_regist.time / (1000*60*60*24)}" integerOnly="true" var="regist"/>
												<c:set value="${today - regist }" var="dayDiff" />
												<span class="heavygray">배송완료</span>
												<ul class="state">	
													<c:choose>
														<c:when test="${ordersub.o_status=='배송완료'}">
															<c:if test="${dayDiff <= 14}">
																<li class="r5"><a href="return?num1=${ordersub.key }&num2=${ordersub.o_num}" class="obtnMini iw40">교환</a></li>
																<li><a href="return?num1=${ordersub.key }&num2=${ordersub.o_num}" class="nbtnMini iw40">반품</a></li>
															</c:if>
															<c:if test="${dayDiff <= 28}">
																<li><a onclick="orderComple('${ordersub.o_num }')" class="decidebtn" style="cursor: pointer;">구매확정</a></li>
															</c:if>
														</c:when>
														<c:when test="${ordersub.o_status=='구매확정'}">
															<c:if test="${dayDiff <= 14 && ordersub.reviewOk==0}">
																<li><a href="/product/review?orderListkey=${ordersub.key}"  class="popBtn nbtnMini" style="cursor: pointer;">리뷰작성</a></li>
                                                            </c:if>
														</c:when>
													</c:choose>
												</ul>
											</c:when>
											<c:when test="${ordersub.o_status=='결제대기중' }">
												<ul class="state">
													<li><a onclick="order_cancel('${ordersub.o_num }')" class="nbtnMini iw83" style="cursor: pointer;">취소</a></li>
												</ul>
											</c:when>
											<c:when test="${ordersub.o_status=='결제완료' }">
													<ul class="state">
														<li><a onclick="order_cancel2('${ordersub.o_num }')" class="nbtnMini iw83" style="cursor: pointer;">취소</a></li>
													</ul>
											</c:when>
											<c:otherwise>
													<span class="orange ">${ordersub.o_status }</span>
											</c:otherwise>
										</c:choose>
                                        <ul class="state">
                                            <li class="r5"><a href="return" class="obtnMini iw40">교환</a></li>
                                            <li><a href="return" class="nbtnMini iw40">반품</a></li>

                                            <li><a href=".writeReview?oNum=${ordersub.o_num}&pro_num=${ordersub.pro_num}" class="reviewbtn">리뷰작성</a></li>
                                            <li><a href="#" class="decidebtn">구매확정</a></li>
                                        </ul>
                                    </td>
                                </tr>
                                </c:forEach>
                                </c:forEach>
                                   <%-- </c:when>
                                  <c:otherwise>
                                      <tr>
                                          <div class="noData">
                                              등록된 상품이 없습니다.
                                          </div>
                                      </tr>
                                  </c:otherwise>
                                  </c:choose>--%>
                        </tbody>


                    </table>

                </div>

                <div class="btnAreaList">
                    <!-- 페이징이동1 -->
                    <div class="allPageMoving1">

                        <a href="#" class="n"><img src="../images/btn/btn_pre2.gif" alt="처음으로"/></a>
                        <a href="#" class="pre"><img src="../images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
                        <strong>1</strong>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <a href="#" class="next"><img src="../images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
                        <a href="#" class="n"><img src="../images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

                    </div>
                    <!-- //페이징이동1 -->
                </div>

                <div class="productTab">
                    <ul>
                        <li><a href="javascript:;" onclick="return false;" id="tab_today">오늘 본 상품 <span>(4)</span></a>
                        </li>
                        <li class="last"><a href="javascript:;" onclick="return false;" id="tab_basket">장바구니
                            <span>(0)</span></a></li>
                    </ul>
                </div>
                <script type="text/javascript">$(function () {
                    $(".productTab ul li a:eq(0)").click();
                });</script>


                <!-- Today Product -->
                <div class="tab_today disnone">

                    <div class="productList">
                        <ul>
                            <!-- Product Yes -->
                            <li>
                                <span class="chk"><input type="checkbox"/></span>
                                <span class="img"><img src="../images/img/sample_product.jpg" alt="상품"/></span>
                                <span class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></span>
                                <span class="price">4,330원</span>
                            </li>

                            <li>
                                <span class="chk"><input type="checkbox"/></span>
                                <span class="img"><img src="../images/img/sample_product.jpg" alt="상품"/></span>
                                <span class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></span>
                                <span class="price">4,330원</span>
                            </li>

                            <li>
                                <span class="chk"><input type="checkbox"/></span>
                                <span class="img"><img src="../images/img/sample_product.jpg" alt="상품"/></span>
                                <span class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></span>
                                <span class="price">4,330원</span>
                            </li>

                            <li>
                                <span class="chk"><input type="checkbox"/></span>
                                <span class="img"><img src="../images/img/sample_product.jpg" alt="상품"/></span>
                                <span class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></span>
                                <span class="price">4,330원</span>
                            </li>
                            <!-- //Product Yes -->

                            <!-- Product No
                            <li class="noProduct">
                                상품이 없습니다.
                            </li>
                             -->
                        </ul>
                    </div>

                    <div class="btnArea">
                        <div class="bRight">
                            <ul>
                                <li><a href="#" class="nbtnbig">선택상품 삭제</a></li>
                                <li><a href="#" class="sbtnMini">장바구니 추가</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
                <!-- //Today Product -->


                <!-- Shopping Basket -->
                <div class="tab_basket disnone">

                    <div class="productList">
                        <ul>
                            <!-- Product Yes -->
                            <li>
                                <span class="chk"><input type="checkbox"/></span>
                                <span class="img"><img src="../images/img/sample_product.jpg" alt="상품"/></span>
                                <span class="name"><a href="#">쟈뎅 장바구니 블루마운틴 블렌드 원두커피백 15P</a></span>
                                <span class="price">4,330원</span>
                            </li>

                            <li>
                                <span class="chk"><input type="checkbox"/></span>
                                <span class="img"><img src="../images/img/sample_product.jpg" alt="상품"/></span>
                                <span class="name"><a href="#">쟈뎅 장바구니 블루마운틴 블렌드 원두커피백 15P</a></span>
                                <span class="price">4,330원</span>
                            </li>

                            <li>
                                <span class="chk"><input type="checkbox"/></span>
                                <span class="img"><img src="../images/img/sample_product.jpg" alt="상품"/></span>
                                <span class="name"><a href="#">쟈뎅 장바구니 블루마운틴 블렌드 원두커피백 15P</a></span>
                                <span class="price">4,330원</span>
                            </li>

                            <li>
                                <span class="chk"><input type="checkbox"/></span>
                                <span class="img"><img src="../images/img/sample_product.jpg" alt="상품"/></span>
                                <span class="name"><a href="#">쟈뎅 장바구니 블루마운틴 블렌드 원두커피백 15P</a></span>
                                <span class="price">4,330원</span>
                            </li>
                            <!-- //Product Yes -->

                            <!-- Product No
                            <li class="noProduct">
                                상품이 없습니다.
                            </li>
                             -->
                        </ul>
                    </div>

                    <div class="btnArea">
                        <div class="bRight">
                            <ul>
                                <li><a href="#" class="nbtnbig">선택상품 삭제</a></li>
                                <li><a href="#" class="sbtnMini">선택상품 주문</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
                <!-- //Shopping Basket -->


                <script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
                <link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css"/>
                <script type="text/javascript">
                    $(function () {
                        function distance() {
                            var winWidth = $(window).width();
                            if (winWidth > 767) {
                                $(".productList ul li:nth-child(4n+4)").css("padding", "0 0 0 0");
                            } else {
                                $(".productList ul li:nth-child(4n+4)").css("padding", "0 10px");
                            }
                        }

                        distance();
                        $(window).resize(function () {
                            distance();
                        });


                        // layer popup
                        var winWidth = $(window).width();
                        if (winWidth > 767) {
                            var layerCheck = 760;
                        } else {
                            var layerCheck = 320;
                        }

                        $(".iw40").fancybox({
                            'autoDimensions': false,
                            'showCloseButton': false,
                            'width': layerCheck,
                            'padding': 0,
                            'type': 'iframe',
                            'onComplete': function () {
                                $('#fancybox-frame').load(function () { // wait for frame to load and then gets it's height
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
</div>
<!-- //container -->
<jsp:include page="../common/footer.jsp"/>
