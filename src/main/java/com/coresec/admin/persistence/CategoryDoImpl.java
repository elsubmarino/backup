package com.coresec.admin.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Canonical_s;
import com.coresec.admin.domain.Category;
import com.coresec.admin.domain.CategoryNames;
import com.coresec.admin.domain.SearchCriteria;

@Repository
public class CategoryDoImpl implements CategoryDo {
	@Inject SqlSession sqlSession;
	private final String namespace="com.coresec.admin.mapper.categoryMapper";
	@Override
	public Category selectOneCategory(int f_id) {
		return sqlSession.selectOne(namespace+".selectOneCategory",f_id);
	}
	@Override
	public List<Category> selectListCategory(SearchCriteria cri) {
		return sqlSession.selectList(namespace+".selectListCategory",cri);
	}
	@Override
	public void insertCategory(Category category) {
		sqlSession.insert(namespace+".insertCategory",category);
		
	}
	@Override
	public void updateCaetgory(Category category) {
		sqlSession.update(namespace+".updateCategory",category);
		
	}
	@Override
	public void deleteCategory(int f_id) {
		sqlSession.delete(namespace+".deleteCategory",f_id);
		
	}
	@Override
	public int countsCategory(SearchCriteria cri) {
		return sqlSession.selectOne(namespace+".countsCategory",cri);
	}
	@Override
	public int getCountBelowTwo() {
		return sqlSession.selectOne(namespace+".getCountBelowTwo");
	}
	@Override
	public String getCountAboveThree(Map<String,Object> map) {
		return sqlSession.selectOne(namespace+".getCountAboveThree",map);
	}
	@Override
	public int getBadge() {
		return sqlSession.selectOne(namespace+".getBadget");
	}
	@Override
	public List<CategoryNames> getCategoryNames() {
		return sqlSession.selectList(namespace+".getCategoryNames");
	}
	
	@Override
	public String getCategoryName(String f_ca_id) {
		return sqlSession.selectOne(namespace+".getCategoryName",f_ca_id);
	}
	


}
