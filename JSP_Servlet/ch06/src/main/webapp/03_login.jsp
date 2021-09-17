<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Servlet 세션</h1>
<form method="post" action="./ex03/LoginServlet">
id : <input name="id"><br/>
pwd : <input type="password" name="pwd"><br/>
<input type="submit" value="login">
</form>

<%
	out.println(application.getRealPath("/") + "<br/>");
	out.println(application.getRealPath("./ex03/LoginServlet.java") + "<br/>");

%>

</body>
</html>