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
	<c:if test="${res == 'fail'}">
		<script>
			alert("[WRONG ID/PW] ID/PW IS INCORRECT")
		</script>
	</c:if>
	
	<h1>Member Modify</h1>
	<form action="/ex22/member/memModify" method="post">
		ID : <input type="text" name="memId" ><br />
		PW : <input type="password" name="memPw" ><br />
		MAIL : <input type="text" name="memMail" ><br />
		PHONE : <input type="text" name="memPhone1" size="5"> -
				<input type="text" name="memPhone2" size="5"> -
				<input type="text" name="memPhone3" size="5"><br />
		<input type="submit" value="Modify" >
		<input type="reset" value="Cancel" >
	</form>
	<a href="/ex22">Go to Main</a>
</body>
</html>