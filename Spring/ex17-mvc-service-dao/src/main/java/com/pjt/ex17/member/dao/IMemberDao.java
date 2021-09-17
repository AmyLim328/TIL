package com.pjt.ex17.member.dao;

import com.pjt.ex17.member.Member;

public interface IMemberDao {
	void memberInsert(String memId, String memPw, String memMail, 
			String memPhone1, String memPhone2, String memPhone3);
	
	Member memberSelect(String memId, String memPw);
	
	void memberUpdate(String memId, String memPw, String memMail, 
			String memPhone1, String memPhone2, String memPhone3);
	
	void memberDelete(String memId, String memPw);
}
