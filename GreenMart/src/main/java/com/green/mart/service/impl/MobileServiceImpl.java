package com.green.mart.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.MobileDao;
import com.green.mart.service.MobileService;
import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchMobileProductVo;

@Service
public class MobileServiceImpl implements MobileService {
	
	@Autowired
	private MobileDao mobileDao;
	

	@Override
	public CustomerVo getCustomer(HashMap<String, String> map) {
		CustomerVo vo = mobileDao.getCustomer(map);
		return vo;
	}

	@Override
	public CustomerVo getCustomer2(HashMap<String, Object> map) {
		CustomerVo vo = mobileDao.getCustomer2(map);
		return vo;
	}


	@Override
	public List<JumpoVo> getDisuseSelect() {
		List<JumpoVo> vo = mobileDao.getDisuseSelect();
		return vo;
	}

	@Override
	public SearchMobileProductVo searchProductList(Map<String, Object> map) {
		SearchMobileProductVo vo = mobileDao.searchProductList(map);
		return vo;
	}


}
