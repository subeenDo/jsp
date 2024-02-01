<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String id = request.getParameter("user_id");
        String pwd = request.getParameter("user_pwd");

        //db와 연결을 아직 공부 안해서 그냥 id pw 값을 넣어줌
        if(id.equalsIgnoreCase("must") && pwd.equals("1234")){
            response.sendRedirect("ResponseWelcome.jsp");
        }else{
            request.getRequestDispatcher("ResponseMain.jsp?loginErr=1")
                    .forward(request, response);
        }
    %>
</body>
</html>
