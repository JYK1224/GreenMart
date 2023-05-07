package com.green.mart.dao;

import java.util.List;

import com.green.mart.vo.CustomerVo;

public interface CustomerDao {

	List<CustomerVo> getCustomerList();


	void insertCustomer(CustomerVo vo);


	CustomerVo geCid(String c_id);

}
