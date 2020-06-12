<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp"/>
<!-- container -->
<div id="container">

    <div id="location">
        <ol>
            <li><a href="#">HOME</a></li>
            <li><a href="#">MY PAGE</a></li>
            <li class="last">위시리스트</li>
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
        <script type="text/javascript">initSubmenu(4, 0);</script>


        <!-- contents -->
        <div id="contents">
            <div id="mypage">
                <h2><strong>위시리스트</strong><span>위시리스트에 담긴 상품을 확인해보세요.</span></h2>

                <div class="myInfo">
                    <ul>
                        <li class="info"><strong>가나다</strong> 님의 정보를 한눈에 확인하세요.</li>
                        <li>보유 쿠폰<br/><span class="num">199</span> <span class="unit">장</span></li>
                        <li class="point">내 포인트<br/><span class="num">100,000</span> <span class="unit">P</span></li>
                        <li class="last">진행중인 주문<br/><span class="num">199</span> <span class="unit">건</span></li>
                    </ul>
                </div>

                <!-- 장바구니에 상품이 있을경우 -->
                <!-- 장바구니 상품 -->
                <h3>위시리스트에 담긴 상품</h3>
                <div class="orderDivNm">
                    <table summary="위시리스트에 담긴 상품들을 전체선택, 상품명, 가격/포인트, 수량, 합계, 주문 순으로 조회 및 주문을 하실수 있습니다."
                           class="orderTable" border="1" cellspacing="0">
                        <caption>위시리스트 상품목록</caption>
                        <colgroup>
                            <col width="7%"/>
                            <col width="*"/>
                            <col width="14%" class="tnone"/>
                            <col width="10%" class="tw14"/>
                            <col width="14%" class="tw28"/>
                            <col width="14%" class="tnone"/>
                        </colgroup>
                        <thead>
                        <th scope="col"><input type="checkbox"/></th>
                        <th scope="col">상품명</th>
                        <th scope="col" class="tnone">가격/포인트</th>
                        <th scope="col">수량</th>
                        <th scope="col">합계</th>
                        <th scope="col" class="tnone">주문</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td class="left">
                                <p class="img"><img src="../images/img/sample_product.jpg" alt="상품" width="66"
                                                    height="66"/></p>

                                <ul class="goods">
                                    <li>
                                        <a href="#">쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p</a>
                                    </li>
                                </ul>
                            </td>
                            <td class="tnone">1,123,400 원<br/><span class="pointscore">11,234 Point</span></td>
                            <td><input class="spinner" value="1" maxlength="3"/></td>
                            <td>1,123,400 원</td>
                            <td class="tnone">
                                <ul class="order">
                                    <li><a href="#" class="obtnMini iw70">바로구매</a></li>
                                    <li><a href="#" class="nbtnMini iw70">상품삭제</a></li>
                                </ul>
                            </td>
                        </tr>

                        <tr>
                            <td><input type="checkbox"/></td>
                            <td class="left">
                                <p class="img"><img src="../images/img/sample_product.jpg" alt="상품" width="66"
                                                    height="66"/></p>

                                <ul class="goods">
                                    <li>
                                        <a href="#">쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p</a>
                                    </li>
                                </ul>
                            </td>
                            <td class="tnone">1,123,400 원<br/><span class="pointscore">11,234 Point</span></td>
                            <td><input class="spinner" value="1" maxlength="3"/></td>
                            <td>1,123,400 원</td>
                            <td class="tnone">
                                <ul class="order">
                                    <li><a href="#" class="obtnMini iw70">바로구매</a></li>
                                    <li><a href="#" class="nbtnMini iw70">상품삭제</a></li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <div class="btnArea">
                    <div class="bRight">
                        <ul>
                            <li><a href="#" class="selectbtn">전체선택</a></li>
                            <li><a href="#" class="selectbtn2">선택수정</a></li>
                            <li><a href="#" class="selectbtn2">선택삭제</a></li>
                        </ul>
                    </div>
                </div>
                <!-- //장바구니 상품 -->


                <!-- 총 금액 -->
                <div class="amount">
                    <h4>총 금액</h4>
                    <ul class="info">
                        <li>
                            <span class="title">상품 합계금액</span>
                            <span class="won"><strong>1,132,310</strong> 원</span>
                        </li>
                        <li>
                            <span class="title">배송비</span>
                            <span class="won"><strong>2,500</strong> 원</span>
                        </li>
                    </ul>
                    <ul class="total">
                        <li class="mileage">(적립 마일리지 <strong>11,324</strong> Point)</li>
                        <li class="txt"><strong>결제 예정 금액</strong></li>
                        <li class="money"><span>1,134,810</span> 원</li>
                    </ul>
                </div>
                <!-- //총 주문금액 -->

                <div class="cartarea">
                    <ul>
                        <li><a href="#" class="ty1">선택상품 <span>주문하기</span></a></li>
                        <li><a href="#" class="ty2">전체상품 <span>주문하기</span></a></li>
                        <li class="last"><a href="#" class="ty3">쇼핑 <span>계속하기</span></a></li>
                    </ul>
                </div>

                <!-- //장바구니에 상품이 있을경우 -->


                <!-- 장바구니에 상품이 없을경우
                    <div class="noting">
                        <div class="point"><span class="orange">장바구니</span>에 담긴 상품이 없습니다.</div>

                        <p>장바구니에 담긴 상품은 30일간만 보관됩니다.<br/>더 오래 보관하고 싶은 상품은 <u>위시리스트</u>에 담아주세요.</p>

                        <a href="#">쇼핑 계속하기</a>
                    </div>
                 //장바구니에 상품이 없을경우 -->

            </div>
        </div>
        <!-- //contents -->


        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
        <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
        <style type="text/css">
            .ui-corner-all {
                border-bottom-right-radius: 0 !important;
                border-bottom-left-radius: 0 !important;
                border-top-left-radius: 0 !important;
                border-top-right-radius: 0 !important;
            }

            .ui-widget-content {
                border: 0;
            }

            .ui-spinner-input {
                width: 44px;
                margin: 0;
                border: 1px #ddd solid;
                padding: 2px 0 2px 5px;
                font-family: 'Nanum Gothic' !important;
                font-size: 12px !important;
            }
        </style>

        <script type="text/javascript">
            $(function () {
                var spinner = $(".spinner").spinner({min: 1, max: 999});
            });
        </script>


    </div>
</div>
<!-- //container -->
<jsp:include page="../common/footer.jsp"/>