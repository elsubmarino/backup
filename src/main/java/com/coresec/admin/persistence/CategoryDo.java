package com.coresec.admin.persistence;

import java.util.List;
import java.util.Map;

import com.coresec.admin.domain.Category;
import com.coresec.admin.domain.SearchCriteria;

public interface CategoryDo {
	//selectOne
	public Category selectOneCategory(int f_id);
	
	//selectList
	public List<Category> selectListCategory(SearchCriteria cri);
	
	//insert
	public void insertCategory(Category category);
	
	//modify
	public void updateCaetgory(Category category);
	
	//delete
	public void deleteCategory(int f_id);
	
	//counts
	public int countsCategory(SearchCriteria cri);
	
	public int getCountBelowTwo();
	
	public String getCountAboveThree(Map<String,Object> map);
	
	//new badge
	public int getBadge();
}
