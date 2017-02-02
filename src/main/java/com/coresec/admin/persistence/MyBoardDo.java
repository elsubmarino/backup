package com.coresec.admin.persistence;

import java.util.List;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.MyBoard;

public interface MyBoardDo {
	//selectOne
	public MyBoard selectOne(int f_id);
	
	//selectList
	public List<MyBoard> selectList(SearchCriteria cri);
	
	//modify
	public void update(MyBoard MyBoard);
	
	//delete
	public void delete(int f_id);
	
	//insert
	public void insert(MyBoard MyBoard);	
	
	//counts
	public int getCount(SearchCriteria cri);
	
	
	//new badge
	public int getBadge();
	
	//get a number of posts
	public int getNumOfPosts(int f_bid);
}
