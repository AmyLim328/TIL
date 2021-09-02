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
<!-- 빈 문자열, null, 0 ==> false -->
 
<c:if test="${param.id != ''}">
	${param.id}
</c:if>
<c:if test="${param.id == ''}">
	Guest
</c:if>

<c:choose>
	<c:when test="${param.color == 'yellow'}">
		노란색입니다!
	</c:when>
	<c:when test="${param.color == 'blue'}">
		파란색입니다!
	</c:when>
	<c:when test="${param.color == 'orange'}">
		주황색입니다!
	</c:when>
	<c:when test="${param.color == 'pink'}">
		분홍색입니다!
	</c:when>
	<c:otherwise>
	선택되지 않았습니다!
	</c:otherwise>
</c:choose>

</body>
</html>