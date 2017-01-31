package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Online;
import com.coresec.admin.domain.SearchCriteria;

public interface OnlineDo {
	//selectOne
	public Online selectOne(int f_id);
	
	//selectList
	public List<Online> selectList(SearchCriteria cri);
	
	//modify
	public void update(Online onloine);
	
	//delete
	public void delete(int f_id);
	
	//insert
	public void insert(Online online);	
	
	//counts
	public int getCount(SearchCriteria cri);
	
	
	//new badge
	public int getBadge();
}
