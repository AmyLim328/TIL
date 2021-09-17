<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>File Upload</title>
</head>
<body>
<form name="frmName" method="post"
enctype="multipart/form-data"
action="02_viewPage.jsp">
user <br/>
<input name="user"><br/>
title <br/>
<input name="title"><br/>
file <br/>
<input type="file" name="uploadFile"><br/>
<input type="submit" value="UPLOAD"><br/>
</form>
</body>
</html>