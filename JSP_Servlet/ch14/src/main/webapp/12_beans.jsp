<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="bean" class="ex01.ELBean"/>
<jsp:setProperty name="bean" property="*"/>
<%-- setSiteName(request.getAttribute("siteName")) 호출 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
JSP의 action tag를 이용
<jsp:getProperty name="bean" 
property="siteName"/><br/>
///////////////////////// <br/><br/>

EL 문법 이용 
${pageScope.bean.siteName} <br/>
${bean.siteName} <br/>
<!-- useBean 액션 태그를 통해서 객체 생성
=> pageContext 저장소에 저장됨
=> EL 호출할 때 pageContext 생략 가능
 -->
</body>
</html>