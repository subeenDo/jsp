<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String popupMode = "on"; //팝업창 출력 여부

//  쿠키 읽어서 팝업 모드 설정
  Cookie[] cookies = request.getCookies(); //쿠키 받아오기
  if(cookies!= null){
    for (Cookie c : cookies) {
      String cookieName = c.getName();
      String cookieValue = c.getValue();
      if(cookieName.equals("PopupClose")){
        popupMode = cookieValue;
        System.out.print(popupMode);
      }
    }
  }
%>

<html>
<head>
   <title>popupMain</title>
    <style>
    div#popup{
      position: absolute; top: 100px; left: 50px; color: yellow;
      width: 270px; height: 100px; background-color: gray;
    }
    div#popup>div{
      position: relative;background-color: #fff; top: 0px;
      border:1px solid gray; padding-top: 10px; color: black;
    }

    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  </head>
  <body>
  <h2> 팝업 메인 페이지</h2>
  <%
    for(int i = 0; i < 10; i++){
      out.println("현재 팝업창은 " + popupMode + "상태입니다<br/>");
    }

    if(popupMode.equals("on")){
  %>
  <%-- 여기에 스크립트를 넣어서 하지만 그렇게 하면 복잡하니까 자바코드 만들어줌 - JSFunction--%>
  <div id="popup">
    <h2 align="center">공지사항 팝업</h2>
    <div align="right">
      <form name="popFrm">
        <input type="checkbox" id="inactiveToday" value="1"/>
        하루동안 열지않음
        <input type="button" value="닫기" id="closeBtn">
      </form>
    </div>
  </div>
  <%
    }
  %>
  <script>
    $("#closeBtn").click(function(){
      $("#popup").hide();

      var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
      if(chkVal == 1){
        $.ajax({
          url : './PopUpCookie.jsp',
          type : 'get',
          data: {inactiveToday : chkVal},
          dataType:"text",
          success : function(res){ //요청이 성공했을 때 동작할 코드
            if(res!=""){
              location.reload();
            }
          }
        })
      }
    });
  </script>
  </body>
</html>
