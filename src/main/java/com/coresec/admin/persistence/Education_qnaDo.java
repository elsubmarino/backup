package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Education_qna;
import com.coresec.admin.domain.SearchCriteria;

public interface Education_qnaDo {
	//selectOne
	public Education_qna selectOneEducation_qna(int f_id);
	
	//selectList
	public List<Education_qna> selectListEducation_qna(SearchCriteria cri);
	
	//modify
	public void updateEducation_qna(Education_qna Education_qna);
	
	//delete
	public void deleteEducation_qna(int f_id);
	
	//insert
	public void insertEducation_qna(Education_qna Education_qna);	
	
	//counts
	public int countsEducation_qna(SearchCriteria cri);
	
	
	//new badge
	public int getBadge();
}
