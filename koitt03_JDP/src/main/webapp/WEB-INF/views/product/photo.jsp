<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-06-01
  Time: 오후 3:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title> JARDIN SHOP </title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="JARDIN" />
    <meta name="keywords" content="JARDIN" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
    <link rel="stylesheet" type="text/css" href="/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="/css/content.css" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/common.js"></script>
<%--    <script>--%>
<%--        function addReviewData() {--%>

<%--            var image=document.getElementById("image").value;--%>
<%--            var star=document.querySelector('input[name="appraisal"]:checked').value;--%>
<%--            star = parseInt(star);--%>
<%--            var title = document.getElementById("title").value;--%>
<%--            var content = document.getElementById("content").value;--%>
<%--            var pro_num = '${pro_num}';--%>
<%--            var key = '${key}';--%>


<%--            console.log(image)--%>
<%--            console.log(star);--%>
<%--            console.log(title);--%>
<%--            console.log(content);--%>
<%--            console.log(pro_num);--%>
<%--            console.log(key);--%>


<%--            window.location.href="addReview?star="+star+"&title="+title+"&content="+content+"&pro_num="+pro_num+"&key="+key;--%>

<%--            <c:choose>--%>
<%--                <c:when test="${check==1}">--%>
<%--                    alert("리뷰가 작성되었습니다.");--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                alert("리뷰가 작성되지 않았습니다.");--%>
<%--            </c:otherwise>--%>
<%--            </c:choose>--%>

<%--            window.close();--%>
<%--        }--%>
<%--    </script>--%>

</head>
<body>
<div id="layerWrap">

    <div class="inputWrap">

        <form class="inputBody" name="photoReview" method="post" action="/product/.addReview" enctype="multipart/form-data">
            <div class="title">리뷰 작성하기</div>
            <p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:window.close()"><img src="/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

            <div class="checkDivMt">
                <table summary="분류, 구매여부, 작은이미지, 평가, 제목, 상세 내용 순으로 포토 리뷰를 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                    <caption>리뷰 작성</caption>
                    <colgroup>
                        <col width="19%" class="tw30" />
                        <col width="*" />
                    </colgroup>
                    <tbody>

                    <tr>
                        <th scope="row"><span>이미지</span></th>
                        <td>
                            <input type="file" class="fileType" id="image" name="image"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>평가</span></th>
                        <td>
                            <ul class="pta">
                                <li>
                                    <input type="radio" name="appraisal" id="starFive" onclick="x()" value="5" />
                                    <label for="starFive" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="appraisal" id="starFour" onclick="x()" value="4"/>
                                    <label for="starFour" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="hidden" name="stars" id="stars">
                                    <input type="radio" name="appraisal" id="starThree" onclick="x()" value="3"/>
                                    <label for="starThree" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="appraisal" id="startwo" onclick="x()" value="2" />
                                    <label for="startwo" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="appraisal" id="starOne" onclick="x()" value="1"/>
                                    <label for="starOne" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>
                                <script>
                                    function x() {
                                        var star=document.querySelector('input[name="appraisal"]:checked').value;
                                        star = parseInt(star);
                                        console.log(star);

                                        document.getElementById("stars").value = star;
                                        console.log('test', document.getElementById("stars").value);

                                    }

                                    // console.log('먼저실행되는거아니야?')
                                    // var star=document.querySelector('input[name="appraisal"]:checked').value;
                                    // //star = parseInt(star);
                                    // console.log(star);
                                    // //console.log(document.getElementById("stars"));
                                    // //document.getElementById("stars").value = star;
                                </script>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>제목</span></th>
                        <td>
                            <input type="text" class="wlong" name="title" id="title"/>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>내용</span></th>
                        <td>
                            <textarea class="tta" name="content" id="content"></textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <input type="hidden" id="key" name="key" value="${key}">
            <input type="hidden" id="proNum" name="proNum" value="${pro_num}">
            <!-- Btn Area -->
            <div class="btnArea">
                <div class="bCenter">
                    <ul>
                        <li><input type="submit" class="sbtnMini" value="확인"/></li>
                        <li><a onclick="parent.$.fancybox.close();" href="javascript:window.close()" class="nbtnbig">취소</a></li>
                    </ul>
                </div>
            </div>
            <!-- //Btn Area -->



        </form>

    </div>


</div>
</body>
</html>
