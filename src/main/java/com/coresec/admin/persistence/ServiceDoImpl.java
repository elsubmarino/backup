package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.SetBoard;

@Repository
public class ServiceDoImpl implements ServiceDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.setBoardMapper";
	@Override
	public SetBoard selectOneSetBoard(int f_id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<SetBoard> selectListSetBoard(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateSetBoard(SetBoard setBoard) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteSetBoard(int f_id) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void insertSetBoard(SetBoard setBoard) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public int countsSetBoard(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int getBadge() {
		// TODO Auto-generated method stub
		return 0;
	}


}
