package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Category;

public interface CategoryDo {
	//selectOne
	public Category selectOneCategory(int f_id);
	
	//selectList
	public List<Category> selectListCategopry();
	
	//insert
	public void insertCategory(Category category);
	
	//modify
	public void updateCaetgory(Category category);
	
	//delete
	public void deleteCategory(int f_id);
	
	//counts
	public int countsCategory();
}
