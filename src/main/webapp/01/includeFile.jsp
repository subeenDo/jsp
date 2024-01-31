<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import =" java.time.LocalDate"%>
<%@ page import =" java.time.LocalDateTime"%>

<%
   LocalDate today = LocalDate.now(); //오늘 날짜
    LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); //내일날짜
%>
