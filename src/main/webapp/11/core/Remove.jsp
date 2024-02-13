<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 변수선언--%>
<c:set var="scopeVar" value="Page Value"/>
<c:set var="scopeVar" value="Request Value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Remove</title>
</head>
<body>
  <h2>출력</h2>
    <ul>
    <li>scopeVar : ${scopeVar}</li>
    <li>request scopeVar : ${scopeVar}</li>
    <li>session scopeVar : ${sessionScope.scopeVar}</li>
    <li>application scopeVar : ${applicationScope.scopeVar}</li>
  </ul>
  <h2>session영역에서 삭제</h2>
    <c:remove var="scopeVar" scope="session"/>
    <ul>
      <li>session scopeVar : ${sessionScope.scopeVar}</li>
    </ul>

  <h2>scope 지정 없이 삭제</h2>
    <c:remove var="scopeVar"/>
    <li>scopeVar : ${scopeVar}</li>
    <li>request scopeVar : ${scopeVar}</li>
    <li>application scopeVar : ${applicationScope.scopeVar}</li>
</body>
</html>
