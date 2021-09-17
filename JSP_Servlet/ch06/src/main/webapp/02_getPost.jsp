<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Post Servlet 방식</h1>
<form method="post" 
action="./ex02/GetPostServlet">
id : <input name="id"> <br/>
pwd : <input type="password" name="pwd"> <br/>
email : <input type="email" name="email"> <br/>
<input type="submit" value="join">
</form>
</body>
</html>