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
	String id = "admin";
	String pwd = "1234";
	
	session.setAttribute("idKey", id);
	session.setAttribute("pwdKey", pwd);
%>
세션 생성 완료!
<a href="04_viewSessionInfo.jsp">세션 정보 확인</a>
</body>
</html>