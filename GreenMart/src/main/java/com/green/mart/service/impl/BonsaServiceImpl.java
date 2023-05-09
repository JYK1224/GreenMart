package com.green.mart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.BonsaDao;
import com.green.mart.service.BonsaService;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;

@Service
public class BonsaServiceImpl implements BonsaService {

	@Autowired
	private BonsaDao bonsaDao;

	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		List<DeptVo> list = bonsaDao.searchAllDeptList(search);
		return list;
	}
	@Override
	public List<EmployeeVo> getEmpList() {
		
		List<EmployeeVo> empList = bonsaDao.getEmpList();
		
		return empList;
	}
	@Override
	public void insertEmployee(EmployeeVo vo) {
		
		bonsaDao.insertEmp(vo);
	}
	@Override
	public EmployeeVo viewEmp(String e_id) {
		
		EmployeeVo empVo = bonsaDao.viewEmp(e_id);
		
		return empVo;
	}
	@Override
	public void deleteEmp(EmployeeVo vo) {
		
		bonsaDao.deleteEmp(vo);
		
	}
	@Override
	public EmployeeVo getEmp(String e_id) {
		
		EmployeeVo empVo = bonsaDao.getEmp(e_id);
		
		return empVo;
	}
	@Override
	public void updateEmp(EmployeeVo vo) {
		
		bonsaDao.updateEmp(vo);
		
	}
	
	
}
