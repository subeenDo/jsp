<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-01-30
  Time: 오후 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    trimDirectiveWhitespaces="true"
%>
<%--필요한 외부 클래스 임포트--%>
<%@ page import =" java.text.SimpleDateFormat"%>
<%@ page import =" java.util.Date"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        Date today = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String todayStr = dateFormat.format(today);
        out.println("오늘 날짜 : " + todayStr);


    %>
</body>
</html>
