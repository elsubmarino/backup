package com.coresec.admin.persistence;

import com.coresec.admin.domain.Admin;

public interface AdminDo {
	Admin auth(Admin member);
}
