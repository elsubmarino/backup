package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Canonical;
import com.coresec.admin.domain.Canonical_s;
import com.coresec.admin.domain.SearchCriteria;

@Repository
public class CanonicalDoImpl implements CanonicalDo {
	@Inject
	SqlSession sqlSession;
	private final String namespace = "com.coresec.admin.mapper.canonicalMapper";

	@Override
	public Canonical selectOne(int f_id) {
		return sqlSession.selectOne(namespace + ".selectOne", f_id);
	}

	@Override
	public List<Canonical> selectList(SearchCriteria cri) {
		return sqlSession.selectList(namespace + ".selectList",cri);
	}

	@Override
	public void update(Canonical Canonical) {
		sqlSession.update(namespace + ".update", Canonical);
	}

	@Override
	public void delete(int f_id) {
		sqlSession.delete(namespace + ".delete", f_id);

	}

	@Override
	public void insert(Canonical Canonical) {
		sqlSession.insert(namespace + ".insert", Canonical);
	}

	@Override
	public int getF_id() {
		return sqlSession.selectOne(namespace + ".getF_id");
	}
	

	@Override
	public void insertItem(Canonical_s item) {
		sqlSession.insert(namespace + ".insertItem", item);
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
	
	@Override
	public List<Canonical_s> selectOneHistory_s(int f_hid) {
		return sqlSession.selectList(namespace+".selectOneHistory_s",f_hid);
	}

	@Override
	public void updateCanonical_s(Canonical_s canonical_s) {
		sqlSession.update(namespace+".updateCanonical_s",canonical_s);
	}

	@Override
	public void deleteCanonical_s(int f_hid) {
		sqlSession.delete(namespace+".deleteCanonical_s",f_hid);
	}

	@Override
	public void insertToHistory_s(Canonical item) {
		sqlSession.insert(namespace+".insertToHistory_s",item);

	}

}
