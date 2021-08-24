<%@ page language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String str = response.getCharacterEncoding();
%>
<h1>Redirect</h1>
<%=str%>
</body>
</html>