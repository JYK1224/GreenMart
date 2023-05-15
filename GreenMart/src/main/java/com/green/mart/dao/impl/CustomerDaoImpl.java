package com.green.mart.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.CustomerDao;
import com.green.mart.vo.CustomerVo;

@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CustomerVo> getCustomerList() {
	
		List<CustomerVo> customerList = sqlSession.selectList("Cus.CustomerList");	
		
		return customerList;
	}



	@Override
	public void insertCustomer(CustomerVo vo) {
		sqlSession.insert("Cus.CustomerInsert", vo);
		
	}



	@Override
	public CustomerVo geCid(String c_id) {
		CustomerVo vo = sqlSession.selectOne("Cus.GetCid", c_id);
		
		return vo;
	}



	@Override
	public CustomerVo viewCustomer(String c_id) {
		
		CustomerVo cusVo = sqlSession.selectOne("Cus.ViewCid", c_id);
		
		System.out.println("cusvodao : : " + cusVo);
		
		return cusVo;
	}



	@Override
	public void delete(String c_id) {
		
		sqlSession.delete("Cus.DeleteCid", c_id);
	
	}



	@Override
	public void updateCustomer(CustomerVo vo) {
		
		sqlSession.update("Cus.UpdateCid",vo);
		
	}



	@Override
	public int getCustomerCoun() {

		int getCustomerCoun = sqlSession.selectOne("Cus.GetCid");
		
		return getCustomerCoun;
	}

}
