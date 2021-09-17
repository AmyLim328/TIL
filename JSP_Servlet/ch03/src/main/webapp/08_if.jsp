<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<% 
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	String msg;
	
	if(color.equals("blue")){
		msg = "파란색";	
	}
	else if(color.equals("red")){
		msg = "빨간색";
	}
	else if(color.equals("orange")){
		msg = "주황색";
	}
	else if(color.equals("yellow")){
		msg = "노란색";
	}
	else{
		color = "beige";
		msg = "기타색";
	}
	
%>
<body bgcolor="<%=color%>">
<b><%=name%></b>님이 좋아하는 색깔은 <b><%=msg%>입니다.</b>


</body>
</html>