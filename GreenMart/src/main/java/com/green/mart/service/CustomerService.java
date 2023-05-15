package com.green.mart.service;

import java.util.List;

import com.green.mart.vo.CustomerVo;

public interface CustomerService {

	List<CustomerVo> getcustomerList();

	void insertCustomer(CustomerVo vo);

	CustomerVo getCid(String cId);

	CustomerVo viewCustomer(String c_id);

	void deleteCus(String c_id);

	void updateCustomer(CustomerVo vo);

	int getCustomerCount();

}
