<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	pageContext.setAttribute("msg", "hello world!");
	// pageContext: jsp ���� ��ü
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- JSP ǥ����
 ���� ���� ���� null ���
 -->
<%= request.getAttribute("sum") %><br/>
<%= pageContext.getAttribute("msg") %><br/>
<%= session.getAttribute("id") %><br/>
<%= application.getAttribute("name") %><br/>
////////////////////////////////////////<br/>
<!-- EL ǥ���� 
���� ���� ���� ���ڿ� ("") ���
 -->
${requestScope.sum}<br/>
${pageScope.msg}<br/>
<!-- pageScope: el ���� ��ü -->
${sessionScope.id}<br/>
${applicationScope.name}
</body>
</html>