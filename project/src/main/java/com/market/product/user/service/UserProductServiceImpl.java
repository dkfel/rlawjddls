package com.market.product.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.product.user.dao.UserProductDAOImpl;

// MemberService에서 선언한 method를 override하는 구현 클래스이다
// MemberControllerImpl<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
@Service
public class UserProductServiceImpl
{

	//부모타입 참조변수 = new 하위클래스();
	@Autowired
	private com.market.product.user.dao.UserProductDAOImpl userProductDAOImpl;
	public void setProductDAOImpl(UserProductDAOImpl userProductDAOImpl)
	{
		this.userProductDAOImpl = userProductDAOImpl;
		System.out.println("UserProductDAOImpl=" + this.userProductDAOImpl);
	}

	public UserProductServiceImpl()
	{
		System.out.println("UserProductDAOImpl()생성자호출");
	}

}
