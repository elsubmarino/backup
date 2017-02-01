package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Service;

public interface ServiceDo {
	//selectOne
	public Service selectOne(int f_id);
	
	//selectList
	public List<Service> selectList(SearchCriteria cri);
	
	//modify
	public void update(Service service);
	
	//delete
	public void delete(int f_id);
	
	//insert
	public void insert(Service service);	
	
	//counts
	public int getCount(SearchCriteria cri);
	
		//new badge
	public int getBadge();
}
