package com.green.mart.dao;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.ProductVo;
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
	
	List<DeptVo> searchAllDeptList(String search);
	// 결제시 상품정보조회
	ProductVo prodSearch(String p_seq);
	// 마일리지 창에서 고객정보 조회
	CustomerVo custSearch(String c_phone);
}
