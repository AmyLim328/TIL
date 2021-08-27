<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Cookie[] cookies = request.getCookies();
	String name = "";
	String id = "";

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("idKey")) {
			name = cookies[i].getName();
			// idKey
			id = cookies[i].getValue();
			// id (admin)
			}
		}
		if (!id.equals("")) {
%>
	<script>
		alert("Successfully logged in!");
		location.href = "09_cookieLoginOK.jsp"
	</script>
<%
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="script.js"></script>
</head>
<body>

	<h2 align="center">Cookie Login</h2>
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
				<td colspan="2" align="center"><input type="submit"
					value="login" onclick='loginCheck("08_cookieLoginProc.jsp")'>
					<input type="reset" value="reset"></td>
			</tr>
		</table>
	</form>
</body>
</html>