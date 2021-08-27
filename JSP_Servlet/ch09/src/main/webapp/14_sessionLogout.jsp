<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	session.invalidate();
%>
<script>
	alert("Logout!");
	location.href = "11_sessionLogin.jsp"; 
	// 로그인 시도 페이지 이동 
</script>

</body>
</html>