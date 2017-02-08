package com.coresec.admin.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.coresec.admin.domain.Referer;

public interface LogsDo {
	void insert(String referer);
	List<Referer> selectList(Map<String, String> map);
}
