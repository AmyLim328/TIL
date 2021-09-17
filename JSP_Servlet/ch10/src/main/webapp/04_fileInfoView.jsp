<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.MultipartRequest, 
                com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
                java.util.*, 
                java.io.*,
                java.net.*"							   
%>
<%-- 
	com.oreilly.servlet.MultipartRequest
	: 파일 업로드 요청 지원 클래스
	com.oreilly.servlet.multipart.DefaultFileRenamePolicy
	: 중복된 파일명이 있을 때 파일명을 어떻게 바꿔줄 것인지 규칙을 정해주는 클래스
	: 여기서는 파일명 뒤에 숫자가 붙음

	java.util.*: Enumeration 사용하기 위해 임포트
	java.io.*: IOException 예외받기 위해 임포트 --%> 
<%
		String saveFolder = request.getRealPath("files"); // 파일 저장될 폴더	
		String encType = "EUC-KR"; // 인코딩 타입
		int maxSize = 10 * 1024 * 1024; // 10 * 1K * 1K = 10M
		// 업로드될 파일 최대 크기
				
		ServletContext context = getServletContext();
		// getServletContext() 메소드를 통해 ServletContext 객체 얻음
		
		
		// 사용자가 선택한 파일이름을 저장하기 위한 객체
		ArrayList saveFiles = new ArrayList();
		ArrayList origFiles = new ArrayList();
		
		// 변수 생성
		String user = "";
		String title= "";
		String content = "";
		
		try{
			MultipartRequest multi = new MultipartRequest
					(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());
			// request: 생성자에 담겨진 요청
			// saveFolder: 저장할 폴더
			// maxSize: 파일 최대 크기
			// encType: 인코딩 타입
			// new DefaultFileRenamePolicy(): 파일명 변경설정 객체	
	
			
			// 폼 태그를 통해 사용자가 입력한 데이터를 파라미터를 통해 저장
			// getParameter() 메소드를 사용해서 파라미터 이름을 통해 직접 값을 얻을 수 있음
			// (앞 페이지에서 입력되었던 값을 가져오는 부분)
			user = multi.getParameter("user");
			title = multi.getParameter("title");
			content = multi.getParameter("content");
			
			// 파라미터의 이름을 모를 경우 모든 이름을 들고와서 저장
			Enumeration files = multi.getFileNames(); // file 속성으로 지정된 태그 이름 불러옴
			
			// file 속성으로 지정된 태그 이름을 리턴받아서 
			// 업로드 파일 이름, 본래 파일 이름을 ArrayList에 하나씩 저장
			while(files.hasMoreElements()){
			   String name = (String)files.nextElement(); 
			   name = URLEncoder.encode(name); // URL 인코딩할 때 한국어 인식을 위함
			   saveFiles.add(multi.getFilesystemName(name)); // 업로드 파일 이름
			   origFiles.add(multi.getOriginalFileName(name)); // 원래 파일 이름
			}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>File Info Page</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="75%" border="1" align="center" cellpadding="1" cellspacing="1">
<tr>
    <td width="10%"><div align="right"><strong>user</strong></div></td>
    <td width="30%"><%=user%></td>
    <td width="10%"><div align="right"><strong>title</strong></div></td>
    <td width="30%"><%=title%></td>
</tr>
<tr>
	<td width="10%"><div align="right"><strong>content</strong></div></td>
	<td width="50%" colspan="3">
		<textarea cols="50" rows="5" disabled><%=content%></textarea>	
	</td>
</tr>
<tr><td colspan="4">&nbsp;</td></tr>
<tr>
	<td colspan="4"><strong>업로드된 파일들입니다.</strong></td>
</tr>


<%for(int i=0; i < saveFiles.size();i++){%>
<!-- ArrayList에 있는 메소드로 ArrayList의 크기 (저장된 요소의 개수)만큼 반복문을 돌면서 -->
<tr bgcolor="#FFCC00">
	<td colspan="4">
	<!-- 원래 파일명에 걸린 링크는 서버의 폴더에 저장된 파일로 링크가 걸려 있음 -->
	<a href="<%="./files/"+saveFiles.get(i)%>"><strong><%=origFiles.get(i)%></strong></a>
	<!-- get(i) 메소드는 인덱스를 통해서 그 위치에 있는 값을 가져오는 메소드 (반환값 객체형)
	add(): 객체형을 저장할 수 있음, get(): 저장된 객체를 빼올 때도 객체로 반환 
	
	이 라인의 실행결과는 실제 사용자가 선택한 파일 이름이 표시되고
	그 이름에 걸려있는 링크는 실제 업로드 파일로 링크됨
	
	만약 사용자가 a.*** 파일을 선택해서 업로드 했다고 가정
	기존에 a.***라는 파일과 서버에 업로드 파일이 저장된 폴더에 같은 이름이 없다면 a.*** 그대로 저장
	같은 파일이 있을 경우 a1.*** 형태로 바뀌게 됨
	-->
	</td>
</tr>
<%}%>
</table>
</body>
</html>
<%
// 예외 처리 부분
}catch(IOException ioe){ // MultipartRequest 생성자에서 던지는 예외
	System.out.println(ioe);
}catch(Exception ex){ // 모든 예외처리 받음
	System.out.println(ex);
}
%>