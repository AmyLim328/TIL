<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.driver.OracleDriver" user="scott" password="tiger" var="db"
	scope="application" />

<!-- 연결 정보 application 저장소 db 변수명으로 저장
(웹 실행되는 동안 유지가 되는 변수 == 동일 프로젝트 내에서 공유)
다른 jsp 파일에서는 db 연결 설정 필요없이 사용 가능
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<sql:query var="lists" dataSource="${db}">
select deptno, dname, loc from dept
</sql:query>

<c:forEach var="element" items="${lists.rows}">
${element} <br/>
</c:forEach>

<sql:update dataSource="${db}">
update dept set loc = ? where deptno = ?
	<sql:param value="${'SEOUL'}"/>
	<sql:param value="${40}"/>
</sql:update>

<br/>
<sql:query var="lists" dataSource="${db}">
select deptno, dname, loc from dept
</sql:query>

<c:forEach var="element" items="${lists.rows}">
${element} <br/>
</c:forEach>

</body>
</html>