package com.pjt.ex22.member.dao;

import com.pjt.ex22.member.Member;
import com.pjt.ex22.member.MemberPhone;

public interface IMemberDao {
	int memberInsert(Member member);
	Member memberSelect(Member member);
	int memberUpdate(Member member);
	int memberDelete(Member member);
}
