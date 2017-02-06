package com.coresec.admin.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Survey;
import com.coresec.admin.domain.Survey_items;

@Repository
public class SurveyDoImpl implements SurveyDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.surveyMapper";

	@Override
	public Survey selectOne(int f_id) {
		return sqlSession.selectOne(namespace + ".selectOne", f_id);
	}

	@Override
	public List<Survey> selectList(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".selectList",cri);
	}

	@Override
	public void update(Survey Survey) {
		sqlSession.update(namespace + ".update", Survey);
	}

	@Override
	public void delete(int f_id) {
		sqlSession.delete(namespace + ".delete", f_id);

	}
	
	@Override
	public void deleteItems(int f_uid){
		sqlSession.delete(namespace+".deleteItems",f_uid);
	}

	@Override
	public void insert(Survey Survey) {
		sqlSession.insert(namespace + ".insert", Survey);
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
	public List<Survey> applyForSurvey() {
		return sqlSession.selectList(namespace+".applyForSurvey");
	}

	@Override
	public int getFid() {
		return sqlSession.selectOne(namespace+".getFid");
	}

	@Override
	public void insertItem(Map<String,Object> map) {
		sqlSession.insert(namespace+".insertItem",map);
	}

	@Override
	public List<Survey_items> applyForSurveyItems(int f_uid) {
		return sqlSession.selectList(namespace+".applyForSurveyItems",f_uid);
	}

	@Override
	public void updateCount(int f_id) {
		sqlSession.update(namespace+".updateCount",f_id);
	}

	@Override
	public int getCountByFuid(int f_uid) {
		return sqlSession.selectOne(namespace+".getCountByFuid",f_uid);
	}

	@Override
	public int getCountByFid(int f_id) {
		return sqlSession.selectOne(namespace+".getCountByFid",f_id);
	}
	

}
