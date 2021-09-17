// 현재 폼에서 받은 값을 다른 폼에 있는 요소에 입력하는 함수
// user, title, content 내용값 전달
function inputValue(form1, param, form2, idx){
	const paramValue = form1.elements[idx].value;
	form2.elements[idx].value = paramValue;			 
	return;
}

// 폼 이름을 인자로 받아서 입력할 파일의 개수 입력하지 않으면 입력하라는 경고 메시지 출력
function addFile(formName){
	
	// 공백이 아닌 어떤 값이 입력되었을 경우에는 if문 내부를 실행하지 않음
	if(formName.addcnt.value==""){
		alert(" 입력할 파일 갯수를 입력하고 확인버튼을 눌러주세요" ); 
		formName.addcnt.focus();						 
		return;
	}
	formName.submit(); // 폼 전송
}

// 폼 이름을 인자로 받아서 아무런 파일을 선택하지 않으면 파일 선택하라는 경고 메시지 출력
function elementCheck(formName){
   paramIndex = 1; // 파일선택 창 인덱스를 가리키는 변수

   // 폼에 있는 전체 폼 요소들의 개수만큼 반복 수행
   for(idx = 0; idx < formName.elements.length; idx++){
	
	  // 폼 요소들 중 인덱스로 지정되는 폼 요소의 type이 file인지 아닌지 체크하는 부분
      // <input type="file" name=...> 폼 요소 찾아내는 부분
      if(formName.elements[idx].type == "file"){
		 // 폼 요소에 입력된 값이 공백인지 아닌지 체크
         if(formName.elements[idx].value ==""){
	        const message = paramIndex +" 번째 파일정보가 누락되었습니다.\n업로드할 파일을 선택해 주세요";
		    alert(message);
			formName.elements[idx].focus();
			return;		
	     }
	     paramIndex++; 
		// 다음 반복문 수행 시 file이라는 속성으로 지정된 부분에 
		// 아무런 값이 입력되지 않았을 경우 그 폼 요소 순번 지시하기 위함
      }
   }
   formName.action = "04_fileInfoView.jsp";
   formName.submit(); // 폼 전송
}