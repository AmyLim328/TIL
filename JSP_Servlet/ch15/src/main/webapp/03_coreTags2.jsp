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
<!-- �� ���ڿ�, null, 0 ==> false -->
 
<c:if test="${param.id != ''}">
	${param.id}
</c:if>
<c:if test="${param.id == ''}">
	Guest
</c:if>

<c:choose>
	<c:when test="${param.color == 'yellow'}">
		������Դϴ�!
	</c:when>
	<c:when test="${param.color == 'blue'}">
		�Ķ����Դϴ�!
	</c:when>
	<c:when test="${param.color == 'orange'}">
		��Ȳ���Դϴ�!
	</c:when>
	<c:when test="${param.color == 'pink'}">
		��ȫ���Դϴ�!
	</c:when>
	<c:otherwise>
	���õ��� �ʾҽ��ϴ�!
	</c:otherwise>
</c:choose>

</body>
</html>