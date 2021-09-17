<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<hr/>
<% 
	String email = request.getParameter("adminEmail");
	// 7번 페이지에서 사용자 입력한 값
%>
Include Action Tag의 Bottom 부분<br/>
<b><%=email%></b>


</body>
</html>