<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp"/>
<!-- container -->
<div id="container">

    <div id="location">
        <ol>
            <li><a href="#">HOME</a></li>
            <li><a href="#">MY PAGE</a></li>
            <li class="last">회원 탈퇴</li>
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
        </div><script type="text/javascript">initSubmenu(9,0);</script>


        <!-- contents -->
        <div id="contents">
            <div id="mypage">
                <h2><strong>회원 탈퇴</strong><span>회원 탈퇴 전 다음의 안내 사항을 꼭 숙지하시기 바랍니다.</span></h2>

                <div class="myInfo">
                    <ul>
                        <li class="info"><strong>가나다</strong> 님의 정보를 한눈에 확인하세요.</li>
                        <li>보유 쿠폰<br/><span class="num">199</span> <span class="unit">장</span></li>
                        <li class="point">내 포인트<br/><span class="num">100,000</span> <span class="unit">P</span></li>
                        <li class="last">진행중인 주문<br/><span class="num">199</span> <span class="unit">건</span></li>
                    </ul>
                </div>


                <div class="alertBox">
                    <p class="chk">탈퇴 전 숙지사항</p>
                    <ul>
                        <li>그동안 쟈뎅샵을 이용해 주신 고객님께 진심으로 감사드립니다.</li>
                        <li>회원 탈퇴 시 포인트와 쿠폰은 즉시 삭제 처리되어 환급되지 않으며, 재가입 하셔도 복구되지 않습니다.</li>
                        <li>진행중인 거래(판매 또는 구매)내역이 존재하는 경우 회원 탈퇴가 불가능하며, 거래 종료 후 회원탈퇴 하실 수 있습니다.</li>
                    </ul>
                </div>


                <h3 class="dep">회원정보 입력</h3>
                <div class="checkDiv">
                    <table summary="반품/교환 분류선택, 기간별, 단어검색별로 주문/배송 조회를 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                        <caption>주문/배송 조회</caption>
                        <colgroup>
                            <col width="22%" class="tw30" />
                            <col width="*" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><span>아이디</span></th>
                            <td><input type="text" class="w186" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><span>비밀번호</span></th>
                            <td><input type="password" class="w186" /></td>
                        </tr>
                        <tr>
                            <th scope="row"><span>탈퇴사유</span></th>
                            <td>
                                <select>
                                    <option value="">선택해주세요.</option>
                                </select>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>


            </div>
        </div>
        <!-- //contents -->


    </div>
</div>
<!-- //container -->
<jsp:include page="../common/header.jsp"/>