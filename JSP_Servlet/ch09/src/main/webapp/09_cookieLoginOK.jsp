<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<!-- 7, 8번 페이지에서 9번으로 올 때
쿠키 정보 만료가 될 수 있음 (한번 더 확인!) 
	1) 7 -> 9 (이전 로그인했던 사람, 쿠키에 id 저장, 자동 로그인)
	2) 7 -> 8 -> 9 (새롭게 로그인 시도)
-->
	<%
	Cookie[] cookies = request.getCookies();
	// 클라이언트의 모든 쿠키를 읽음
	
	String id = "";
	
	if(cookies != null){
		for(int i = 0; i < cookies.length; i ++){
			if(cookies[i].getName().equals("idKey")){
				id = cookies[i].getValue();
			}
		}
	
	
		// 초기화된 그대로 (쿠키에 담긴 아이디가 없음)
		if(id.equals("")){ %>
	<script>
				alert("로그인 실패!");
				location.href = "07_cookieLogin.jsp";
			</script>
	<%} 
		}%>

	<h2 align="center">Cookie 로그인</h2>
	<table width="300" border="1" align="center">
		<tr>
			<td colspan="2" align="center"><b>Log On Page</b></td>
		</tr>
		<tr>
			<td align="center"><b><%=id%></b>님이 로그인 하셨습니다.</td>
			<td align="center"><a href="10_cookieLogout.jsp">로그아웃</a></td>
		</tr>
	</table>
</body>
</html>