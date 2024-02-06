<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%
        SimpleDateFormat dataFormat = new SimpleDateFormat("YYYY-MM-DD HH:mm:ss");
        long creationTime = session.getCreationTime();//세션 생성 시간
        String creationTimeStr = dataFormat.format(new Date(creationTime));

        long lastTime = session.getLastAccessedTime();// 마지막 요청 시간
        String lastTimeStr = dataFormat.format(new Date(lastTime));
    %>


</head>
<body>
 <h2>Session 설정 확인</h2>

<ul>
    <li> 세션 유지 시간 <%=session.getMaxInactiveInterval()%></li>
    <li> 세션 아이디 <%=session.getId()%></li>
    <li>  최초 요청 시간 <%=creationTimeStr%></li>
    <li>  마지막 요청 시간 <%=lastTimeStr%></li>
</ul>
</body>
</html>
