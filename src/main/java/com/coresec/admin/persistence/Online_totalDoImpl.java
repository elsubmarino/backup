package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Online_total;
import com.coresec.admin.domain.SearchCriteria;

@Repository
public class Online_totalDoImpl implements Online_totalDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.online_totalMapper";

	@Override
	public Online_total selectOne(int f_id) {
		return sqlSession.selectOne(namespace + ".selectOne", f_id);
	}

	@Override
	public List<Online_total> selectList(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".selectList",cri);
	}

	@Override
	public void update(Online_total online_total) {
		sqlSession.update(namespace + ".update", online_total);
	}

	@Override
	public void delete(int f_id) {
		sqlSession.delete(namespace + ".delete", f_id);

	}

	@Override
	public void insert(Online_total online_total) {
		sqlSession.insert(namespace + ".insert", online_total);
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
