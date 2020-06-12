<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp"/>
<!-- container -->
<div id="container">

    <div id="location">
        <ol>
            <li><a href="#">HOME</a></li>
            <li><a href="#">MY PAGE</a></li>
            <li class="last">반품/교환 현황</li>
        </ol>
    </div>

    <div id="outbox">
        <div id="left">
            <div id="title">MY PAGE<span>마이페이지</span></div>
            <ul>
                <li><a href="#" id="leftNavi1">주문/배송 조회</a></li>
                <li><a href="#" id="leftNavi2">반품/배송 현황</a></li>
                <li><a href="#" id="leftNavi3">장바구니</a></li>
                <li><a href="#" id="leftNavi4">위시리스트</a></li>
                <li><a href="#" id="leftNavi5">나의 쿠폰</a></li>
                <li><a href="#" id="leftNavi6">나의 포인트</a></li>
                <li><a href="#" id="leftNavi7">1:1문의</a></li>
                <li><a href="#" id="leftNavi8">회원정보 수정</a></li>
                <li class="last"><a href="#" id="leftNavi9">회원 탈퇴</a></li>
            </ul>
        </div>
        <script type="text/javascript">initSubmenu(2, 0);</script>


        <!-- contents -->
        <div id="contents">
            <div id="mypage">
                <h2><strong>반품/교환 현황</strong><span>회원님이 구매하신 상품의 반품/교환 신청 및 내역을 확인하실 수 있습니다.</span></h2>

                <div class="myInfo">
                    <ul>
                        <li class="info"><strong>가나다</strong> 님의 정보를 한눈에 확인하세요.</li>
                        <li>보유 쿠폰<br/><span class="num">199</span> <span class="unit">장</span></li>
                        <li class="point">내 포인트<br/><span class="num">100,000</span> <span class="unit">P</span></li>
                        <li class="last">진행중인 주문<br/><span class="num">199</span> <span class="unit">건</span></li>
                    </ul>
                </div>

                <h3>반품/교환 상품정보</h3>
                <div class="orderDivNm">
                    <table summary="주문일자/주문번호, 상품명, 가격, 수량, 주문상태 순으로 조회를 하실수 있습니다." class="orderTable" border="1"
                           cellspacing="0">
                        <caption>반품/교환 상품정보</caption>
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
                        <tbody>
                        <tr>
                            <td>
                                <p class="day">2012-05-30</p>
                                <p class="orderNum">201205301204-8057</p>
                            </td>
                            <td class="left">
                                쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p
                            </td>
                            <td class="tnone">999,999 원</td>
                            <td class="tnone">1000개</td>
                            <td>
                                <span class="heavygray">배송완료</span>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <div class="noData">
                        등록된 상품이 없습니다.
                    </div>
                </div>


                <h3 class="dep">반품/교환 사유</h3>
                <div class="checkDiv">
                    <table summary="분류, 자세한 이유 순으로 반품/교환 사유를 작성 하실수 있습니다." class="checkTable" border="1"
                           cellspacing="0">
                        <caption>반품/교환 사유</caption>
                        <colgroup>
                            <col width="22%" class="tw30"/>
                            <col width="*"/>
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
                    });
                </script>


            </div>
        </div>
        <!-- //contents -->


    </div>
</div>
<!-- //container -->
<jsp:include page="../common/footer.jsp"/>