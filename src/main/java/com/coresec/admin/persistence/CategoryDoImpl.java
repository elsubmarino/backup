package com.coresec.admin.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Category;
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
	public int countsCategory() {
		return sqlSession.selectOne(namespace+".countsCategory");
	}

}
