<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ex01.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="ex01.BoardMgr" />
<%	
	  request.setCharacterEncoding("EUC-KR");
	  
      int totalRecord = 0; // 전체 레코드수
	  int numPerPage = 10; // 페이지당 레코드 수 
	  int pagePerBlock = 15; //블럭당 페이지수 
	  
	  int totalPage = 0; // 전체 페이지 수
	  int totalBlock = 0;  //전체 블럭수 

	  int nowPage = 1; // 현재 페이지
	  int nowBlock = 1;  // 현재 블럭
	  
	  /*게시물을 가져오는 쿼리문인 select문의 마지막에 
	  num between ? and ?를 통해 한 페이지에 필요한 만큼 게시물만 가져올 수 있음
	  하나의 페이지에 가지고 올 게시물의 개수를 저장하기 위해 start, end 변수 사용*/
	  
	  int start = 0; // 디비의 select 시작번호
	  int end = 10; // 시작번호로부터 가져올 select 갯수
	  
	  int listSize = 0; // 현재 읽어온 게시물의 수

	String keyWord = "", keyField = "";
	Vector<BoardBean> vlist = null; // getBoardList()의 리턴타입
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	 start = (nowPage * numPerPage)-numPerPage;
	 end = numPerPage;
	 
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	
	/* 전체 페이지 개수를 계산하는 부분
	만약 122개의 레코드가 있다면 122/10의 결과값의 12.2를 올림하여 13개의 페이지가 만들어짐 */
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  // 전체 페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); // 현재 블럭 계산
	 
	// 전체 블럭 수 계산하는 부분
	// 전체 블럭 개수는 전체 페이지의 개수를 블록 당 페이지로 나누어서 계산
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);  // 전체 블럭계산
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function list() {
		document.listFrm.action = "03_list.jsp";
		document.listFrm.submit();
	}
	
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function block(value){
		 document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		 document.readFrm.submit();
	} 
	
	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="05_read.jsp";
		document.readFrm.submit();
	}
	
	function check() {
	     if (document.searchFrm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.searchFrm.keyWord.focus();
			return;
	     }
	  document.searchFrm.submit();
	 }
