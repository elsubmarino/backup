package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Reception;
import com.coresec.admin.domain.SearchCriteria;

public interface ReceptionDo {
	//selectOne
	public Reception selectOne(int f_id);
	
	//selectList
	public List<Reception> selectList(SearchCriteria cri);
	
	//modify
	public void update(Reception onloine);
	
	//delete
	public void delete(int f_id);
	
	//insert
	public void insert(Reception Reception);	
	
	//counts
	public int getCount(SearchCriteria cri);
	
	
	//new badge
	public int getBadge();
	
	public String getCategoryName(String f_ca_id);
	
	public String getSubject(int f_eid);
	
	public String getDate(int f_sid);
}
