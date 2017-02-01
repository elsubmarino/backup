package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Reception;
import com.coresec.admin.domain.SearchCriteria;

@Repository
public class ReceptionDoImpl implements ReceptionDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.receptionMapper";

	@Override
	public Reception selectOne(int f_id) {
		return sqlSession.selectOne(namespace + ".selectOne", f_id);
	}

	@Override
	public List<Reception> selectList(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".selectList",cri);
	}

	@Override
	public void update(Reception Reception) {
		sqlSession.update(namespace + ".update", Reception);
	}

	@Override
	public void delete(int f_id) {
		sqlSession.delete(namespace + ".delete", f_id);

	}

	@Override
	public void insert(Reception Reception) {
		sqlSession.insert(namespace + ".insert", Reception);
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
	public String getCategoryName(String f_ca_id) {
		return sqlSession.selectOne(namespace+".getCategoryName",f_ca_id);
	}

	@Override
	public String getSubject(int f_eid) {
		return sqlSession.selectOne(namespace+".getSubject",f_eid);
	}

	@Override
	public String getDate(int f_sid) {
		return sqlSession.selectOne(namespace+".getDate",f_sid);
	}

}
