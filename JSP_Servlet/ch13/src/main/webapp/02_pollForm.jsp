<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="ex01.*,java.util.Vector"%>
<jsp:useBean id="pMgr" class="ex01.PollMgr"/>
<%
	  int num = 0;

	  if(!(request.getParameter("num")==null || request.getParameter("num").equals(""))){
		 num = Integer.parseInt(request.getParameter("num"));
	  }
	
	  PollListBean plBean = pMgr.getList(num);
	  Vector<String> vlist = pMgr.getItem(num);

	  String question = plBean.getQuestion();
	  int type = plBean.getType();
	  int active = plBean.getActive();
%>
<link href="style.css" rel="stylesheet" type="text/css">
<form method="post" action="03_pollFormProc.jsp">
<table border="1" width="300">
	<tr>
		<td colspan="2">Q : <%=question%></td>
	</tr>
	<tr>
		<td colspan="2">
			<%
				for(int i=0; i<vlist.size(); i++){
					String itemList = vlist.get(i);
					if(type==1){
						out.println("<input type=checkbox name='itemnum' value='"+i+"'>");
					}else{
						out.println("<input type=radio name='itemnum' value='"+i+"'>");
					}
					out.println(itemList + "<br>");
				}//for end
			%>
		</td>
	</tr>
	<tr>
		<td>
			<% if(active == 1){%>
					<input type='submit' value='투표'>
					<% }else{ %>
						투표
			<%} %>
			
		</td>
		<td>
		<input type="button" value="결과" 
		onclick="javascript:window.open('06_pollView.jsp?num=<%=num%>',
		               'PollView','width=800, height=350')">
		</td>
	</tr>
</table>
<input type="hidden" name="num" value="<%=num%>">
</form>