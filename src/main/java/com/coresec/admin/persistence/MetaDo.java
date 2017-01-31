package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.Meta;
import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.SetBoard;

public interface MetaDo {
	//selectOne
	public Meta selectOneSetBoard();
	
	//selectList
	public List<SetBoard> selectListSetBoard(SearchCriteria cri);
	
	//modify
	public void updateSetBoard(SetBoard setBoard);
	
	//delete
	public void deleteSetBoard(int f_id);
	
	//insert
	public void insertSetBoard(SetBoard setBoard);	
	
	//counts
	public int countsSetBoard(SearchCriteria cri);
	
	
	//new badge
	public int getBadge();
}
