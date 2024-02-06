<%@ page import="com.membership.MemberDAO" %>
<%@ page import="com.membership.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  //로그인 폼에서 받아온 파라미터
  String userId = request.getParameter("user_id");
  String usePwd = request.getParameter("user_pwd");
  System.out.println("파라미터 확인 :: " + userId +":: "+ usePwd);// 오류 추적과정 1 잘 받아왔는지 확인

  MemberDAO dao = new MemberDAO();
  MemberDTO memberDTO =dao.getMemberDTO(userId, usePwd);
  dao.close();
  
  //로그인 성공 여부에 따른 처리
  
  if(memberDTO.getId() != null) { //오류 추적과정 3 여기가 잘못됨 ==null-> !=null
    
    //로그인 성공
    session.setAttribute("UserId", memberDTO.getId());
    session.setAttribute("UserName", memberDTO.getName());
    response.sendRedirect("LoginForm.jsp");
    
  }else {
    //로그인 실패
    request.setAttribute("LoginErrMsg", "아이디/ 패스워드를 확인하세요");
    request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
  }
  
%>
