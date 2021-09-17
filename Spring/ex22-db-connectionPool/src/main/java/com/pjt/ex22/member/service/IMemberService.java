package com.pjt.ex22.member.service;

import com.pjt.ex22.member.Member;
import com.pjt.ex22.member.MemberPhone;

public interface IMemberService {
	int memberRegister(Member member);
	Member memberSearch(Member member);
	Member memberModify(Member member);
	int memberRemove(Member member);
}
