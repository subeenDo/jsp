<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>OtherPage.jsp</title>
</head>
<body>
    <h4>OtherPage.jsp</h4>
    <ul>
            <li>저장된 값 : ${requestVar}</li>
            <li>매개변수 1 : ${param.user_param1}</li>
            <li>매개변수 2 : ${param.user_param2}</li>

    </ul>
</body>
</html>
