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

	if(cookies != null){
		for(int i = 0; i < cookies.length; i++){
			if(cookies[i].getName().equals("idKey")){
				cookies[i].setMaxAge(0);
				// 쿠키의 생명 주기를 0으로 만듦 (쿠키 만료)
				response.addCookie(cookies[i]);
				// 응답객체에게 쿠키의 만료를 알려줌

			}
		}
	}
%>
	<script>
	alert("Logout!")
	location.href = "07_cookieLogin.jsp";
	// 로그인 시도 페이지 이동
</script>
</body>
</html>