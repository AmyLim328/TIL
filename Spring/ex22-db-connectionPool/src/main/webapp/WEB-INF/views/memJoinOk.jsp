<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
	
	ID: ${member.getMemId()} <br/>
	PW: ${member.memPw} <br/>
	Mail: ${member.memMail} <br/>
	Phone: ${member.memPhone1}-${member.memPhone2}-${member.memPhone3} <br/>
	 
	<P>  The time on the server is ${serverTime}. </P> 
	<a href="${cp}">Go to Main</a>
</body>
</html>