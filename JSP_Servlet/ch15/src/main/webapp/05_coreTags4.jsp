<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 예외 처리 기능 (var 속성은 예외 객체 참조 => 오류 메시지 출력) -->
<c:catch var="ex">
<%
	int arr[] = {1, 2, 3};
	int element = arr[3];
%>
</c:catch>
${ex}
<!-- 예외 내용 출력 (발생되지 않으면 출력 안함) -->
</body>
</html>