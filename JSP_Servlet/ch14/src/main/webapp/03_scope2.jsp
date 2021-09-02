<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	pageContext.setAttribute("msg", "hello world!");
	// pageContext: jsp 내장 객체
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- JSP 표현식
 값이 없을 때는 null 출력
 -->
<%= request.getAttribute("sum") %><br/>
<%= pageContext.getAttribute("msg") %><br/>
<%= session.getAttribute("id") %><br/>
<%= application.getAttribute("name") %><br/>
////////////////////////////////////////<br/>
<!-- EL 표현식 
값이 없을 때는 문자열 ("") 출력
 -->
${requestScope.sum}<br/>
${pageScope.msg}<br/>
<!-- pageScope: el 내장 객체 -->
${sessionScope.id}<br/>
${applicationScope.name}
</body>
</html>