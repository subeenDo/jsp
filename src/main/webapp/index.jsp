<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP Project</title>
    <%!
        String str1 = "JSP";
        String str2 = "뉴진스";
    %>
</head>
<body>
<h2>저기요</h2>
<br/>
    <p>
        <%
            out.println (str1+"하려면 어떻게 하죠?</br>");
            out.println (str2+"의 Hype Boy요");
        %>

    </p>
</body>
</html>