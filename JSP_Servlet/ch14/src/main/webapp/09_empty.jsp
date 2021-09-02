<%@ page contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Empty</h2>
name의 요청 여부 : <b>${empty param.name}</b><br/>
<!-- empty 연산자를 통해 요청된 name 속성 값 유무 판단 
param.name이 null일 경우 true 반환
param.name이 null이 아닐 경우 false 반환 -->
<a href="09_empty.jsp?name=sally">name값이 있는 요청</a> || 
<a href="09_empty.jsp">name값이 없는 요청</a>
</body>
</html>