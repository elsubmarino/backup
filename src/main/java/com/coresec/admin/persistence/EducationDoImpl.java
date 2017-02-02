package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Education;
import com.coresec.admin.domain.SearchCriteria;

@Repository
public class EducationDoImpl implements EducationDo {
	@Inject SqlSession sqlSession;
	private final String namespace="com.coresec.admin.mapper.educationMapper";
	@Override
	public List<Education> selectListEducation(SearchCriteria cri) {
		return sqlSession.selectList(namespace+".selectListEducation",cri);
	}
	@Override
	public int countsEducation(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".countsEducation",cri);
	}
	@Override
	public void insertEducation(Education education) {
		sqlSession.insert(namespace+".insertEducation",education);
	}
	@Override
	public void deleteEducation(int f_id) {
		sqlSession.delete(namespace+".deleteEducation",f_id);
		
	}
	@Override
	public Education selectOneEducation(int f_id) {
		return sqlSession.selectOne(namespace+".selectOneEducation",f_id);
	}
	@Override
	public void updateEducation(int f_id) {
		sqlSession.update(namespace+".updateEducaiton", f_id);
	}
	
	@Override
	public int getBadge() {
		return sqlSession.selectOne(namespace+".getBadget");
	}
	@Override
	public String getSubject(int f_eid) {
		return sqlSession.selectOne(namespace+".getSubject",f_eid);
	}
}
