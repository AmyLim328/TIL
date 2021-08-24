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
	// 14번에서 입력한 사용자 데이터를 받는 부분

	String text 
	= request.getParameter("text");
	// 15번에서 추가적인 매개변수를 받는 부분

%>
<h1><%=text%></h1>
<h2><%=bt%>형</h2>
꼼꼼하고 신중하며 배려심있음

</body>
</html>