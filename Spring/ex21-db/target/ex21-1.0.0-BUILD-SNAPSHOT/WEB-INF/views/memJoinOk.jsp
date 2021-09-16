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
	
	<h1>memJoinOk</h1>
	<!-- ID: ${mem.memId} <br/> -->
	<!-- JSTL에서 사용하면 자동으로 getter 호출 -->
	
	ID: ${mem.getMemId()} <br/>
	
	PassWord: ${mem.memPw} <br/>
	Mail: ${mem.memMail} <br/>
	Phone: ${mem.memPhone1}-${mem.memPhone2}-${mem.memPhone3} <br/>
	 
	<P>  The time on the server is ${serverTime}. </P> 
	<a href="/ex21/resources/html/index.html">Go to Main</a>
</body>
</html>