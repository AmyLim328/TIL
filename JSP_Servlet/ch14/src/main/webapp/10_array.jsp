<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%
	String arr[] = {"JAVA", "JSP", "Servlet"};
	pageContext.setAttribute("arr", arr);
	
	ArrayList<String> list 
	= new ArrayList<String>();
	
	for(int i = 0; i < arr.length; i++){
		list.add(arr[i]);
	}
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
${pageScope.arr[0]}<br/>
<!-- pageScope 생략 가능! -->
${arr[1]}<br/>
${arr[2]}<br/>
${list[0]}<br/>
${list[1]}<br/>
${list[2]}<br/>
</body>
</html>