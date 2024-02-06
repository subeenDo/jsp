<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
<%--    String pVal = "방랑시인";--%>
<%--%>--%>

<html>
<head>
    <meta charset="UTF-8">
    <title>액션태그 - param</title>
</head>
<body>
<h2>포워드 된 페이지에서 매개변수 확인</h2>
    <jsp:useBean id="person" class="com.common.Person" scope="request"/>
<ul>
    <li><jsp:getProperty name="person" property="name"/></li>
    <li><jsp:getProperty name="person" property="age"/></li>
    <li>본명 : <%=request.getParameter("param1")%></li>
    <li>출생 : <%=request.getParameter("param2")%></li>
    <li>특징 : <%=request.getParameter("param3")%></li>
</ul>

<jsp:include page="ParamInclude.jsp">
    <jsp:param name="loc1" value="제주도"/>
    <jsp:param name="loc2" value="탐라국"/>
</jsp:include>

</body>
</html>
