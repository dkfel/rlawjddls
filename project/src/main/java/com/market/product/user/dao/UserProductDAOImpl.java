package com.market.product.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

// MemberDAO에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Repository
public class UserProductDAOImpl
{
	@Autowired
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	public UserProductDAOImpl()
	{
		System.out.println("MemberDAOImpl()생성자호출");
	}

}
