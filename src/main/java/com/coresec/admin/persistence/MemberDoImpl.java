package com.coresec.admin.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.coresec.admin.domain.Member;

@Repository
public class MemberDoImpl implements MemberDo{
	
	@Inject 
	SqlSession sqlSession;
	
	private final String namespace="com.coresec.admin.mapper.memberMapper";

	@Override
	public Member auth(Member member) {
		System.out.println(member.getId()+" "+member.getPassword());
		return sqlSession.selectOne(namespace+".auth",member);
	}

}
