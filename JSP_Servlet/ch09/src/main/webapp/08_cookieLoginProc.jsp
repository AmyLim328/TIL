<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="regMgr" class="ex01.RegisterMgrPool" />
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
		Cookie cookie = new Cookie("idKey", id);
		// id를 쿠키에 담음
		response.addCookie(cookie);
%>
	<script>
		alert("Successfully logged in!");
		location.href = "09_cookieLoginOK.jsp";
	</script>
	<%
	}
	else { %>
	<script>
		alert("Login has failed!");
		location.href = "07_cookieLogin.jsp";
	</script>
	<%	
	}
	%>
</body>
</html>