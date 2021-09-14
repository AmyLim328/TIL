package com.pjt.ex17.member.service;

import com.pjt.ex17.member.Member;

public interface IMemberService {
	void memberRegister(String memId, String memPw, String memMail, String memPhone1, String memPhone2, String memPhone3);
	Member memberSearch(String memId);
	void memberModify(String memId, String memPw, String memMail, String memPhone1, String memPhone2, String memPhone3);
	void memberRemove(String memId);
}
