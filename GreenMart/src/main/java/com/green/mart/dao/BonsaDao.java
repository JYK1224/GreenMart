package com.green.mart.dao;

import java.util.List;

import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;

public interface BonsaDao {

	List<DeptVo> searchAllDeptList(String search);
	
	List<EmployeeVo> getEmpList();

	void insertEmp(EmployeeVo vo);

	EmployeeVo viewEmp(String e_id);

	void deleteEmp(EmployeeVo vo);

	EmployeeVo getEmp(String e_id);

	void updateEmp(EmployeeVo vo);

}
