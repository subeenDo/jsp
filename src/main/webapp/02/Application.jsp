<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>내장객체 - Application</title>
</head>
<body>

 <h2>web.xml에 설정한 내용 읽어오기</h2>
초기화 매개변수 : <%= application.getInitParameter("INIT_PARAM")%>

<h2>서버 물리적 경로 가져오기</h2>
application 내장객체 : <%= application.getRealPath("/02")%>

<h2>선언부에서 내장객체 사용하기</h2>
<%!
    public String useImplictObject(){
        return this.getServletContext().getRealPath("/02");
    }

    public String useImplictObject(ServletContext app){
        return app.getRealPath("/02");
    }
%>

<ul>
    <li>this 사용 : <%=useImplictObject()%></li>
    <li>내장 객체를 피라미터로 전달 : <%=useImplictObject(application)%></li>
</ul>

</body>
</html>
