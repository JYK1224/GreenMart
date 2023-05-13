package com.green.mart.dao;

import java.util.HashMap;

import com.green.mart.vo.CustomerVo;

public interface MobileDao {

	CustomerVo getCustomer(HashMap<String, String> map);

}
