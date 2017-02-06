package com.coresec.admin.persistence;

import java.util.List;
import java.util.Map;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Survey;
import com.coresec.admin.domain.Survey_items;

public interface SurveyDo {
	//selectOne
	public Survey selectOne(int f_id);
	
	//selectList
	public List<Survey> selectList(SearchCriteria cri);
	
	//modify
	public void update(Survey survey);
	
	//delete
	public void delete(int f_id);
	
	//insert
	public void insert(Survey survey);	
	
	//counts
	public int getCount(SearchCriteria cri);

	//apply
	List<Survey> applyForSurvey();
	List<Survey_items> applyForSurveyItems(int f_uid);
	
	
	//new badge
	public int getBadge();
	
	public int getFid();
	
	public void insertItem(Map<String,Object> map);
	
	public void deleteItems(int f_uid);
	
	public void updateCount(int f_id);
	
	public int getCountByFuid(int f_uid);
	public int getCountByFid(int f_id);

	
}