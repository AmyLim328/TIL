<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" 
class="ex01.RegisterMgrPool"/>
<!-- loginRegister(id, pwd)
	: 테이블에 아이디, 패스워드가 존재하는지 체크
	: true/false 반환
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = "";
	String pwd = "";
	
	if(request.getParameter("id") != null){
		id = request.getParameter("id");
	}
	if(request.getParameter("pwd") != null){
		pwd = request.getParameter("pwd");
	}
	if(regMgr.loginRegister(id, pwd)){
		session.setAttribute("idKey", id);
%>
	<script>
		alert("Successfully logged in!!");
		location.href = "13_sessionLoginOK.jsp";
	</script>
	
	<%
	}else{ %>
	<script>
		alert("Login has failed!!");
		location.href = "11_sessionLogin.jsp";
	</script>
	<% } %>
	
	
</body>
</html>