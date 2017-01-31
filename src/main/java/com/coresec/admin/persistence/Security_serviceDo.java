package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Security_service;
import com.coresec.admin.domain.SetBoard;

public interface Security_serviceDo {
	//selectOne
	public Security_service selectOneSecurity_service(int f_id);
	
	//selectList
	public List<Security_service> selectListSecurity_service(SearchCriteria cri);
	
	//delete
	public void deleteSecurity_service(int f_id);
	
	//counts
	public int countsSecurity_service(SearchCriteria cri);
	
	//new badge
	public int getBadge();
}
