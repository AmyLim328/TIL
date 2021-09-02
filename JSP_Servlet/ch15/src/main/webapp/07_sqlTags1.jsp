<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:setDataSource
   url="jdbc:oracle:thin:@localhost:1521:xe"
   driver="oracle.jdbc.driver.OracleDriver" user="scott" password="tiger" var="db"
   scope="application" />
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
	<sql:param value="${'MILAN'}"/>
	<sql:param value="${40}"/>
</sql:update>

<hr/>

<sql:query var="lists" dataSource="${db}">
select deptno, dname, loc from dept
</sql:query>

<c:forEach var="element" items="${lists.rows}">
${element} <br/>
</c:forEach>
</body>
</html>