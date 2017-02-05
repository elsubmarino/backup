package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Popup;
import com.coresec.admin.domain.SearchCriteria;

@Repository
public class PopupDoImpl implements PopupDo{
	@Inject SqlSession sqlSession;
	private final String namespace="com.coresec.admin.mapper.popupMapper";
	@Override
	public Popup selectOnePopup(int f_id) {
		return sqlSession.selectOne(namespace+".selectOnePopup",f_id);
	}
	@Override
	public List<Popup> selectListPopup(SearchCriteria cri) {
		return sqlSession.selectList(namespace+".selectListPopup",cri);
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
	public int countsPopup(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".countsPopup",cri);
	}
	@Override
	public List<Popup> applyForPopups() {
		return sqlSession.selectList(namespace+".applyForPopups"); 
	}
	
	@Override
	public int getBadge() {
		return sqlSession.selectOne(namespace+".getBadget");
	}
	
	

}
