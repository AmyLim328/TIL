<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    
isErrorPage="true"%>
<!-- 에러 페이지로 지정 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Error Page</h1>
다음과 같은 예외 발생! <br/>
<%= exception.getMessage() %>
<!-- 예외가 발생한 페이지의 예외 메시지 출력 
	* exception: isErrorPage="true"
	(현재 내 페이지가 error page일 때
	만들어지는 내부 객체)
-->
</body>
</html>