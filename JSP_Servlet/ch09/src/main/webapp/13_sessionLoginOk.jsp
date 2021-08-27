<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 7, 8번 페이지에서 9번으로 올 때
쿠키 정보 만료가 될 수 있음 (한번 더 확인!) 
	1) 7 -> 9 (이전 로그인했던 사람, 쿠키에 id 저장, 자동 로그인)
	2) 7 -> 8 -> 9 (새롭게 로그인 시도)
-->
	<%
		String id 
		= (String)session.getAttribute("idKey");
	
		if(id == null){ %>
			<script>
				alert("Login has failed!");
				location.href = "11_sessionLogin.jsp";
			</script>
		<%  }
	
	%>

	<h2 align="center">Cookie Login</h2>
	<table width="300" border="1" align="center">
		<tr>
			<td colspan="2" align="center"><b>Log On Page</b></td>
		</tr>
		<tr>
			<td align="center"><b><%=id%></b> has logged in</td>
			<td align="center"><a href="14_sessionLogout.jsp">Logout</a></td>
		</tr>
	</table>
</body>
</html>