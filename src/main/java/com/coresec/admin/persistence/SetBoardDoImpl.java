package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Popup;
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
	public List<SetBoard> selectListSetBoard() {
		return sqlSession.selectList(namespace + ".selectListSetBoard");
	}

	@Override
	public void updateSetBoard(int f_id) {
		sqlSession.update(namespace + ".updateSetBoard", f_id);
	}

	@Override
	public void deleteSetBoard(int f_id) {
		sqlSession.delete(namespace + ".deleteSetBoard", f_id);

	}

	@Override
	public void insertSetBoard(Popup popup) {
		sqlSession.insert(namespace + ".insertSetBoard", popup);
	}

	@Override
	public int countsSetBoard() {
		return sqlSession.selectOne(namespace+".countsSetBoard");
	}

}
