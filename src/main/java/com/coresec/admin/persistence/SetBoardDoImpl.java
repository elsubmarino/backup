package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.SetBoard;

@Repository
public class SetBoardDoImpl implements SetBoardDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.setBoardMapper";

	@Override
	public SetBoard selectOneSetBoard(int f_id) {
		return sqlSession.selectOne(namespace + ".selectOneSetBoard", f_id);
	}

	@Override
	public List<SetBoard> selectListSetBoard(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".selectListSetBoard",cri);
	}

	@Override
	public void updateSetBoard(SetBoard setBoard) {
		sqlSession.update(namespace + ".updateSetBoard", setBoard);
	}

	@Override
	public void deleteSetBoard(int f_id) {
		sqlSession.delete(namespace + ".deleteSetBoard", f_id);

	}

	@Override
	public void insertSetBoard(SetBoard setBoard) {
		sqlSession.insert(namespace + ".insertSetBoard", setBoard);
	}

	@Override
	public int countsSetBoard(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".countsSetBoard",cri);
	}
	
	@Override
	public int getBadge() {
		return sqlSession.selectOne(namespace+".getBadget");
	}

	@Override
	public int getMaximum() {
		return sqlSession.selectOne(namespace+".getMaximum");
	}

	@Override
	public void updateAdministration() {
		sqlSession.update(namespace+".updateAdministration");
	}

	@Override
	public String getBoardName(int f_id) {
		return sqlSession.selectOne(namespace+".getBoardName",f_id);
	}

}
