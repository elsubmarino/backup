package com.coresec.admin.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Meta;

@Repository
public class MetaDoImpl implements MetaDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.metaMapper";

	@Override
	public Meta selectOne() {
		return sqlSession.selectOne(namespace + ".selectOne");
	}


	@Override
	public void update(Meta meta) {
		sqlSession.update(namespace + ".update", meta);
	}


	
	@Override
	public int getBadge() {
		return sqlSession.selectOne(namespace+".getBadget");
	}

}
