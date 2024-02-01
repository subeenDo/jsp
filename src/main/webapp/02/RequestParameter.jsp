<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장객체 - request</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");//한글깨짐 방지설정
        String id = request.getParameter("id");
        String sex = request.getParameter("sex"); //2개의 값 중 하나만 받아서 배열저장 ㄴㄴ
        String[] favo = request.getParameterValues("favo"); //여러개의 값을 받을 수 있기 때문에 배열 저장
        String favoStr = "";
        //["eco", "pol", "ent"]

        if(favo != null){
            for(int i = 0; i<favo.length; i++) {
                favoStr += favo[i]+ " ";

            }
        }
        String intro = request.getParameter("intro").replace("\r\n", "<br/>");
        //replace("\r\n", "<br/>"); -> 자바코드 (\r\n) html코드(br)로 변경
    %>
    <ul>
        <li>아이디 : <%=id%></li>
        <li>성별 : <%=sex%></li>
        <li>관심사 : <%=favoStr%></li>
        <li>자기소개 : <%=intro%></li>
    </ul>
</body>
</html>
