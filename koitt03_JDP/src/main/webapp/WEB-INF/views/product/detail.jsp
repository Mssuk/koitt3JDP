<%--        이준희
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-06-01
  Time: 오후 2:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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



                <!-- product -->
                <div id="pDetail">

                    <!-- Slide -->
                    <div class="imgSlide">
                        <div class="img">
                            <ul>
                                <li><img src=${dto.front_image1 } alt="제품이미지" /></li>
                                <li><img src=${dto.front_image2 } alt="제품이미지" /></li>
                                <li><img src=${dto.front_image3 } alt="제품이미지" /></li>
                            </ul>
                        </div>

                        <div class="thum">
                            <ul>
                                <li><img src=${dto.front_image1 } alt="썸네일제품이미지" /></li>
                                <li><img src=${dto.front_image2 } alt="썸네일제품이미지" /></li>
                                <li><img src=${dto.front_image3 } alt="썸네일제품이미지" /></li>
                            </ul>
                        </div>
                    </div>
                    <!-- //Slide -->


                    <!-- info -->
                    <div class="info">
                        <p class="title">
                            <span>[오리지널]</span>
                            ${dto.product_name}
                        </p>

                        <div class="priceInfo">
                            <ul>
                                <li>
                                    <div class="stit">판매가</div> <div class="heavygray"><strong>${dto.product_price}원</strong></div>
                                </li>
                                <li>

                                    <div class="stit">포인트</div> <div class="orange"><strong> ${dto.point} POINT</strong></div>
                                </li>
                                <li>
                                    <div class="stit">칼로리</div> <div>${dto.product_kcal}kcal</div>
                                </li>
                                <li>
                                    <div class="stit">용량</div> <div>${dto.capacity}3.8kg+15p</div>
                                </li>
                                <li>
                                    <div class="stit">수량</div> <div class="num"><input id="spinner" value="1" /></div>
                                </li>
                                <li>
                                    <div class="stit">평점</div>
                                    <div>
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star_off.gif" alt="별점" />
                                    </div>
                                </li>
                            </ul>
                        </div>

                        <!-- 판매중 -->
                        <div class="infobtn">
                            <ul>
                                <li><a onclick="spinner()" class="ty1">바로 <span>구매하기</span></a></li>
                                
                                <li><a href="javascript:;" id="cartPut" class="ty2">장바구니 <span>담기</span></a></li>
                                <li class="last"><a href="#" class="ty3">위시 <span>리스트</span></a></li>
                            </ul>
                            <script>
                                function spinner() {

                                    const spin = document.getElementById("spinner").value;
                                    location.href= '/payment/payment?pro_num=${dto.pro_num}'+'&spinner='+spin;
                                }
                            </script>
                        </div>
                        <!-- //판매중 -->

                        <!-- 판매중지 -->
                        <div class="endbtn" style="display:none;">
                            <ul>
                                <li><a href="#">판매중지</a></li>
                                <li><a href="#">SOLD OUT</a></li>
                            </ul>
                        </div>
                        <!-- //판매중지 -->


                    </div>
                    <!-- //info -->

                </div>
                <!-- //product -->


                <!-- tab -->
                <div class="detailTab">
                    <ul>
                        <li class="dep"><a href="javascript:;" onclick="return false;" id="detailInfo">상품상세 정보</a></li>
                        <li><a href="javascript:;" onclick="return false;" id="goodsRelation">관련상품</a></li>
                        <li class="dep"><a href="javascript:;" onclick="return false;" id="goodsReview">상품리뷰 <span>()</span></a></li>
                        <li><a href="javascript:;" onclick="return false;" id="goodsQna">질문과 답변 <span>(${qCount})</span></a></li>
                        <li class="last"><a href="javascript:;" onclick="return false;" id="goodsNotice">정책 및 공지</a></li>
                    </ul>
                </div><script type="text/javascript">$(function(){$(".detailTab ul li a:eq(${initVal})").click();});</script>

                <!-- //tab -->


                <!-- detail content -->
                <div id="detailContent">

                    <!-- detail info -->
                    <div class="detailInfo disnone">
                        <img src=${dto.back_image } class="web" alt="제품상세 정보" />
                        <img src="/images/img/sample_detail_info_m.jpg" class="mobile" alt="제품상세 정보" />
                        <div class="checkInfoDiv">
                            <table summary="제품의 정보를 알 수 있는 표로 제품명, 내용량, 제조원, 포장재질, 유통기한, 고객상담실, 식품의 유형, 유통전문판매원, 영양성분, 원재료명 및 함량, 업소명 및 소재지 순으로 나열되어 있습니다." class="checkTable" border="1" cellspacing="0">
                                <caption>제품의 정보</caption>
                                <colgroup>
                                    <col width="20%" class="tw22" />
                                    <col width="*" />
                                    <col width="18%" class="tw22" />
                                    <col width="*" class="tw25" />
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row" class="info"><span>제조명</span></th>
                                    <td>원두커피백</td>
                                    <th scope="row" class="info"><span><u>내용량</u></span></th>
                                    <td>일회용 원두커피 티백</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>제조원</span></th>
                                    <td>JARDIN</td>
                                    <th scope="row" class="info"><span>포장재질</span></th>
                                    <td>폴리에틸렌(내면)</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>유통기한</span></th>
                                    <td>제조일로부터 OO개월</td>
                                    <th scope="row" class="info"><span>고객<u>상담실</u></span></th>
                                    <td>02-546-3881</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>식품의 <u>유형</u></span></th>
                                    <td>인스턴트 커피</td>
                                    <th scope="row" class="info"><span>유통전문<u>판매원</u></span></th>
                                    <td></td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>영양성분</span></th>
                                    <td colspan="3">인스턴트 커피, 합성 헤이즐넛향</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>원재료명 <u>및 함량</u></span></th>
                                    <td colspan="3">열량 95kcal, 탄수화물 16g, 당류 11g, 단백질 1g, 지방 2.9g, 포화지방 2.8, 트랜스지방 0g, 콜레스테롤 0mg</td>
                                </tr>

                                <tr>
                                    <th scope="row" class="info"><span>업소명 <u>및 소재지</u></span></th>
                                    <td colspan="3">서울시 강남구 논현동 4-21번지 영 빌딩 (주)쟈뎅</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- detail info -->