</script>
</head>
<body>
<div align="center">
	<br/>
	<h2>JSPBoard</h2>
	<br/>
	<table align="center" width="600">
			<tr>
				<td>Total : <%=totalRecord%> Articles (<font color="red"><%=nowPage%>/<%=totalPage%> Pages</font>)</td>
			</tr>
	</table>
	<table align="center" width="600" cellpadding="3">
		<tr>
			<td align="center" colspan="2">
			<%
				  vlist = bMgr.getBoardList(keyField, keyWord, start, end);
				  listSize = vlist.size(); // 브라우저 화면에 보여질 게시물 번호
				  if (vlist.isEmpty()) {
					out.println("등록된 게시물이 없습니다.");
				  } else {
			%>
				  <table width="100%" cellpadding="2" cellspacing="0">
					<tr align="center" bgcolor="#D0D0D0" height="120%">
						<td>번 호</td>
						<td>제 목</td>
						<td>이 름</td>
						<td>날 짜</td>
						<td>조회수</td>
					</tr>
					<%
						 // 페이지별 뿌려줄 게시물의 시작번호부터 페이지 당 레코드 수만큼 반복문 수행
						  for (int i = 0;i < numPerPage; i++) {
							if (i == listSize) break;
							// 페이지별 뿌려줄 게시물의 시작번호가 전체 게시물 사이즈와 같으면 반복문 빠져나옴
							BoardBean bean = vlist.get(i);
							int num = bean.getNum();
							String name = bean.getName();
							String subject = bean.getSubject();
							String regdate = bean.getRegdate();
							int depth = bean.getDepth();
							int count = bean.getCount();
							// 게시물이 저장되어있는 BoardBean에서 빈즈의 getter 메소드로 반환
					%>
					<tr>
						<td align="center">
							<%=totalRecord-((nowPage-1)*numPerPage)-i%>
						</td>
						<!-- 페이지별 및 블럭 처리를 위해서 전체 게시물 수, 페이지 당 게시물 수,
						현재 페이지 계산, 페이지별 게시물의 시작번호 계산, 전체 페이지 수, 
						블럭 당 표시될 페이지 수, 현재 블럭 계산, 전체 블럭 계산을 위한
						선언 및 계산식
						
						=> 페이징 처리와 블럭 설정에서 사용되어짐
					 	-->
						<td>
						<%
							  if(depth>0){
								for(int j=0;j<depth;j++){
									out.println("&nbsp;&nbsp;");
								}
							  }
						%>
						  <a href="javascript:read('<%=num%>')"><%=subject%></a>
						</td>
						<td align="center"><%=name%></td>
						<td align="center"><%=regdate%></td>
						<td align="center"><%=count%></td>
						</tr>
					<%}//for%>
				</table> <%
 			}//if
 		%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><br /><br /></td>
		</tr>
		<tr>
			<td>
			<!-- 페이징 및 블럭 처리 Start--> 
			<!-- 페이징과 블럭에 관련되어 prev..[1] ..[2]..[10]..next 등을 보여주기 위한 코드
			이전 블럭은 현재 블럭 값이 1 이상이 되어야하면 나타나며 페이지 링크를 16개씩 출력하도록 설정
			만약 반복문을 돌다가 총 페이지 링크 개수와 현재 뿌려줄 페이지 번호가 같아지면 반복문 종료
			
			그리고 [다음 16개]가 출력되기 위해서는 현재 블럭을 기준으로 
			현재 블럭 값이 총 블럭 개수보다 작야아만 다음 블럭 출력  -->
			<%
   				  int pageStart = (nowBlock -1) * pagePerBlock + 1 ; // 하단 페이지 시작번호
   				  int pageEnd = ((pageStart + pagePerBlock ) <= totalPage) 
   				  ?  (pageStart + pagePerBlock): totalPage+1; 
   				  // 하단 페이지 끝번호
   				  if(totalPage !=0){
    			  	if (nowBlock > 1) {%>
    			  		<a href="javascript:block('<%=nowBlock-1%>')">prev...</a><%}%>&nbsp; 
    			  		<%for ( ; pageStart < pageEnd; pageStart++){%>
     			     	<a href="javascript:pageing('<%=pageStart %>')"> 
     					<%if(pageStart==nowPage) {%><font color="blue"> <%}%>
     					[<%=pageStart %>]</a> 
    					<%}//for%>&nbsp; 
    					<%if (totalBlock > nowBlock ) {%>
    					<a href="javascript:block('<%=nowBlock+1%>')">.....next</a>
    				<%}%>&nbsp;  
   				<%}%>
 				<!-- 페이징 및 블럭 처리 End-->
				</td>
				<td align="right">
					<a href="04_post.jsp">[글쓰기]</a> 
					<a href="javascript:list()">[처음으로]</a>
				</td>
			</tr>
		</table>
	<hr width="600"/>
	<form  name="searchFrm"  method="get" action="03_list.jsp">
	<table width="600" cellpadding="4" cellspacing="0">
 		<tr>
  			<td align="center" valign="bottom">
   				<select name="keyField" size="1" >
    				<option value="name"> 이 름</option>
    				<option value="subject"> 제 목</option>
    				<option value="content"> 내 용</option>
   				</select>
   				<input size="16" name="keyWord">
   				<input type="button"  value="찾기" onClick="javascript:check()">
   				<input type="hidden" name="nowPage" value="1">
  			</td>
 		</tr>
	</table>
	</form>
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true"> 
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="num"> 
		<input type="hidden" name="nowPage" value="<%=nowPage%>"> 
		<input type="hidden" name="keyField" value="<%=keyField%>"> 
		<input type="hidden" name="keyWord" value="<%=keyWord%>">
	</form>
</div>
</body>
</html>