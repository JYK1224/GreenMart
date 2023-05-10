package com.green.mart.service;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.ProductVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchInputListVo;
import com.green.mart.vo.work.SearchOrderListVo;
import com.green.mart.vo.work.SearchOrderVo;
import com.green.mart.vo.work.SearchProductVo;

public interface JumpoService {

	List<SearchDeptVo> searchDeptList(String search);

	int insertOrder(Map<String, Object> map);
	
	List<SearchProductVo> searchProductList(String text);

	List<SearchProductVo> searchProductList1(String text);

	List<SearchDeptVo> searchBonsaDeptList(String search);

	int insertBonsaOrder(Map<String, Object> map);

	List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map);

	int updateStock(Map<String, Object> map);

	int insertInput(Map<String, Object> map);

	List<AssortmentVo> getDisuseSelect();

	List<SearchDisuseVo> searchDisUseList(String search);

	int insertDisuse(Map<String, Object> map);

	int updateStockMinus(Map<String, Object> map);
	
	List<DeptVo> searchAllDeptList(String search);
	// 결제시 상품정보조회
	ProductVo prodSearch(String p_seq);
	// 적립시 고객정보조회
	CustomerVo custSearch(String c_phone);
	
	List<SearchProductVo> FullProductList3(String text);
	
	List<SearchProductVo> FullProductList1(String text);
	
	List<SearchProductVo> FullProductList4(String text);
	
	List<SearchProductVo> FullProductList5(String text);
	
	List<SearchProductVo> FullProductList6(String text);

	List<SearchProductVo> FullProductList2(String text);
	
	List<JumpoVo> searchJumpoList(String search);

	List<JumpoVo> getSearchSaleJumpo();
	
	List<SearchProductVo> searchSalesList(Map<String, Object> map);
	
	List<SearchOrderListVo> searchOrderList(Map<String, Object> map);

	List<SearchInputListVo> searchInputList(Map<String, Object> map);


}
