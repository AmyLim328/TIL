<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> memLoginOk </h1>

	ID : ${mem.memId}<br />
	PW : ${mem.memPw}<br />
	
	<P>  The time on the server is ${serverTime}. </P>
	<a href="/ex21/resources/html/index.html">Go to Main</a>
	<a href="/ex21/member/memLogout">Logout</a>
</body>
</html>