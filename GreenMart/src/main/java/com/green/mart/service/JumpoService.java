package com.green.mart.service;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchProductVo;

public interface JumpoService {

	List<SearchDeptVo> searchDeptList(String search);

	int insertOrder(Map<String, Object> map);
	
	List<SearchProductVo> searchProductList(String text);

	List<SearchProductVo> searchProductList1(String text);

	List<SearchDeptVo> searchBonsaDeptList(String search);

	int insertBonsaOrder(Map<String, Object> map);

}
