<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
      request.setCharacterEncoding("EUC-KR");

	   //01_pageView.html에서 전달받은 totalRecord
	  int totalRecord = Integer.parseInt(request.getParameter("totalRecord"));
	  int numPerPage = 10; // 페이지당 레코드 수 
	  int pagePerBlock = 15;  // 블럭당 페이지수 
	  // 하나의 페이지에 선택할 수 있는 페이지  1 ~ 15
	  //                               16 ~ 30 ...
	  
	   int totalPage = 0; // 전체 페이지 수 (계산 예정)
	   int totalBlock = 0;  // 전체 블럭수 (계산 예정)
	   int nowPage = 1; // 현재 페이지
	   int nowBlock = 1;  // 현재 블럭
	
	   int start = 0; // 디비의 select 시작번호
	   int end = 10; // 시작번호로부터 가져올 select 갯수
	
	   int listSize = 0; // 현재 읽어온 게시물의 수
	  
	   if (request.getParameter("nowPage") != null) {
		 nowPage = Integer.parseInt(request.getParameter("nowPage"));
	   }
	   /* 한 페이지에 필요한만큼 게시물 가지고 올 수 있음 (start ~ end) */
	   start = (nowPage * numPerPage) - numPerPage;
	   // (현재 페이지 * 한 페이지당 숫자) - 페이지당 숫자 
	   end = numPerPage; 
	   // 페이지당 게시물 개수

	  /*
		전체 페이지 개수를 계산하는 부분
		만약 122개의 레코드가 있다면 122/10 == 12.2를 올림시켜서 13개의 페이지가 만들어짐
		제일 마지막 페이지에는 2개의 레코드 가짐
	  */
	  totalPage = (int)Math.ceil((double)totalRecord / numPerPage); // 전체 페이지수
	  // 전체 게시물의 개수 / 한 페이지당 게시물의 수 == 전체 페이지 수
	  
	  // 현재 블럭을 계산하는 부분
	  // 현재 블럭은 현재 페이지를 블럭 당 페이지 수로 나눠서 계산
	  nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock); // 현재 블럭 계산
	  // 현재 페이지 / 한 블럭당 페이지 수 == 현재 블럭 계산 (몇 번째 블럭인지)
	  /*
	  	1 2 3 4 5 6 7 8 9 ... 15 (첫 번째)
	  	16 .................. 30 (두 번째)
	  	31 .................. 45 (세 번째)
	  */
	  
	  // 전체 블럭 수 계산하는 부분
	  // 전체 블럭 개수는 전체 페이지의 개수를 블럭 당 페이지 수로 나눠서 계산
	  totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock); // 전체 블럭 계산
	  // 전체 페이지 수 / 한 블럭당 페이지 수 = 전체 블럭 계산
	  // 레코드 개수 (게시물 개수) == 100개
	  // 총 페이지 수 == 10개
	  // 1..... 10 == 1개 (전체 블럭 수)
	  
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>페이징 & 블럭 처리 테스트</title>
<script type="text/javascript">
	function pageing(page) { // 페이징 구현을 위한 함수
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}

	function block(value){ // 블럭 계산을 위한 함수
		// pagePerBlock: 블럭당 페이지 (15)
	 	document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1; 
	 	// 블럭 시작하는 수로 설정 (1, 6, .....)
	 	// 블럭을 1부터 시작하기 위해서 +1
	 	document.readFrm.submit();
	} 
</script>
</head>
<body>
<div align="center">
<br/>
<h2>페이징 & 블럭 처리 테스트</h2>
<br/>
	<table width="600">
			<tr align="center">
				<td><b>Total : <%=totalRecord%>Articles(<font color="red">
				<%=nowPage%>/<%=totalPage%>Pages</font>)</b></td>
			</tr>
	</table>
	<table>
	<tr>
		<td>게시물 번호 : &nbsp;</td>
		<%
			listSize = totalRecord - start;
			for(int i = 0;i < numPerPage; i++){
				if (i == listSize) break;
		%>
		
		<!-- 게시물 번호 반대로 출력하는 부분 -->
		<td align="center">
			<%=totalRecord-((nowPage-1)*numPerPage)-i%>&nbsp;
		</td>
		<%}//for%>
		<td align="center">&nbsp;</td>
	</tr>
</table>
<!-- 페이징 및 블럭 -->
<table>
	<tr>
		<td>
		    <!-- https://cuteduck.tistory.com/108 -->
			<!-- 페이징 및 블럭 처리 Start--> 
			<%
   				  int pageStart = (nowBlock - 1) * pagePerBlock + 1 ; // 하단 페이지 시작번호
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) ?  
   						  (pageStart + pagePerBlock): totalPage+1; 
   				  // 하단 페이지 끝번호
   				  
   				  if(totalPage != 0){
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%
    			  		}%>&nbsp; 
							
					<%for ( ; pageStart < pageEnd; pageStart++){%>
   			     			<a href="javascript:pageing('<%=pageStart %>')"> 
   						<%if(pageStart == nowPage) {%><font color="blue"><%}%>
   						[<%=pageStart %>]</a> 
  						
  					<%}//for
  					%>&nbsp; 
    						
   					<%if (totalBlock > nowBlock ) {%>
   					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
   				<%}%>&nbsp;  
   			<%}%>
 			<!-- 페이징 및 블럭 처리 End-->
		</td>
	</tr>
</table>
<hr width="600"/>
<form name="readFrm">
	<input type="hidden" name="totalRecord" value="<%=totalRecord%>">
	<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
</form>
<b>
totalRecord : <%=totalRecord%>&nbsp;
numPerPage : <%=numPerPage%>&nbsp;
pagePerBlock : <%=pagePerBlock%>&nbsp;
totalPage : <%=totalPage%>&nbsp;<br/>
totalBlock : <%=totalBlock%>&nbsp;
nowPage : <%=nowPage%>&nbsp;
nowBlock : <%=nowBlock%>&nbsp;</b>
<p/>
<input type="button" value="TotalRecord 입력폼" onClick="javascript:location.href='01_pageView.html'">
</div>
</body>
</html>