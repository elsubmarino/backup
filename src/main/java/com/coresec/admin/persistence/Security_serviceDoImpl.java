package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Security_service;

@Repository
public class Security_serviceDoImpl implements Security_serviceDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.security_serviceMapper";

	@Override
	public Security_service selectOneSecurity_service(int f_id) {
		return sqlSession.selectOne(namespace + ".selectOneSecurity_service", f_id);
	}

	@Override
	public List<Security_service> selectListSecurity_service(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".selectListSecurity_service",cri);
	}



	@Override
	public void deleteSecurity_service(int f_id) {
		sqlSession.delete(namespace + ".deleteSecurity_service", f_id);

	}


	@Override
	public int countsSecurity_service(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".countsSecurity_service",cri);
	}
	
	@Override
	public int getBadge() {
		return sqlSession.selectOne(namespace+".getBadget");
	}

}
