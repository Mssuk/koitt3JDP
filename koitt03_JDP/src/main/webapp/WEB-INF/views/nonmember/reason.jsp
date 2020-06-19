<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title> JARDIN SHOP </title>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="description" content="JARDIN"/>
    <meta name="keywords" content="JARDIN"/>
    <meta name="viewport"
          content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no"/>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../css/content.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
</head>
<body>
<div id="layerWrap">

    <div class="inputWrap">

        <div class="inputBody">
            <div class="title">사유 보기</div>
            <p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;" style="display: inline-block;"><img
                    src="../images/btn/btn_input_close.gif" alt="닫기"/></a></p>


            <textarea class="reasontta">${reason }</textarea>


            <div class="centerbrn pd10">
                <a href="javascript:;" onclick="parent.$.fancybox.close();"  style="display: inline-block;">확인</a>
            </div>

        </div>

    </div>


</div>
</body>
</html>