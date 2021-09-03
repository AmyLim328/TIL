<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
id: ${param.id}<br/>
id: ${param["id"]}<br/>

pwd: ${param.pwd}<br/>
pwd: ${param["pwd"]}<br/>
<!-- 대괄호 용법은 속성 이름에 
특수문자가 있을 경우에 주로 사용 -->
</body>
</html>