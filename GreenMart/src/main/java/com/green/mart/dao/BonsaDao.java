package com.green.mart.dao;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseListVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchInputListVo;
import com.green.mart.vo.work.SearchJOrderListVo;
import com.green.mart.vo.work.SearchOrderListVo;
import com.green.mart.vo.work.SearchOrderVo;
import com.green.mart.vo.work.SearchProductVo;

public interface BonsaDao {
	
	//거래처 조회
	List<DeptVo> searchAllDeptList(String search);
	
	void insertDept(DeptVo vo);
	
	void deptDel(String d_id);
	
	DeptVo deptView(String d_id);
	
	void deptUp(DeptVo dVo);
	//사원관리
	List<EmployeeVo> getEmpList();

	void insertEmp(EmployeeVo vo);

	EmployeeVo viewEmp(String e_id);

	void deleteEmp(String e_id);

	EmployeeVo getEmp(String e_id);

	void updateEmp(EmployeeVo vo);

	List<JumpoVo> getSearchSaleJumpo();

	List<SearchProductVo> searchSalesList(Map<String, Object> map);

	List<SearchProductVo> FullProductList3(String text);

	List<SearchProductVo> FullProductList1(String text);

	List<SearchProductVo> FullProductList4(String text);

	List<SearchProductVo> FullProductList5(String text);

	List<SearchProductVo> FullProductList6(String text);

	List<SearchProductVo> FullProductList2(String text);

	int insertOrder(Map<String, Object> map);

	List<SearchDeptVo> searchDeptList(String search);

	List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map);

	int insertInput(Map<String, Object> map);

	int updateStock(Map<String, Object> map);

	List<JumpoVo> searchJumpoList(String search);

	List<SearchProductVo> searchProductList(String text);

	List<SearchProductVo> searchProductList1(String text);

	List<SearchOrderListVo> searchOrderList(Map<String, Object> map);

	List<SearchInputListVo> searchInputList(Map<String, Object> map);

	List<AssortmentVo> getDisuseSelect();

	List<SearchDisuseVo> searchDisUseList(String search);

	int insertDisuse(Map<String, Object> map);

	int updateStockMinus(Map<String, Object> map);

	List<JumpoVo> getSearchJOrderJumpo();

	List<SearchJOrderListVo> searchJOrderList(Map<String, Object> map);

	List<JumpoVo> getSearchDisJumpo();

	List<SearchDisuseListVo> searchDisList(Map<String, Object> map);
}
