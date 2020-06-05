<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-06-04
  Time: 오후 1:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function setParent(){
            opener.document.getElementById("pInput").value = document.getElementById("choiceCoupon").value;

        }


    </script>

</head>
<body>

    <jsp:include page="../common/header.jsp"/>

    <table border="1">
        <tr>
            <th>쿠폰번호</th>
            <th>쿠폰 명</th>
            <th>할인가격</th>
            <th>선택</th>
        </tr>
        <c:forEach var="cList" items="${cList}">
        <tr>
            <td>${cList.coupon_num}</td>
            <td>${cList.coupon_name}</td>
            <td>${cList.coupon_pay}</td>
            <td><input type="checkbox" id="choiceCoupon"></td>
        </tr>
        </c:forEach>
    </table>
    <input type="button" value="전송" onclick="setParent()">
    <input type="button" value="창닫기" onclick="window.close()">

</body>
</html>
