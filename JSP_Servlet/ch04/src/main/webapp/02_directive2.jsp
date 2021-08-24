<%@ page info="Copyright 2021 by Sally"
language="java" 
contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"

session="true"
buffer="16kb"
autoFlush="true"
isThreadSafe="true"
errorPage="03_error.jsp"
%>

<!-- 
contentType charset
: client 웹브라우저가 받아볼 페이지의 인코딩 방식

pageEncoding
: jsp 페이지에 기록된 소스코드 자체의 인코딩 방식
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Directive Example</h1>
<%=this.getServletInfo()%>
<!-- page info 출력 -->
<!-- 이 부분이 출력되지 않음
	one/zero 부분에서 예외 발생
	예외를 핸들링해주는 03_error.jsp 내부적으로 실행
 -->

<!-- 해당 페이지에 error 발생 시킴
     현재 페이지에서 error handling X
     error page로 이동 -->
<% 
	int one = 1;
	int zero = 0;

%>
<%= one/zero %>

</body>
</html>