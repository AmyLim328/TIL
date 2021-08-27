<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Cookie[] cookies = request.getCookies();
	// 클라이언트의 모든 쿠키를 읽음

	String id = "";

	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getName().equals("idKey")) {
				id = cookies[i].getValue();
			}
		}

		// 초기화된 그대로 (쿠키에 담긴 아이디가 없음)
		if (id.equals("")) {
%>
	<script>
		alert("Login has failed!");
		location.href = "07_cookieLogin.jsp";
	</script>
	<%
	}
}
	%>
	<h2 align="center">Cookie Login</h2>
	<table width="300" border="1" align="center">
		<tr>
			<td colspan="2" align="center"><b>Log On Page</b></td>
		</tr>
		<tr>
			<td align="center"><b><%=id%></b> has logged in</td>
			<td align="center"><a href="10_cookieLogout.jsp">Logout</a></td>
		</tr>
	</table>
</body>
</html>