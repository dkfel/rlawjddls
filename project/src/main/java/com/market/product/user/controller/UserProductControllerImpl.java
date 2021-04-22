package com.market.product.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.market.product.user.service.UserProductServiceImpl;

public class UserProductControllerImpl
{
	//	@Autowired
	//	private MainDTO mainDTO;

	//field
	@Autowired
	private UserProductServiceImpl userProductServiceImpl;

	public void setProductServiceImpl(
			UserProductServiceImpl userProductServiceImpl)
	{
		System.out.println("setProductServiceImpl() 진입");
		this.userProductServiceImpl = userProductServiceImpl;
	}

	//상품목록 보여주기
	@RequestMapping(value = "product/listProduct.do", method =
	{RequestMethod.POST, RequestMethod.GET})
	public String listProduct(HttpServletRequest request,
			HttpServletResponse response) throws Exception
	{
		/* 참고 controller의 요청함수의 return type이 String이면
		 * viewResolver에서 설정한 뷰의 prefix와 suffix를 제외한
		 * 나머지 부분을 String으로 제시하면 된다
		 * =>기존의 jsp방식과 동일 */
		//1.parameter받기
		//2.비즈니스로직수행<->MemberServiceImpl<->MemberDAOImpl<->myBatis<->db
		//3.Model
		//4.View
		return "product/listProduct";
	}

}
