<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="script.js"></script>
</head>
<body>
<% 
	String id = (String)session.getAttribute("idKey");
	if(id != null) { // 이미 로그인한 적이 있는 사용자라면
		%>
		<script>
			alert("Successfully logged in!");
			location.href = "13_sessionLoginOK.jsp";
		</script>
	<% }

%>
	<h2 align="center">Session Login</h2>
	<form name="login" method="post">
		<table width="300" border="1" align="center">
			<tr>
				<td colspan="2" align="center"><b>Log in</b></td>
			</tr>
			<tr>
				<td width="47%" align="center">ID</td>
				<td width="53%" align="center"><input name="id"></td>
			</tr>
			<tr>
				<td align="center">PWD</td>
				<td align="center"><input name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				   <input type="submit" value="login" onclick='loginCheck("12_sessionLoginProc.jsp")'>
			       <input type="reset" value="reset">
			     </td>
			</tr>
		</table>
	</form>
</body>
</html>