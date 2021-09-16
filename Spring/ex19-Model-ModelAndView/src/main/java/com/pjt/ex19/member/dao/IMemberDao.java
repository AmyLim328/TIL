package com.pjt.ex19.member.dao;

import com.pjt.ex19.member.Member;
import com.pjt.ex19.member.MemberPhone;

public interface IMemberDao {
	void memberInsert(String memId, String memPw, String memMail, 
			MemberPhone memPhone);
	
	Member memberSelect(String memId, String memPw);
	
	void memberUpdate(String memId, String memPw, String memMail, 
			MemberPhone memPhone);
	
	void memberDelete(String memId, String memPw);
}
