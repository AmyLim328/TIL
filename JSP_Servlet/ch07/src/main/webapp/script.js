function inputCheck() {
	// 모든 입력 데이터가 입력받아야만 회원가입 가능
	if (document.regForm.id.value == "") {
		alert("아이디를 입력해 주세요");
		document.regForm.id.focus();
		return;
	}

	if (document.regForm.pwd.value == "") {
		alert("비밀번호를 입력해 주세요");
		document.regForm.pwd.focus();
		return;
	}
	if (document.regForm.repwd.value == "") {
		alert("비밀번호를 입력해 주세요");
		document.regForm.repwd.focus();
		return;
	}
	if (document.regForm.name.value == "") {
		alert("이름을 입력해 주세요");
		document.regForm.name.focus();
		return;
	}
	if (document.regForm.birthday.value == "") {
		alert("생년월일을 입력해 주세요");
		document.regForm.birthday.focus();
		return;
	}
	if (document.regForm.email.value == "") {
		alert("이메일을 입력해 주세요");
		document.regForm.email.focus();
		return;
	}

	// 비밀번호 길이 (8 ~ 16) 제한
	if (document.regForm.pwd.value.length < 8
		|| document.regForm.pwd.value.length > 16) {
		alert("비밀번호의 길이 8 ~ 16 사이로 입력해주세요!");
		document.regForm.pwd.focus();
		return;
	}

	// 비밀번호와 비밀번호 재확인 값은 같은지 확인
	if (document.regForm.pwd.value != document.regForm.repwd.value) {
		alert("비밀번호가 일치하지 않습니다");
		document.regForm.repwd.focus();
		return;
	}

	// "ㅁㄴㅇㅁㅇㅁㄴㅇ 1991-12-25" "1999-12-12"
	// 생년월일 형식 확인 (정규표현식 이용)
	const reg_birth = /\d{4}-\d{2}-\d{2}/;
	if (document.regForm.birthday.value.search(reg_birth) == -1) {
		alert("생년월일 형식이 맞지 않습니다!");
		document.regForm.birthday.focus();
		return;
	}

	// 이메일 형식 확인 (정규표현식 이용)
	const reg_email = /[A-Za-z0-9\-\.]+\@[A-Za-z0-9\-\.]+(\.[A-Za-z0-9]{2,3}){1,2}/;
	if (document.regForm.email.value.search(reg_email) == -1) {
		alert("이메일 형식이 맞지 않습니다!");
		document.regForm.email.focus();
		return;
	}

	document.regForm.submit();

}