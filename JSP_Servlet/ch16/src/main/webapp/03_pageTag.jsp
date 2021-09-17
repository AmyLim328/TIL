<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="tag" 
uri="/WEB-INF/tlds/PageTag.tld"%>    
<%
	int start = 1;
	int end = 10;
	int nowPage = 1;
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt
				(request.getParameter("nowPage"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
현재 페이지 : <b><%= nowPage %></b>
<tag:page from='<%=start%>' to='<%=end%>'/>
</body>
</html>