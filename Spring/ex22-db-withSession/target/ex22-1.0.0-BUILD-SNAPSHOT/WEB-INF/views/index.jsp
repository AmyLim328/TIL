<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Main</h1>
	
	<c:if test="${empty member}">
		<a href="/ex22/member/memJoinForm">JOIN</a> &nbsp;&nbsp; 
		<a href="/ex22/member/memLoginForm">LOGIN</a> &nbsp;&nbsp; 
	</c:if>
	
	<c:if test="${!empty member}">
		<a href="/ex22/member/memLogout">LOGOUT</a> &nbsp;&nbsp; 
		<a href="/ex22/member/memModifyForm">MODIFY</a> &nbsp;&nbsp; 
		<a href="/ex22/member/memDeleteForm">DELETE</a> &nbsp;&nbsp; 
	</c:if>
</body>
</html>