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
	<h1> memModify (After Modify) </h1>
	<!-- ID: ${mem.memId} <br/> -->
	<!-- JSTL에서 사용하면 자동으로 getter 호출 -->
	
	ID: ${memAft.getMemId()} <br/>
	
	PW: ${memAft.memPw} <br/>
	Mail: ${memAft.memMail} <br/>
	Phone: ${memAft.memPhone1}-${memAft.memPhone2}-${memAft.memPhone3} <br/>
	 
	<P>  The time on the server is ${serverTime}. </P>
	<a href="/ex22">Go to Main</a>
</body>
</html>