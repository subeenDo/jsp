<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - choose/when/otherwise</title>
</head>
<body>
<%--    다중 조건을 판단할 때 사용--%>
<%--    <c:choose>--%>
<%--       <c:when test="조건1">조건 1 만족하는 경우</c:when>--%>
<%--       <c:when test="조건2">조건 2 만족하는 경우</c:when>--%>
<%--        <c:otherwise>조건 1 만족하는 경우</c:otherwise>--%>
<%--    </c:choose>--%>

<%--변수 선언--%>
<c:set var="number" value="100"/>
<h2>choose 태그로 홀짝 판단</h2>
<c:choose>
    <c:when test="${number %2 ==0}">
        ${number}는 짝수입니다.
    </c:when>
    <c:otherwise>
        ${number}는 홀수입니다.`
    </c:otherwise>
</c:choose>
<h2>국,영,수 점수를 입력하면 평균을 내어 학점 출력</h2>
<form>
    국어 : <input type="text" name="kor"><br/>
    영어 : <input type="text" name="eng"><br/>
    수학 : <input type="text" name="math"><br/>
    <input type="submit" value="학점구하기"><br/>
</form>
<%--모든 과목 점수가 입력되었는지 확인--%>
<c:if test="${!(empty param.kor or empty param.eng or empty param.math )}">
<%--    평균 계산--%>
    <c:set var="average" value="${(param.kor + param.eng + param.math)/3}"/>
        평균 점수는 ${average}으로
        <c:choose>
                <c:when test="${average >= 90}">A 학점</c:when>
                <c:when test="${average >= 80}">B 학점</c:when>
                <c:when test="${average ge 70}">C 학점</c:when>
                <c:when test="${average ge 60}">D 학점</c:when>
                <c:otherwise>F 학점</c:otherwise>
        </c:choose>
        입니다
</c:if>



</body>
</html>
