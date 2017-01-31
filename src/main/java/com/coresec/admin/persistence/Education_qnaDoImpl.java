package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Education_qna;
import com.coresec.admin.domain.SearchCriteria;

@Repository
public class Education_qnaDoImpl implements Education_qnaDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.education_qnaMapper";

	@Override
	public Education_qna selectOneEducation_qna(int f_id) {
		return sqlSession.selectOne(namespace + ".selectOneEducation_qna", f_id);
	}

	@Override
	public List<Education_qna> selectListEducation_qna(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".selectListEducation_qna",cri);
	}

	@Override
	public void updateEducation_qna(Education_qna Education_qna) {
		sqlSession.update(namespace + ".updateEducation_qna", Education_qna);
	}

	@Override
	public void deleteEducation_qna(int f_id) {
		sqlSession.delete(namespace + ".deleteEducation_qna", f_id);

	}

	@Override
	public void insertEducation_qna(Education_qna Education_qna) {
		sqlSession.insert(namespace + ".insertEducation_qna", Education_qna);
	}

	@Override
	public int countsEducation_qna(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".countsEducation_qna",cri);
	}
	
	@Override
	public int getBadge() {
		return sqlSession.selectOne(namespace+".getBadget");
	}

}
