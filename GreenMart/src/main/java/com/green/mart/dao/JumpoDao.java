package com.green.mart.dao;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchProductVo;

public interface JumpoDao {

	List<SearchDeptVo> searchDeptList(String search);

	int insertOrder(Map<String, Object> map);
	
	List<SearchProductVo> searchProductList(String text);

	List<SearchProductVo> searchProductList1(String text);

}
