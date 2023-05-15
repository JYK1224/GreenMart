package com.green.mart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchMobileProductVo;

public interface MobileService {

	CustomerVo getCustomer(HashMap<String, String> map);

	CustomerVo getCustomer2(HashMap<String, Object> map);

	List<JumpoVo> getDisuseSelect();

	SearchMobileProductVo searchProductList(Map<String, Object> map);


}
