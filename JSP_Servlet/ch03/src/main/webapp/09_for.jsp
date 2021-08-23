<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 1 + 2 + 3 .... + 10 = 55 -->
<% 
	int sum1 = 0;

	for(int i = 1 ; i <= 10; i++){
		if (i < 10){ %>
			<%=(i + " + ")%>
		<% } 
		else { %>
			<%=(i + " = ")%>
		<%}
		sum1 += i;
	}%>
		
		
	<%=sum1%>
	
<br/>	
<% 
	int sum2 = 0;

	for(int i = 1 ; i <= 10; i++){
		if (i < 10){
			out.println(i + " + ");
		} 
		else {
			out.println(i + " = ");
		}
		sum2 += i;
	}
		
		
	out.println(sum2);
%>


</body>
</html>