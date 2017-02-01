package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.SearchCriteria;
import com.coresec.admin.domain.Service;

@Repository
public class ServiceDoImpl implements ServiceDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.serviceMapper";
	@Override
	public Service selectOne(int f_id) {
		return sqlSession.selectOne(namespace+".selectOne",f_id);
	}
	@Override
	public List<Service> selectList(SearchCriteria cri) {
		return sqlSession.selectList(namespace+".selectList",cri);
	}
	@Override
	public void update(Service service) {
		sqlSession.update(namespace+"update",service);
	}
	@Override
	public void delete(int f_id) {
		sqlSession.delete(namespace+"delete",f_id);
	}
	@Override
	public void insert(Service service) {
		sqlSession.insert(namespace+".insert",service);
	}
	@Override
	public int getCount(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".getCount",cri);
	}
	@Override
	public int getBadge() {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
