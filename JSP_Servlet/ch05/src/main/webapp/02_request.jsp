<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	// 요청된 값들의 인코딩 타입을 한국어 인식
	
	String name = request.getParameter("name");
	String stuNum = request.getParameter("stuNum");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");

	
	if(gender.equals("male")){
		gender = "남자";
	}
	else {
		gender = "여자";
	}
%>
<h1>Request Example</h1>
이름: <%=name%><br/>
학번: <%=stuNum%><br/>
성별: <%=gender%><br/>
학과: <%=major%><br/> 
</body>
</html>