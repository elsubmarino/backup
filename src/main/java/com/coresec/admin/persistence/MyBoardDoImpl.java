package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.MyBoard;

@Repository
public class MyBoardDoImpl implements MyBoardDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.myBoardMapper";

	@Override
	public MyBoard selectOne(int f_id) {
		return sqlSession.selectOne(namespace + ".selectOne", f_id);
	}

	@Override
	public List<MyBoard> selectList(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".selectList",cri);
	}

	@Override
	public void update(MyBoard MyBoard) {
		sqlSession.update(namespace + ".updateMyBoard", MyBoard);
	}

	@Override
	public void delete(int f_id) {
		sqlSession.delete(namespace + ".delete", f_id);

	}

	@Override
	public void insert(MyBoard MyBoard) {
		sqlSession.insert(namespace + ".insert", MyBoard);
	}

	@Override
	public int getCount(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".getCount",cri);
	}
	
	@Override
	public int getBadge() {
		return sqlSession.selectOne(namespace+".getBadget");
	}

	@Override
	public int getNumOfPosts(int f_bid) {
		return sqlSession.selectOne(namespace+".getNumOfPosts",f_bid);
	}

}
