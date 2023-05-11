package com.green.mart.service;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchOrderVo;
import com.green.mart.vo.work.SearchProductVo;

public interface BonsaService {
	
	//거래처 조회
	List<DeptVo> searchAllDeptList(String search);
	
	void insertDept(DeptVo vo);
	
	DeptVo deptView(String d_id);
	
	void deptDel(String d_id);
	
	//사원관리
	void insertEmployee(EmployeeVo vo);

	EmployeeVo viewEmp(String e_id);

	void deleteEmp(String e_id);

	EmployeeVo getEmp(String e_id);

	void updateEmp(EmployeeVo vo);
	
	List<EmployeeVo> getEmpList();

	List<SearchProductVo> searchSalesList(Map<String, Object> map);

	List<JumpoVo> getSearchSaleJumpo();

	List<SearchProductVo> FullProductList3(String text);

	List<SearchProductVo> FullProductList1(String text);

	List<SearchProductVo> FullProductList2(String text);

	List<SearchProductVo> FullProductList4(String text);

	List<SearchProductVo> FullProductList5(String text);

	List<SearchProductVo> FullProductList6(String text);

	int insertOrder(Map<String, Object> map);

	List<SearchDeptVo> searchDeptList(String search);

	List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map);

	int insertInput(Map<String, Object> map);

	int updateStock(Map<String, Object> map);

	List<JumpoVo> searchJumpoList(String search);



}
