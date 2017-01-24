package com.coresec.admin.persistence;

import com.coresec.admin.domain.Member;

public interface MemberDo {
	Member auth(Member member);
}
