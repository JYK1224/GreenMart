package com.green.mart.dao;

import java.util.List;

import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;

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

}
