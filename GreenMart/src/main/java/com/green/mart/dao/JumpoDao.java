package com.green.mart.dao;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchOrderVo;
import com.green.mart.vo.work.SearchProductVo;

public interface JumpoDao {

	List<SearchDeptVo> searchDeptList(String search);

	int insertOrder(Map<String, Object> map);
	
	List<SearchProductVo> searchProductList(String text);

	List<SearchProductVo> searchProductList1(String text);

	List<SearchDeptVo> searchBonsaDeptList(String search);

	int insertBonsaOrder(Map<String, Object> map);

	List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map);

	int insertInput(Map<String, Object> map);

	int updateStock(Map<String, Object> map);

	int updateStockMinus(Map<String, Object> map);

	int insertDisuse(Map<String, Object> map);

	List<SearchDisuseVo> searchDisUseList(String search);

	List<AssortmentVo> getDisuseSelect();

}
