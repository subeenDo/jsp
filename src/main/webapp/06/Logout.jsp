<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  //1번 방법 : 세션에 있는 user 정보 삭제
//  session.removeAttribute("UserId");
//  session.removeAttribute("UserName");

  //2번 방법 : 세션 모든 속성 삭제 -> 세션 파괴 (value값 바뀜)
  session.invalidate();
  response.sendRedirect("LoginForm.jsp");


%>
