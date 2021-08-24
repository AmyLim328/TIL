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
%>

<!-- 포워딩 전의 내용 출력 X -->
<h1>Forward Tag Example</h1>
Forward Tag 포워딩 전의 페이지

<jsp:forward page="13_forwardTag1_2.jsp" />
<!-- forward action tag를 통해 13번으로 넘어감
	11.html에서 입력한 데이터 값을 12번으로 보냈다가
	12번의 forward action tag를 통해
	13번으로 입력한 데이터 값을 같이 보냄
 -->
 
<%--<jsp:param>--%>
<!-- 클라이언트 전달한 데이터와는 별도로
추가적인 값을 생성하는 태그 -->

</body>
</html>