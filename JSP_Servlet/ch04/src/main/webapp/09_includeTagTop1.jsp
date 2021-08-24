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
	String name = request.getParameter("name");
	// 7번 페이지에서 사용자 입력한 값
%>
Include Action Tag의 Top 부분<br/>
<b><%=name%> Fighting!!</b>
<hr/>

</body>
</html>