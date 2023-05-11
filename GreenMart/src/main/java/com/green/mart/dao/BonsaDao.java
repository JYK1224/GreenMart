package com.green.mart.dao;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchProductVo;

public interface BonsaDao {
	
	//거래처 조회
	List<DeptVo> searchAllDeptList(String search);
	
	void insertDept(DeptVo vo);
	
	void deptDel(String d_id);
	
	DeptVo deptView(String d_id);
	
	//사원관리
	List<EmployeeVo> getEmpList();

	void insertEmp(EmployeeVo vo);

	EmployeeVo viewEmp(String e_id);

	void deleteEmp(String e_id);

	EmployeeVo getEmp(String e_id);

	void updateEmp(EmployeeVo vo);

	List<JumpoVo> getSearchSaleJumpo();

	List<SearchProductVo> searchSalesList(Map<String, Object> map);

}
