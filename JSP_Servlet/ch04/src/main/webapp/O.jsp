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

	//A, B, O, AB
	String bt 
	= request.getParameter("bt");

	String text 
	= request.getParameter("text");

%>
<h1><%=text%></h1>
<h2><%=bt%>형</h2>
열정적임

</body>
</html>