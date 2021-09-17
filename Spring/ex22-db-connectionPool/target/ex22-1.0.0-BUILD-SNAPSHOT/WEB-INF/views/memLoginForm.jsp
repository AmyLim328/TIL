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
<h1>Login</h1>
	<c:if test="${res == 'fail'}">
		<script>
			alert("[WRONG ID/PW] ID/PW IS INCORRECT")
		</script>
	</c:if>
	
	<form action="${cp}/member/memLogin" method="post">
		ID : <input type="text" name="memId" ><br>
		PW : <input type="password" name="memPw" ><br>
		<input type="submit" value="Login" >
	</form>
	<a href="${cp}">Go to Main</a>
</body>
</html>