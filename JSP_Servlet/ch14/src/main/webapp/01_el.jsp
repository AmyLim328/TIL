<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page isELIgnored="true" %>
<%-- EL 문법이 무시되어서 텍스트로 처리 --%>
<%
	request.setAttribute("msg", "This is EL");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>EL Test</title>
</head>
<body>
${msg}
</body>
</html>