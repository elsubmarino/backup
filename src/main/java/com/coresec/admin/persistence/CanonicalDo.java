package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Canonical;
import com.coresec.admin.domain.SearchCriteria;

public interface CanonicalDo {
	//selectOne
	public Canonical selectOne(int f_id);
	
	//selectList
	public List<Canonical> selectList(SearchCriteria cri);
	
	//modify
	public void update(Canonical canonical);
	
	//delete
	public void delete(int f_id);
	
	//insert
	public void insert(Canonical canonical);	
	
	//counts
	public int getCount(SearchCriteria cri);
	
	
	//new badge
	public int getBadge();
	
	public String getCategoryName(String f_ca_id);
	
	public String getSubject(int f_eid);
	
	public String getDate(int f_sid);
}
