package com.coresec.admin.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EducationDoImpl implements EducationDo {
	@Inject SqlSession sqlSession;
	private final String namespace="com.coresec.admin.mapper.educationMapper";

}
