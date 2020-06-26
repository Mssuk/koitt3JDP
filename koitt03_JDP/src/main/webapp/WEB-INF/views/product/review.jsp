<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-06-01
  Time: 오후 3:08
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
    <script type="text/javascript">
        $(function() {

        });
    </script>
</head>
<body>
<div id="layerWrap">

    <div class="inputWrap">

        <div class="inputBody">
            <div class="title">구매 후기 작성하기</div>
            <p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

            <div class="checkDivMt">
                <table summary="분류, 구매여부, 평가, 제목, 상세 내용 순으로 포토 리뷰를 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                    <caption>구매 후기 작성</caption>
                    <colgroup>
                        <col width="19%" class="tw30" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
<%--                    <tr>--%>
<%--                        <th scope="row"><span>분류</span></th>--%>
<%--                        <td>--%>
<%--                            <ul class="pta">--%>
<%--                                <li>--%>
<%--                                    <select>--%>
<%--                                        <option value="">카테고리</option>--%>

<%--                                    </select>--%>
<%--                                </li>--%>
<%--                                <li class="pt5">--%>
<%--                                    <select>--%>
<%--                                        <option value="">카테고리</option>--%>
<%--                                    </select>--%>
<%--                                </li>--%>
<%--                                <li class="pt5">--%>
<%--                                    <select>--%>
<%--                                        <option value="">카테고리</option>--%>
<%--                                    </select>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <tr>
                        <th scope="row"><span>구매여부</span></th>
                        <td>
                            <select id="reviewCheck">
                                <option value="">구매했어요.</option>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>평가</span></th>
                        <td>
                            <ul class="pta">
                                <li>
                                    <input type="radio" name="appraisal" id="starFive" value="5"/>
                                    <label for="starFive" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="appraisal" id="starFour" value="4" />
                                    <label for="starFour" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="appraisal" id="starThree" value="3"/>
                                    <label for="starThree" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="appraisal" id="startwo" value="2"/>
                                    <label for="startwo" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="appraisal" id="starOne" value="1"/>
                                    <label for="starOne" class="star">
                                        <img src="/images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>제목</span></th>
                        <td>
                            <input type="text" id="reviewTitle" class="wlong" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>내용</span></th>
                        <td>
                            <textarea id="reviewContent" class="tta"></textarea>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>


            <!-- Btn Area -->
            <div class="btnArea">
                <div class="bCenter">
                    <ul>
                        <li><a onclick="" class="sbtnMini">확인</a></li>
                        <li><a onclick="parent.$.fancybox.close();" href="javascript:" class="nbtnbig">취소</a></li>
                    </ul>
                </div>
            </div>
            <!-- //Btn Area -->

<%--            <script>--%>
<%--                function addReviewData() {--%>
<%--                    var type=document.getElementById("reviewCheck");--%>
<%--                    type = type.options[type.selectedIndex].text;--%>
<%--                    var star=document.querySelector('input[name="appraisal"]:checked').value;--%>
<%--                    star = parseInt(star);--%>
<%--                    var title = document.getElementById("reviewTitle").value;--%>
<%--                    var content = document.getElementById("reviewContent").value;--%>
<%--                    var pro_num = '${pro_num}';--%>

<%--                    console.log(type);--%>
<%--                    console.log(star);--%>
<%--                    console.log(title);--%>
<%--                    console.log(content);--%>
<%--                    console.log(pro_num);--%>

<%--                    window.location.href=".addReview?type="+type+"&star="+star+"&title="+title+"&content="+content+"&pro_num="+pro_num;--%>
<%--                    alert("등록되었습니다.");--%>
<%--                    window.close();--%>
<%--                }--%>
<%--            </script>--%>
        </div>

    </div>


</div>
</body>
</html>