package com.green.mart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.CustomerDao;
import com.green.mart.service.CustomerService;
import com.green.mart.vo.CustomerVo;

@Service("cutomerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDao customerDao;
	
	
	@Override
	public List<CustomerVo> getcustomerList() {
		
		List<CustomerVo> cutomerList = customerDao.getCustomerList(); 
		
	
		
		return cutomerList;
	}

	
	 @Override public void insertCustomer(CustomerVo vo) {
	 
		 System.out.println("wht : ? " + vo);
		 		
		
		  customerDao.insertCustomer(vo);
	 
	 }


	@Override
	public CustomerVo getCid(String c_id) {

		CustomerVo vo = customerDao.geCid(c_id);
		
		return vo;
	}


	public CustomerVo viewCustomer(String c_id) {
		
		CustomerVo cusVo = customerDao.viewCustomer(c_id);
		
		
		return cusVo;
	}


	@Override
	public void deleteCus(CustomerVo vo) {
		
		customerDao.delete(vo);
	}


	@Override
	public void updateCustomer(CustomerVo vo) {
		
		customerDao.updateCustomer(vo);
		
	}


	@Override
	public int getCustomerCount() {
		
		int getCustomerCoun = customerDao.getCustomerCoun();
		
		return getCustomerCoun;
	}
	 



}
