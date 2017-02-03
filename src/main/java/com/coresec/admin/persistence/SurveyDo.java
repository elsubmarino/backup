package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Popup;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Survey;

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
	
	
	//new badge
	public int getBadge();
}
