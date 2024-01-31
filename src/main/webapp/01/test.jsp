<%--
  Created by IntelliJ IDEA.
  User: it
  Date: 2024-01-30
  Time: 오후 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String str1 = "JSP";
    String str2 = "안녕하세요";
%>
<%--
<%@ %> 지시어
    > JSP페이지를 자바 코드로 변환하는데 필요한 정보를 JSP엔진에 알려준다.
    보통 스크립트 언어, 인코딩 방식 설정
    page 지시어 : jsp페이지에 대한 정보 설정
    include 지시어 : 현재 페이지에 외부페이지를 포함시킨다.
    taglib 지시어 : 표현 언어에서 사용할 JSTL, 자바 사용
<%! %> 스크립트요소 (선언부)
    > 표현식이나, 스크립트를릿에서 사용할 멤버 변수, 메소드를 선언한다
     서블릿으로 변환시에 jspService() 메서드 외부에 선언된다.

<% %> 스크립트요소 (스크립틀릿)
    >JSP페이지가 요청을 받아서 실행될 때  동작해야 할 코드를 지정하는 영역
    _jspService() 내부에 기술된다.
    자바에서는 메소드 내부에 또 다르 메서드를 선언하는게 불가능
<%= %> 스크립트요소 (표현식)ㅇ)
    >실행 결과로 하나의 값이 남는 문장
    싱수, 변수, 수식, 메서드 변환값
--%>
<html>
<head>
    <title>Hello JSP</title>
</head>
<body>
    <h2>처음 만드는 <%=str1%></h2>
<p>
    <%
        out.println(str2+str1+"입니다. 열심히 공부합시다");
    %>

</p>
</body>
</html>
