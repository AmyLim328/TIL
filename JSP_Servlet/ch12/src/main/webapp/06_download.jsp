<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="bMgr" class="ex01.BoardMgr" />
<%
	  bMgr.downLoad(request, response, out, pageContext);
%>