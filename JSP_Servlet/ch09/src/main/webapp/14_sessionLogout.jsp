<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	session.invalidate();
%>
<script>
	alert("로그아웃!");
	location.href = "11_sessionLogin.jsp"; 
	// 로그인 시도 페이지 이동
</script>

</body>
</html>