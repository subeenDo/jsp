<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - set 2</title>
</head>
<body>
  <h2>List 컬렉션</h2>
  <%
    ArrayList<Person> plist = new ArrayList<>();
    plist.add(new Person("성삼문", 50));
    plist.add(new Person("박팽년", 60));
  %>
  <c:set var="personList" value="<%=plist%>" scope="request"/>
  <ul>
    <li>이름 : ${requestScope.personList[0].name}</li>
    <li>나이 : ${personList[1].age}</li>
  </ul>

  <h2>Map 컬렉션</h2>
  <%
    Map<String, Person> pMap = new HashMap<>();
    pMap.put("personArg1", new Person("칠복이", 55));
    pMap.put("personArg2", new Person("팔복이", 65));
  %>
  <c:set var="personMap" value="<%=pMap%>" scope="request"/>
  <ul>
    <li>이름 : ${requestScope.personMap.personArg2.name}</li>
    <li>나이 : ${personMap.personArg2.age}</li>
  </ul>
</body>
</html>
