<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cookie Result</title>
</head>
<body>
<%
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
        for (Cookie c : cookies) {
            String cName = c.getName();
            String cValue = c.getValue();

            out.println(String.format("%s : %s<br/>", cName, cValue));
        }
    }
%>
</body>
</html>