<script type="text/javascript">
$("#cartPut").click(function(){

	if(confirm("선택한 제품을 장바구니에 추가하시겠습니까?")){
		var pronum = '${dto.pro_num}';
		
		var cnt = document.getElementById("spinner").value;
		
		var Obj= {};
		
		Obj.pro_num = pronum;
		Obj.count=cnt;
		
		var jsonData = JSON.stringify(Obj);
		
		$.ajax({
			url:`/putCart`,
			type: 'POST',
			data:jsonData,
			contentType:'application/json',
			dataType:'json',
			success: function (data) {
				if(data == 0){
					alert('장바구니 담기 실패');
				}else if(data == 1){
					alert('장바구니에 상품을 담았습니다.');
				}
			},
			error: function (e) {
				console.log(e);
			}
		});

	};
});
</script>






                    <!-- goods relation -->
                    <div class="goodsRelation disnone">
                        <div class="headTitle">
                            <strong>관련상품&nbsp;</strong> 이 상품을 구매하신 분들이 함께 구매한 상품입니다.
                        </div>

                        <div class="relationList">
                            <ul>
                                <c:forEach var="relProduct" items="${relProduct}">
                                    <li>
                                        <a href="/product/detail?pro_num=${relProduct.pro_num }"><div class="img"><img src="${relProduct.front_image1}" alt="관련상품 이미지" /></div></a>
                                        <div class="name"><a href="#">${relProduct.product_name}</a></div>
                                        <div class="price">${relProduct.product_price}원</div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <div class="btnAreaList">

                        </div>

                    </div>
                    <!-- //goods relation -->

                    <!-- goods review -->
                    <div class="goodsReview disnone">
                        <div class="headTitle">
                            <strong>포토 상품평&nbsp;</strong> 포토 상품평 작성자 중 우수상품평을 선정해 소정의 선물을 드립니다.
                            <p class="btn"><a onclick="photo('${dto.pro_num}')" >포토 상품평 작성</a></p>
                        </div>
                        <script>
                            function photo(pro_num) {
                                window.name = "parentForm";
                                window.open("/product/photo?pro_num="+pro_num,"childForm","width=600, height=600, resizable = no, scrollbars = no");
                            }
                        </script>


                        <!-- 포토 구매후기 -->
                        <div class="imgListType">
                            <ul>
                                <c:forEach var="photoReviewList" items="${photoReviewDtos}">
                                    <c:choose>
                                        <c:when test="${photoReviewList.image != null}">

                                <!-- List -->
                                <li>
                                    <div class="img"><img src="${photoReviewList.image}" width="155" height="160" alt="" /></div>
                                    <div class="txt">
                                        <div class="subject">
                                            <a href="#"><span class="orange"></span> ${photoReviewList.title}</a>
                                        </div>
                                        <div class="conf">
                                            ${photoReviewList.content}
                                        </div>
                                        <div class="data">
                                            <p>작성자 <span>${photoReviewList.id} id뒤에 일부는 *로 표시</span></p>
                                            <p>등록일 <span>${photoReviewList.regist_review}</span></p>
                                            <p>조회수 <span>${photoReviewList.hit}</span></p>
                                            <p>평점
                                                <span class="ty">
												<img src="/images/ico/ico_star.gif" alt="별점" />
												<img src="/images/ico/ico_star.gif" alt="별점" />
												<img src="/images/ico/ico_star.gif" alt="별점" />
												<img src="/images/ico/ico_star.gif" alt="별점" />
												<img src="/images/ico/ico_star.gif" alt="별점" />
											</span>
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                                <!-- //List -->


                            </ul>
                        </div>


                        <div class="btnAreaList">
                            <!-- 페이징이동1 -->
                            <div class="allPageMoving1">

                                <a href="detail?pro_num=${dto.pro_num}&pagePhoto=1" class="n"><img src="/images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="detail?pro_num=${dto.pro_num}&pagePhoto=${pagePhoto-1}" class="pre"><img src="/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
                                <c:forEach var="pageListPhoto" items="${pageListPhoto}">
                                    <c:choose>
                                        <c:when test="${pageListPhoto==pagePhoto}">
                                            <strong>${pageListPhoto}</strong>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="detail?pro_num=${dto.pro_num}&pagePhoto=${pageListPhoto}&initVal=2"></a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <a href="detail?pro_num=${dto.pro_num}&pagePhoto=${pagePhoto+1}" class="next"><img src="/images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="detail?pro_num=${dto.pro_num}&pagePhoto=${lastNumPhoto}" class="n"><img src="/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

                            </div>
                            <!-- //페이징이동1 -->
                        </div>
                        <!-- //포토 구매후기 -->


                        <div class="headTitle depth">
                            <strong>상품리뷰&nbsp;</strong>상품리뷰는 상품 구매 후 작성하실 수 있습니다.
                            <p class="btn"><a onclick="writeReview()">구매 후기 작성</a></p>
                        </div>

                        <script>
                            function writeReview(pro_num) {

                               window.name = "parentForm";

                                 window.open("/product/review?pro_num="+pro_num,"childForm","width=600, height=600, resizable = no, scrollbars = no");
                            }

                        </script>

                        <!-- 상품리뷰 -->
                        <div class="accordion">
                            <ul>
                                <!-- 반복 -->
                                <c:forEach var="reviewList" items="${reviewDtos}">
                                    <c:choose>
                                        <c:when test="${reviewList.image ==null}">
                                <li>
                                    <div class="headArea">
                                        <div class="subject">
                                            <a href="javascript:" class="accbtn">${reviewList.title}</a>
                                        </div>
                                        <div class="writer">[${reviewList.id}]</div>
                                        <div class="day">
                                            <p>${reviewList.regist_review}</p>
                                            <p>
                                                <img src="/images/ico/ico_star.gif" alt="별점" />
                                                <img src="/images/ico/ico_star.gif" alt="별점" />
                                                <img src="/images/ico/ico_star.gif" alt="별점" />
                                            </p>
                                        </div>
                                    </div>


                                    <%-- 클릭 시 내용과 관리자 답변이 나옴  --%>
                                    <div class="hideArea">
                                        <div class="bodyArea">
                                            ${reviewList.content}
                                        </div>

                                        <!-- 답변 -->
                                        <div class="answer">
                                            <div class="inbox">
                                                <div class="aname">
                                                    <p>담당자</p>
                                                </div>

                                                <div class="atxt">
                                                    ${reviewList.admin_answer}
                                                </div>
                                            </div>
                                        </div>
                                        <!-- //답변 -->

                                        <div class="modify">
                                            <a href="#">수정</a>
                                            <a href="#">삭제</a>
                                        </div>

                                    </div>
                                </li>
                                <!-- //반복 -->
                                        </c:when>
                                    </c:choose>
                                </c:forEach>

                            </ul>
                        </div>

                        <div class="btnAreaList">
                            <!-- 페이징이동1 -->
                            <div class="allPageMoving1">
                                <a href="detail?pro_num=${dto.pro_num}&page=1&initVal=2" class="n"><img src="/images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="detail?pro_num=${dto.pro_num}&page=${page-1}&initVal=2" class="pre"><img src="/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>

                                <c:forEach var="pageList1" items="${pageList}">
                                    <c:choose>
                                        <c:when test="${pageList1 == page}">
                                            <strong>${pageList1}</strong>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="detail?pro_num=${dto.pro_num}&page=${pageList1}&initVal=2">${pageList1}</a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <a href="detail?pro_num=${dto.pro_num}&page=${page+1}&initVal=2" class="next"><img src="/images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="detail?pro_num=${dto.pro_num}&page=${lastNum}&initVal=2" class="n"><img src="/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
                            </div>
                            <!-- //페이징이동1 -->
                        </div>
                        <!-- //상품리뷰 -->

                    </div>
                    <!-- //goods review -->


                    <!-- goods qna -->
                    <div class="goodsQna disnone">
                        <div class="headTitle depth">
                            <strong>질문과 답변&nbsp;</strong>상품과 관련된 문의와 답변을 하는 공간입니다.
                            <p class="btn"><a href="inquiry.html" class="popBtn">문의하기</a></p>
                        </div>

                        <!-- 질문과 답변 -->
                        <div class="accordion">
                            <ul>

                                <c:forEach var="qaList" items="${qaList}">

                                <li>
                                    <div class="headArea">
                                        <div class="subject">
                                            <a href="javascript:" class="accbtn">${qaList.get("Q_TITLE")}</a>
                                        </div>
                                        <div class="writer">[${qaList.get("ID")}]</div>
                                        <div class="day">
                                            <p>${qaList.get("Q_DATE")}</p>
                                            <p><span class="obtnMini iw70">답변완료</span></p>
                                        </div>
                                    </div>

                                    <div class="hideArea">
                                        <div class="bodyArea">
                                            ${qaList.get("Q_CONTENT")}
                                        </div>

                                        <!-- 답변 -->
                                        <div class="answer">
                                            <div class="inbox">
                                                <div class="aname">
                                                    <p>담당자</p>
                                                </div>

                                                <div class="atxt">
                                                    ${qaList.get("A_CONTENT")}
                                                </div>
                                            </div>
                                        </div>
                                        <!-- //답변 -->

                                        <div class="modify">
                                            <a href="#">수정</a>
                                            <a href="#">삭제</a>
                                        </div>

                                    </div>
                                </li>

                                </c:forEach>

                            </ul>
                        </div>
                        <!-- //질문과 답변 -->

                        <div class="btnAreaList">
                            <!-- 페이징이동1 -->
                            <div class="allPageMoving1">

                                <a href="detail?pro_num=${dto.pro_num}&pageQA=1" class="n"><img src="/images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="detail?pro_num=${dto.pro_num}&pageQA=${pageQA-1}" class="pre"><img src="/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
                                    <c:forEach var="pageList1" items="${pageListQA}">
                                        <c:choose>
                                            <c:when test="${pageList1==pageQA}">
                                                <strong>${pageList1}</strong>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="detail?pro_num=${dto.pro_num}&pageQA=${pageList1}">${pageList1}</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                <a href="detail?pro_num=${dto.pro_num}&pageQA=${pageQA+1}" class="next"><img src="/images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="detail?pro_num=${dto.pro_num}&pageQA=${lastNumQA}" class="n"><img src="/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

                            </div>
                            <!-- //페이징이동1 -->
                        </div>
                    </div>
                    <!-- //goods qna -->


                    <!-- goods notice -->
                    <div class="goodsNotice disnone">
                        <div class="headTitle depth">
                            <strong>정책 및 공지&nbsp;</strong>주문 전 필독 사항입니다.
                        </div>

                        <div class="detailDiv">
                            <table summary="정책 및 공지 알림 게시판으로 회원가입안내, 주문안내, 결제안내, 배송안내, 교환/반품안내, 환불안내 순으로 조회 하실수 있습니다. " class="detailTable" border="1" cellspacing="0">
                                <caption>정책 및 공지</caption>
                                <colgroup>
                                    <col width="22%" class="tw30" />
                                    <col width="*" />
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row"><span>회원가입<br/>안내</span></th>
                                    <td>
                                        <ul>
                                            <li>저희 쇼핑몰은 회원제로 운영합니다.</li>
                                            <li>회원가입비나 월회비, 연회비 등 어떠한 비용도 청구하지 않는 100% 무료입니다.</li>
                                            <li>회원님들께는 구매 시 포인트 혜택을 드립니다.</li>
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>주문 안내</span></th>
                                    <td>
                                        <ul>
                                            <li>Step 1 : 상품 검색</li>
                                            <li>Step 2 : 장바구니에 담기</li>
                                            <li>Step 3 : 회원 ID 로그인 또는 비회원으로 주문하기</li>
                                            <li>Step 4 : 주문 성공 화면(주문번호)</li>
                                        </ul>

                                        <p class="fn12">※비회원 주문인 경우 주문번호와 승인번호(카드 결제 시)를 꼭 메모해 두시기 바랍니다.<br/>&nbsp;&nbsp;&nbsp;단, 회원의 경우 자동으로 저장되므로 따로 관리하실 필요가 없습니다.</p>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>결제 안내</span></th>
                                    <td>
                                        <ul>
                                            <li>카드 결제나 무통장 입금을 하시는 경우 입금/결제 확인 후 상품이 배송됩니다.</li>
                                            <li>무통장 입금 시 주문자와 입금자가 다른 경우 배송이 지연될 수 있습니다. 게시판에 정보를 남겨주셔야 합니다. </li>
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>배송 안내</span></th>
                                    <td>
                                        <ul>
                                            <li>배송 방법 : 택배</li>
                                            <li>배송 지역 : 전국 지역 (제주 도서/산간지역 별도)</li>
                                            <li>배송 비용 : 총 결제금액이 100,000원 미만일 경우 2,500원 추가됩니다.</li>
                                            <li>배송 안내 : 재고가 없거나 재입고 될 경우 7~14일이 소요됩니다.</li>
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>교환/반품<br/>안내</span></th>
                                    <td>
                                        <ul>
                                            <li>저희 쇼핑몰은 교환/반품 정책을 운영하고 있습니다.</li>
                                            <li>사이즈 교환에 한하여는 1회 교환이 가능합니다. (단, 택배비는 고객 부담입니다.)</li>
                                            <li>교환 시 제품을 수령한 날로부터 24시간 이내 1:1문의 게시판 혹은 고객센터로 연락을 주시고 3일 이내에 보내주신 상품에 한하여 교환됩니다.</li>
                                            <li>제품에 하자가 있는 경우에는 동일 사이즈, 동일 디자인으로 재교환 해 드립니다.</li>
                                        </ul>
                                    </td>
                                </tr>

                                <tr>
                                    <th scope="row"><span>환불 안내</span></th>
                                    <td>
                                        <ul>
                                            <li>환불 시 반품 확인 여부를 확인 한 후 3일 이내에 결제금액을 환불해 드립니다.</li>
                                            <li>신용카드로 결제하신 경우, 신용카드 승인을 취소하면 결제 대금이 청구되지 않습니다. </li>
                                        </ul>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- //goods notice -->


                </div>
                <!-- //detail content -->








                <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
                <script type="text/javascript" src="/js/jquery.fancybox-1.3.4.pack.js"></script>
                <link rel="stylesheet" type="text/css" href="/css/jquery.fancybox-1.3.4.css" />
                <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
                <style type="text/css">
                    .ui-corner-all{border-bottom-right-radius:0 !important; border-bottom-left-radius:0 !important; border-top-left-radius:0 !important; border-top-right-radius:0 !important;}
                    .ui-widget-content{border:0;}
                    .ui-spinner-input{width:70px; margin:0; border:1px #ddd solid; padding:2px 0 2px 5px; font-family:'Nanum Gothic' !important; font-size:12px !important;}
                </style>

                <script type="text/javascript">
                    $(document).ready(function() {

                        // spinner
                        var spinner = $( "#spinner" ).spinner({ min: 1 });


                        // rolling
                        function widthChk(){
                            var winWidth = $(window).width();
                            if(winWidth > 983){var twidth = 348;
                            }else if(winWidth < 983 && winWidth > 767){var twidth = 298;
                            }else{var twidth = 248;}
                            return twidth
                        }

                        function slideChk(){
                            var ulchk = widthChk() * $(".img ul li").size();
                            $(".img ul").css("width",ulchk);
                        }

                        $(".thum ul li").click(function(){
                            var winWidth = $(window).width();
                            var thumNum = $(".thum ul li").index(this);
                            var ulLeft = widthChk() * thumNum ;
                            $(".thum ul li").removeClass("hover");
                            $(this).addClass("hover");
                            $(".img ul").stop().animate({"left": - ulLeft}, 500);
                        });


                        // goods relation last margin
                        function relationChk(){
                            var winWidth = $(window).width();
                            if(winWidth > 767){
                                $(".relationList li").css("margin","0 20px 0 0");
                                $(".relationList li:eq(4)").css("margin","0");
                            }else if(winWidth < 768 && winWidth > 360){
                                $(".relationList li").css("margin","0 10px 10px 0");
                                $(".relationList li:eq(4)").css("margin","0");
                            }else{
                                $(".relationList li").css("margin","0 10px 10px 0");
                                $(".relationList li:nth-child(2n)").css("margin","0 0 10px 0");
                            }
                        }

                        // layer popup
                        var winWidth = $(window).width();
                        if(winWidth > 767){
                            var layerCheck = 540;
                            var popCheck = 768;
                        }else{
                            var layerCheck = 320;
                            var popCheck = 320;
                        }
                        $(".passbtn").fancybox({
                            'autoDimensions'    : false,
                            'showCloseButton'	: false,
                            'width' : layerCheck,
                            'padding' : 0,
                            'type'			: 'iframe',
                            'onComplete' : function() {
                                $('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
                                    $('#fancybox-content').height($(this).contents().find('body').height());
                                });
                            }
                        });

                        $(".popBtn").fancybox({
                            'autoDimensions'    : false,
                            'showCloseButton'	: false,
                            'width' : popCheck,
                            'padding' : 0,
                            'type'			: 'iframe',
                            'onComplete' : function() {
                                $('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
                                    $('#fancybox-content').height($(this).contents().find('body').height());
                                });
                            }
                        });


                        // resize
                        $(window).resize(function(){
                            $(".thum ul li:eq(0)").click();
                            slideChk();
                            relationChk();
                        });


                        $(".thum ul li:eq(0)").click();
                        slideChk();
                        relationChk();

                    });
                </script>




            </div>
            <!-- //maxcontents -->

        </div>
        <!-- //container -->

<jsp:include page="../common/footer.jsp" />