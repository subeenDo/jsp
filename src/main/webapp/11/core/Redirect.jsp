<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    --%>
    <meta charset="UTF-8">
    <title>JSTL Redirect</title>
</head>
<body>

<c:set var="requestVar" value="MustHave" scope="request"/>
<c:redirect url="OtherPage.jsp" >
    <c:param name="user_param1" value="출판사"/>
    <c:param name="user_param2" value="골든래빗"/>
</c:redirect>
</body>
</html>
