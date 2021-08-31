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
	session.invalidate(); // 현재 클라이언트 세션 제거
	response.sendRedirect("03_login.jsp");
	// 로그인 시도 페이지로 넘어감
%>
</body>
</html>