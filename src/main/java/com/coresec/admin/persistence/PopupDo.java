package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Popup;
import com.coresec.admin.domain.SearchCriteria;

public interface PopupDo {
	//selectOne
	public Popup selectOnePopup(int f_id);
	
	//selectList
	public List<Popup> selectListPopup(SearchCriteria cri);
	
	
	//delete
	void deletePopup(int f_id);
	
	//modify
	void updatePopup(Popup popup);
	
	//insert
	void insertPopup(Popup popup);
	
	//selectCounting
	int countsPopup(SearchCriteria Cri);
	
	//apply
	List<Popup> applyForPopups();

}
