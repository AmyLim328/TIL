<!-- 파일 여러개 업로드 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%! 
	// 선언부
	// 페이지 전체에서 사용될 변수/메소드 정의
	
	// request, paramName을 인자로 전달받아 getParam() 호출
	// 현재 폼 요소들 중 paramName으로 지정된 부분에 입력된 값을 보존하기 위한 메소드 (현재 폼 내용을 전송)
	// 현재 페이지를 다시 현재 페이지로 전송하면 이전에 입력했던 값이 사라짐 (이전에 입력한 값들을 보전하기 위해 만든 메소드)
	public String getParam(HttpServletRequest request, String paramName){
		
		// 페이지가 처음 실행될 때는 받아오는 값이 없기 때문에 null로 확인
		// null이 아니면 (페이지를 전송한 경우) 이름과 값의 쌍으로 이루어진 파라미터 (폼 요소) 가져올 수 있음
		// 파라미터 이름으로 가져온 값을 결과값으로 반환
		if(request.getParameter(paramName) != null){
			return request.getParameter(paramName);
		}else{ 
			// 해당 페이지가 이전에 실행된 것이 아니고 
			// 처음 실행되었기 때문에 파라미터 (폼 요소)가 없음
			return "";
		}
	}
%>
<%
	request.setCharacterEncoding("EUC-KR");
	// 사용자의 요청에 전달된 데이터에 대한 인코딩을 지정
	// 한글 처리
	
	int filecounter = 0; 
	// 스크립트릿에서 선언한 변수는 무조건 초기화 필요
	
	/*
		input 태그에 파일 수를 입력한 뒤 [확인] 버튼을 누르면 현재 페이지가 전송
		[확인] 버튼을 눌러 전송하는 폼은 다시 현재 페이지로 전송하게 되는데
		이때 addcnt에 입력된 파일 개수 추출
		
		이 페이지에 처음 실행되었으면 이 페이지의 폼 
		(FileSelectPage.jsp에는 폼이 두 개임 (freName1))에 담긴 데이터가 없기 때문에 
		null이 되어서 if문 내부를 수행하지 않음
		
		[확인] 버튼을 클릭해서 이 폼을 전송하였을 경우는 addcnt에 담긴 값이 있기 때문에
		이 addcnt에 담긴 값을 filtercounter라는 정수형 변수에 담음
		이때 request.getParameter() 메소드는 그 반환형이 String 형태이므로
		정수형 변수에 담기 위해서 interger.parseInt() 메소드를 통해서 정수형으로 바꾸어 담음
	*/
	
	// 페이지가 두번째로 호출되었을 때
	if(request.getParameter("addcnt") != null){
		filecounter 
		= Integer.parseInt
		(request.getParameter("addcnt"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>File Select Page</title>
<script src="script.js"></script>
</head>
<body topmargin="100">
<div align="center"><font color="#0000ff" size="2">
복수 개의 파일의 업로드를 위하여 파일 갯수를 입력한 후<br/>
확인 버튼을 눌러주세요!!!<br/>
입력이 완료되면 DONE 버튼을 눌러주세요</font></div><br/>

<!-- 폼들끼리는 중첩 불가능 -->
<!-- 단순히 사용자의 입력을 받기 위한 필드를 갖고 있는 폼 -->
<form name="frmName1" method="post">
<table width="75%" border="1" align="center" cellpadding="1" cellspacing="1">

<tr>
	 <!-- frmName1의 0번 인덱스 user -->
    <!-- 키보드 입력이 완료되는 순간 이벤트 발생하여 inputValue()라는 함수 호출
    현재 폼에서 받은 값을 다른 폼에 있는 요소에 입력하는 함수 -->
    <!-- 이전에 입력했던 값을 받아와서 텍스트 박스에 표시하기 위해 getParam() 호출 -->
    <td width="10%"><div align="right">user</div></td>
    <td><input  name="user" onkeyup="inputValue(this.form,user,frmName2,0)" 
    value="<%=getParam(request, "user")%>"></td>
    
    <!-- 키입력을 위해 입력창에 키보드가 눌러졌다가 다시 올라오는 순간 이벤트 발생 -->
    <td width="10%"><div align="right">title</div></td>
    
    <!-- frmName1의 1번 인덱스 title -->
    <!-- 키보드 입력이 완료되는 순간 이벤트 발생하여 inputValue()라는 함수 호출
    현재 폼에서 받은 값을 다른 폼에 있는 요소에 입력하는 함수 -->
    <!-- 이전에 입력했던 값을 받아와서 텍스트 박스에 표시하기 위해 getParam() 호출 -->
    <td><input name="title" onkeyup="inputValue(this.form,title,frmName2,1)" 
    value="<%=getParam(request, "title")%>"></td>
    
</tr>
<tr>
	<td width="15%"><div align="right">content</div></td>
	<td width="50%" colspan="3">
	
	<!-- frmName1의 2번 인덱스 content -->
	<!-- 키보드 입력이 완료되는 순간 이벤트 발생하여 inputValue()라는 함수 호출
    현재 폼에서 받은 값을 다른 폼에 있는 요소에 입력하는 함수 -->
	<!-- 이전에 입력했던 값을 받아와서 텍스트 박스에 표시하기 위해 getParam() 호출 -->
	
	<textarea name="content" cols="40" 
	onkeyup="inputValue(this.form,content, frmName2,2)"><%=getParam(request,"content")%>
	</textarea>
	</td>
</tr>
<tr>
	<td colspan="4"><div align="center">
	<font size="-2">추가할 파일 수 입력</font>
	<input name="addcnt">
	<!-- 아무런 값 입력 (파일 개수 입력)이 없다면 메시지 띄워서 파일 개수 입력함 -->
	<input type="button" value=" 확인 " onclick="addFile(this.form)">
	</div>
	</td>
</tr>
</table>
</form>

<!-- 파일 업로드를 위한 파일 정보 받는 폼 -->
<!-- 파일 업로드를 위해 사용되는 폼의 enctype이 multipart/form-data로 지정되어 있어서
request 객체를 통해서 폼 데이터를 처리할 수 없기 때문에
동적으로 파일선택 창을 생성하기 위해서는 폼을 따로 만들어야 함 -->
<form name="frmName2" method="post" enctype="multipart/form-data">
<table width="75%" border="1" align="center" cellpadding="1" cellspacing="1">
<tr>
	<td width="40%">
	
	<!-- hidden 속성으로 부여된 폼 요소 -->
	<!-- 브라우저에는 보이지 않지만 필요한 값을 담기 위해 hidden 속성으로 지정 -->
	<input type="hidden" name="user" value="<%=getParam(request, "user")%>">
	<input type="hidden" name="title" value="<%=getParam(request, "title")%>">
	<input type="hidden" name="content" value="<%=getParam(request,"content")%>">
	<!-- 해당 페이지가 frmName1을 통해서 전송이 되면 다시 현재 페이지가 로드되는데
	이 때 이전에 담겨진 값을 보존하기 위해 getParam 메소드를 사용해서 이전 값을 갖게 함 -->
	
	<!-- 동적으로 파일선택 창을 생성하여 
	복수 개의 파일을 입력받는 폼의 file 속성을 가진 요소를 포함한 폼을 따로 만들고
	그 폼 안에 hidden 속성으로 필요한 부분을 지정하여 다른 폼에서 받은 값들을 가질 수 있게 함 -->
	<%	for(int i=0; i < filecounter; i++){%>
	<input type="File" size="50" name="selectFile<%=i%>"><br/>	 	
	<%	}%>
	</td>
	<td><input type="button" value="DONE" onclick="elementCheck(this.form)"></td>
	<!-- 버튼이 눌리면 이벤트 발생 -->
	<!-- 모든 폼 요소들의 필드값에 누락된 부분이 없는지 (파일 선택이 누락된 부분이 없는지) -->
</tr>
</table>
</form>
</body>
</html>