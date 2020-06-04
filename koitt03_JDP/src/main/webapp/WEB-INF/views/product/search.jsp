<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-06-01
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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

                <div class="sContents">
                    <p><strong><span class="orange">‘원두커피백’</span>에 대한 검색 결과입니다.</strong></p>
                    <p>다른 상품을 검색하시려면 다시 한번 검색어를 입력하신 후 검색 버튼을 클릭하세요.</p>

                    <div class="searchForm">
                        <input type="text" class="reSearchType" onfocus="this.className='reSearchfocus'" onblur="if (this.value.length==0) {this.className='reSearchType'}else {this.className='reSearchfocusnot'}" />
                        <div class="btn"><a href="#"><img src="images/btn/btn_result_search.gif" alt="검색" /></a></div>
                        <p class="rechk"><input type="checkbox" /><label>결과 내 재검색</label></p>
                    </div>
                </div>

                <div class="tabCategory">
                    <div class="cateLeft"><span class="orange">‘원두커피백’</span> 검색 결과 <span class="orange">15</span>건 </div>
                    <div class="cateRight">
                        <ul>
                            <li class="first"><a href="#" class="on">인기도순</a></li>
                            <li><a href="#">신상품순</a></li>
                            <li><a href="#">높은 가격순</a></li>
                            <li class="last"><a href="#">낮은 가격순</a></li>
                        </ul>
                    </div>
                </div>

                <div class="brandList">
                    <ul>
                        <!-- 반복 -->
                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>
                        <!-- //반복 -->

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <div class="img"><img src="images/img/sample_brand.jpg" alt="제품이미지" /></div>
                                <div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
                                <div class="price">5,600원</div>
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
            <!-- //maxcontents -->

        </div>
        <!-- //container -->

<jsp:include page="../common/footer.jsp" />