package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Online_total;
import com.coresec.admin.domain.SearchCriteria;

public interface Online_totalDo {
	//selectOne
	public Online_total selectOne(int f_id);
	
	//selectList
	public List<Online_total> selectList(SearchCriteria cri);
	
	//modify
	public void update(Online_total onloine);
	
	//delete
	public void delete(int f_id);
	
	//insert
	public void insert(Online_total Online_total);	
	
	//counts
	public int getCount(SearchCriteria cri);
	
	
	//new badge
	public int getBadge();
	
	public String getCategoryName(String f_ca_id);
	
	public String getSubject(int f_eid);
	
	public String getDate(int f_sid);
}
