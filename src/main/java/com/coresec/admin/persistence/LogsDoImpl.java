package com.coresec.admin.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Referer;

@Repository
public class LogsDoImpl implements LogsDo {

	@Inject
	SqlSession sqlSession;

	private final String namespace = "com.coresec.admin.mapper.logsMapper";

	@Override
	public void insert(String referer) {
		sqlSession.insert(namespace+".insert",referer);
	}

	@Override
	public List<Referer> selectList(Map<String,String> map) {
		return sqlSession.selectList(namespace+".selectList",map);
	}

	

}
