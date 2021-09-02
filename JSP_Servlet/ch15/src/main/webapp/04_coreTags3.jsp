<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String str1[] = {"a", "b", "c"};
	String str2 = "a, b; c";
	// 스크립트릿 선언 변수

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="arr" value="<%=str1%>" scope="page"/>
<c:forEach var="element" items="${arr}"
begin="0" step="1" end="2">
	${element} <br/>
</c:forEach>
<hr/>
<c:set var="str" value="<%=str2%>" scope="page"/>
<c:forTokens var="sttoken" items="${str}" delims=", ;">
	${sttoken} <br/>
</c:forTokens>
<hr/>
<!-- include action tag와 함께 결과 포함 -->
<c:import url="http://Localhost:8000/ch15/03_coreTags2.jsp">
	<c:param name="id" value="admin"/>
	<c:param name="color" value="blue"/>
</c:import>
<hr/>
<c:url var="url" value="http://www.google.com/search">
	<c:param name="q" value="jsp"/>
</c:url>
<a href="${url}">구글에서 jsp 검색</a>
<hr/>
<%--<c:redirect url="http://www.oracle.com"/> --%>
<!-- response.sendRedirect()
현재 페이지가 무시되고 페이지 전환
(forward action tag (+ 사용자 request 정보 O)
(redirect tag (+ 사용자 request 정보 X)
 -->
</body>
</html>