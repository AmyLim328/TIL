<%@ page 
info = "Copyright"
language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- page
	: 페이지 그 자체 나타내는 객체
	: this 키워드 이용
 -->
<%
	String pageInfo = this.getServletInfo();
	out.println(pageInfo);
%>
</body>
</html>