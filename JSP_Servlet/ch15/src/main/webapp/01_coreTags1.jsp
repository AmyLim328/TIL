<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String str1 = "JSTL";
	String str2 = null;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="str3" value="JSP" scope="page"/>
<!-- page 저장소에 str3=JSP ==> EL 문법 사용 가능! -->

<c:out value="<%=str1%>" default="default"/> <br/>
<c:out value="<%=str2%>" default="default"/> <br/>
<c:out value="${str3}" default="default"/> <br/>

<c:remove var="str3"/>

${str3} ...! <br/>
<!-- EL 문법으로 변수에 데이터가 없을 때 (null)는 빈 문자열("") 출력 -->

</body>
</html>