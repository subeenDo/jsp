<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - import</title>
</head>

<%--    외부 파일을 현재 위치에 삽입 할 때 사용--%>
    <c:set var="requestVar" value="MustHave" scope="request"/>
    <c:import url="OtherPage.jsp" var="contents">
        <c:param name="user_param1" value="JSP"/>
        <c:param name="user_param2" value="기본서"/>
    </c:import>

    <h2>다른 문서 삽입하기</h2>
    ${contents}

    <iframe src="GoldPage.jsp" Style="width:100%;height:300px;"></iframe>
</body>
</html>
