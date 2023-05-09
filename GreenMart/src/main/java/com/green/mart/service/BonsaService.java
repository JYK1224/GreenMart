package com.green.mart.service;

import java.util.List;

import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;

public interface BonsaService {
	
	//거래처 조회
	List<DeptVo> searchAllDeptList(String search);
	
	//사원관리
	void insertEmployee(EmployeeVo vo);

	EmployeeVo viewEmp(String e_id);

	void deleteEmp(String e_id);

	EmployeeVo getEmp(String e_id);

	void updateEmp(EmployeeVo vo);
	
	List<EmployeeVo> getEmpList();

}
