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
			alert("[WRONG ID] ID IS INCORRECT")
		</script>
	</c:if>
	
	<h1>Member Modify</h1>
	<form action="${cp}/member/memModify" method="post">
		ID : <input type="text" name="memId" ><br />
		PW : <input type="password" name="memPw" ><br />
		MAIL : <input type="text" name="memMail" ><br />
		PHONE : <input type="text" name="memPhone1" maxlength="3" size="5"> -
				<input type="text" name="memPhone2" maxlength="4" size="5"> -
				<input type="text" name="memPhone3" maxlength="4" size="5"><br />
		<input type="submit" value="Modify" >
		<input type="reset" value="Cancel" >
	</form>
	<a href="${cp}">Go to Main</a>
</body>
</html>