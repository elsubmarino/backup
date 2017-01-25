package com.coresec.admin.persistence;

import java.util.Map;

import com.coresec.admin.domain.Admin;

public interface AdminDo {
	Admin auth(Admin member);
	void changePassword(Map<String, Object> temp);
}
