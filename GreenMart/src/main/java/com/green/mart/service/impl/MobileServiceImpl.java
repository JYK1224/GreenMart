package com.green.mart.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.MobileDao;
import com.green.mart.service.MobileService;
import com.green.mart.vo.CustomerVo;

@Service
public class MobileServiceImpl implements MobileService {
	
	@Autowired
	private MobileDao mobileDao;
	

	@Override
	public CustomerVo getCustomer(HashMap<String, String> map) {
		CustomerVo vo = mobileDao.getCustomer(map);
		return vo;
	}

}
