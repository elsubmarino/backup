package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Education;
import com.coresec.admin.domain.SearchCriteria;

public interface EducationDo {
	List<Education> selectListEducation(SearchCriteria cri);
	int countsEducation(SearchCriteria cri);
	void insertEducation(Education education);
	void deleteEducation(int f_id);
	Education selectOneEducation(int f_id);
	void updateEducation(int f_id);
	
	//new badge
	public int getBadge();
	
	public String getSubject(int f_eid);
}
