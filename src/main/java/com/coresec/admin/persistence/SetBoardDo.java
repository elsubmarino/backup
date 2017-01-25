package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Popup;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.SetBoard;

public interface SetBoardDo {
	//selectOne
	public SetBoard selectOneSetBoard(int f_id);
	
	//selectList
	public List<SetBoard> selectListSetBoard(SearchCriteria cri);
	
	//modify
	public void updateSetBoard(int f_id);
	
	//delete
	public void deleteSetBoard(int f_id);
	
	//insert
	public void insertSetBoard(Popup popup);	
	
	//counts
	public int countsSetBoard();
}
