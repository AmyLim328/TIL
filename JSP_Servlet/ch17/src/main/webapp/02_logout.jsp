<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		session.invalidate();
		response.sendRedirect("01_login.jsp");
%>