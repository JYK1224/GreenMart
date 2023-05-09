package com.green.mart.service;

import java.util.List;

import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;

public interface BonsaService {

	List<DeptVo> searchAllDeptList(String search);
	
	void insertEmployee(EmployeeVo vo);

	EmployeeVo viewEmp(String e_id);

	void deleteEmp(EmployeeVo vo);

	EmployeeVo getEmp(String e_id);

	void updateEmp(EmployeeVo vo);
	
	List<EmployeeVo> getEmpList();

}
