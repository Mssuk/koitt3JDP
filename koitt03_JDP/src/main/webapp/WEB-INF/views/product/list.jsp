<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/header.jsp" />

        <!-- container -->
        <div id="container">

            <div id="location">
                <ol>
                    <li><a href="#">HOME</a></li>
                    <li>원두커피</li>
                    <li class="last">원두</li>
                </ol>
            </div>

            <!-- maxcontents -->
            <div id="maxcontents">
                <div class="banner"><img src="/images/img/product_banner01.jpg" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="web" /><img src="..//images/img/product_banner01_m.jpg" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="mobile" /></div>

                <h2 class="brand">쟈뎅원두<span>더 신선한 커피, 더 맛있는 커피</span></h2>

                <div class="brandTab">
                    <ul>
                        <li><a href="#" class="hover">드립커피백</a></li>
                        <li><a href="#">오리지널 커피백</a></li>
                        <li><a href="#">마일드 커피백</a></li>
                        <li><a href="#">카페모리</a></li>
                        <li><a href="#">카페포드</a></li>
                        <li><a href="#">카페리얼</a></li>
                        <li><a href="#">워터커피</a></li>
                        <li><a href="#">클래스</a></li>
                    </ul>
                </div>

                <div class="brandList">
                    <ul>
                        <!-- 반복 -->
                        <c:forEach var="dto" items="${dtos}">
                        <li>
                            <a href="detail?pro_num=${dto.pro_num}">
                                <div class="img"><img src="${dto.front_image1}" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>${dto.product_name}</div>
                                <div class="price">${dto.product_price}원</div>
                            </a>
                        </li>
                        <!-- //반복 -->
                        </c:forEach>

                    </ul>
                </div>

                <!-- quickmenu -->
                <div id="quick">
                    <div class="cart"><a href="#">장바구니</a></div>
                    <div class="wish">
                        <p class="title">위시 리스트</p>

                        <div class="list">
                            <ul>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                                <li><a href="#"><img src="/images/img/sample_wish.gif" alt="" /></a>
                            </ul>
                        </div>

                        <div class="total">
                            <a href="#none" class="wishLeft"><img src="/images/btn/wish_left.gif" alt="" /></a>
                            <span class="page">1</span> / <span class="sum">3</span>
                            <a href="#none" class="wishRight"><img src="/images/btn/wish_right.gif" alt="" /></a>
                        </div>

                    </div>

                    <div class="top"><a href="#">TOP&nbsp;&nbsp;<img src="/images/ico/ico_top.gif" alt="" /></a></div>
                </div>
                <script type="text/javascript">
                    $(function(){

                        $(window).scroll(function(){
                            var tg = $("div#quick");
                            var xg = $("div#maxcontents");
                            var limit = xg.height()- 165;
                            var tmp = $(window).scrollTop();

                            if (tmp > limit) {
                                tg.css({"position" : "absolute","right" : "-150px","bottom" : "208px","top" : "auto"});
                            }
                            else {
                                tg.css({"position" : "fixed","top" : "208px" , "margin-left" : "940px","right" : "auto"});
                            }
                        });

                    });
                </script>
                <!-- //quickmenu -->

            </div>
            <!-- //maxcontents -->

        </div>
        <!-- //container -->

<jsp:include page="../common/footer.jsp" />