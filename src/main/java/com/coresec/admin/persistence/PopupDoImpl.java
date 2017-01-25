package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Popup;

@Repository
public class PopupDoImpl implements PopupDo{
	@Inject SqlSession sqlSession;
	private final String namespace="com.coresec.admin.mapper.popupMapper";
	@Override
	public Popup selectOnePopup(int f_id) {
		return sqlSession.selectOne(namespace+".selectOnePopup",f_id);
	}
	@Override
	public List<Popup> selectListPopup() {
		return sqlSession.selectList(namespace+".selectListPopup");
	}
	@Override
	public void deletePopup(int f_id) {
		sqlSession.delete(namespace+".deletePopup",f_id);
	}
	@Override
	public void updatePopup(Popup popup) {
		sqlSession.update(namespace+".updatePopup",popup);
		
	}
	@Override
	public void insertPopup(Popup popup) {
		sqlSession.insert(namespace+".insertPopup",popup);
	}
	@Override
	public int countsPopup() {
		return sqlSession.selectOne(namespace+".countsPopup");
	}

}
