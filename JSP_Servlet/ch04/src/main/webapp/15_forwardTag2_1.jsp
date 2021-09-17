<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	// 혈액형별 페이지로 내부적으로 넘어감
	// 외부적으로 실행되는 페이지는 15.jsp

	// A, B, O, AB
	String bt 
	= request.getParameter("bt");

	String text = "성격 유형 테스트";
	
%>

<jsp:forward page='<%=bt + ".jsp"%>'>
	<jsp:param name="text" value="<%=text%>" />
</jsp:forward>

<%-- forward 같은 경우에는 url은 15번 페이지로 유지된 채로
15번의 제어권을 A,AB,B,O.jsp 페이지로 넘여주는 거기 때문에
현재 15번 페이지에서 인코딩 방법을 설정해줘야 함 --%>

<%-- A/AB/B/O.jsp forward (+ "성격 유형 테스트")

사용자 데이터 외의 추가 파라미터 전달 --%>

</body>
</html>