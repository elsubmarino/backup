package com.coresec.admin.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Admin;

@Repository
public class AdminDoImpl implements AdminDo{
	
	@Inject 
	SqlSession sqlSession;
	
	private final String namespace="com.coresec.admin.mapper.adminMapper";

	@Override
	public Admin auth(Admin member) {
		return sqlSession.selectOne(namespace+".auth",member);
	}

}
