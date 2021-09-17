<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@page import="java.util.*, java.io.*, java.net.*" %>
<%
	String saveFolder = request.getRealPath("files");
	// 업로드할 파일 실제 경로 반환
	
	String encType = "EUC-KR"; // 업로드할 파일 인코딩 타입
	int maxSize = 5 * 1024 * 1024; // 5mb
	// 업로드할 파일 최대 크기
	/*
		mb
		(1000)^2 => 반도체 (십진법)
		(1024)^2 => SW (이진법)
	
	*/
	
	try{
		MultipartRequest multi = null;
		multi = new MultipartRequest
				(request, saveFolder, maxSize, encType, 
						new DefaultFileRenamePolicy());
		
		// user, title
		Enumeration params = multi.getParameterNames();
		
		while(params.hasMoreElements()){
			String name = (String)params.nextElement();
			// 파라미터 이름 반환
			String value = multi.getParameter(name);
			// 파라미터 이름에 대한 값 반환
			
			out.println(name + ":" + value + "<br/>");
		}
		
		// file
		Enumeration files = multi.getFileNames();
		// input type="file" 파일 속성으로 
		// 지정된 폼 요소 이름 반환
		
		while(files.hasMoreElements()){
			String name = (String)files.nextElement();
			String filename = multi.getFilesystemName(name);
			filename = URLEncoder.encode(filename);
			// 파일 이름이 한국어일 경우
			
			String original = multi.getOriginalFileName(name);
			// 실제 파일 이름 출력
			String type = multi.getContentType(name);
			File f = multi.getFile(name);
			
			out.println("파라미터 이름: " + name + "<br/>");
			out.println("실제 파일 이름: " + original + "<br/>");
			out.println("저장된 파일 이름: " + filename + "<br/>");
			out.println("파일 타입: " + type + "<br/>");
			
			if(f != null){
				out.println("크기: " + f.length() + "bytes");
			}
		}
		
	}catch(IOException e){ 
		// MultipartRequest 생성자는 IOException 던짐!
		// (업로드할 파일이 파일 최대 크기보다 크거나 
				// 페이지를 읽을 때 문제생기는 경우)
		e.printStackTrace();
	}catch(Exception e){
		e.printStackTrace();
	}
	

%>