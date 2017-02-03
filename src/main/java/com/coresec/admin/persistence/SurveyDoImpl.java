package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Survey;

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

}
