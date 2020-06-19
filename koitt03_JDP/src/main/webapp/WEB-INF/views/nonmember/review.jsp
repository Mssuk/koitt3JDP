<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <title> JARDIN SHOP </title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="JARDIN" />
    <meta name="keywords" content="JARDIN" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
    <link rel="stylesheet" type="text/css" href="../css/reset.css" />
    <link rel="stylesheet" type="text/css" href="../css/content.css" />
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/common.js"></script>
    <script type="text/javascript">
        $(function() {

        });
    </script>
</head>
<body>
<div id="layerWrap">

    <div class="inputWrap">

        <form class="inputBody"  enctype="multipart/form-data" name="review" action="writereview" method="post">
            <div class="title">구매 후기 작성하기</div>
            <p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;" style="display: inline-block;"><img src="../images/btn/btn_input_close.gif" alt="닫기" /></a></p>
            <div class="checkDivMt">
                <table summary="분류, 구매여부, 평가, 제목, 상세 내용 순으로 포토 리뷰를 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
                    <caption>구매 후기 작성</caption>
                    <colgroup>
                        <col width="19%" class="tw30" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                    <tr>
                        <th scope="row"><span>평가</span></th>
                        <td>
                            <ul class="pta">
                                <li>
                                    <input type="radio" name="score" id="starFive" checked="checked" value="5"/>
                                    <label for="starFive" class="star">
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="score" id="starFour"  value="4"/>
                                    <label for="starFour" class="star">
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="score" id="starThree"  value="3"/>
                                    <label for="starThree" class="star">
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="score" id="startwo" value="2" />
                                    <label for="startwo" class="star">
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>

                                <li>
                                    <input type="radio" name="score" id="starOne" value="1" />
                                    <label for="starOne" class="star">
                                        <img src="../images/ico/ico_star.gif" alt="별점" />
                                    </label>
                                </li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>제목</span></th>
                        <td>
                            <input type="text" class="wlong" name="title" />
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>내용</span></th>
                        <td>
                            <textarea class="tta" name="content"></textarea>
                        </td>
                    </tr>
                     <tr>
                        <th scope="row"><span>이미지</span></th>
                        <td>
                            <input type="file" class="fileType" id="smallImage" name="image"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <!-- Btn Area -->
            <div class="btnArea">
                <div class="bCenter">
                    <ul>
                        <li><a href="#" class="sbtnMini">확인</a></li>
                        <li><a onclick="parent.$.fancybox.close();" href="javascript:;" class="nbtnbig">취소</a></li>
                    </ul>
                </div>
            </div>
            <!-- //Btn Area -->

        </form>

    </div>


</div>
</body>
</html>