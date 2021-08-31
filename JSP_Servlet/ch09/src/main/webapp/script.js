function loginCheck(actionURL){
	if(document.login.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.login.id.focus();
		return;
	}
	if(document.login.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.login.pwd.focus();
		return;
	}
	document.login.action = actionURL;
	document.login.submit();
}
