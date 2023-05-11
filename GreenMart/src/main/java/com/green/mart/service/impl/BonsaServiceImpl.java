package com.green.mart.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.BonsaDao;
import com.green.mart.service.BonsaService;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchProductVo;

@Service
public class BonsaServiceImpl implements BonsaService {

	@Autowired
	private BonsaDao bonsaDao;
	// 거래처조회
	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		List<DeptVo> list = bonsaDao.searchAllDeptList(search);
		return list;
	}
	// 거래처 등록
	@Override
	public void insertDept(DeptVo vo) {
		
		bonsaDao.insertDept(vo);
		
	}
	// 거래처 뷰
	@Override
	public DeptVo deptView(String d_id) {
		
		DeptVo dVo = bonsaDao.deptView(d_id);
		
		return dVo;
	}
	// 거래처 삭제
	@Override
	public void deptDel(String d_id) {
		
		bonsaDao.deptDel(d_id);
	}
	
	
	// 사원관리 - 조회
	@Override
	public List<EmployeeVo> getEmpList() {
		
		List<EmployeeVo> empList = bonsaDao.getEmpList();
		
		return empList;
	}
	// 사원관리 - 추가
	@Override
	public void insertEmployee(EmployeeVo vo) {
		
		bonsaDao.insertEmp(vo);
	}
	// 사원관리 - 뷰
	@Override
	public EmployeeVo viewEmp(String e_id) {
		
		EmployeeVo empVo = bonsaDao.viewEmp(e_id);
		
		return empVo;
	}
	//사원관리 - 삭제
	@Override
	public void deleteEmp(String e_id) {
		
		bonsaDao.deleteEmp(e_id);
		
	}
	// 사원관리 - 수정(뷰)
	@Override
	public EmployeeVo getEmp(String e_id) {
		
		EmployeeVo empVo = bonsaDao.getEmp(e_id);
		
		return empVo;
	}
	// 사원관리 - 수정
	@Override
	public void updateEmp(EmployeeVo vo) {
		
		bonsaDao.updateEmp(vo);
		
	}
	@Override
	public List<JumpoVo> getSearchSaleJumpo() {
		List<JumpoVo> list = bonsaDao.getSearchSaleJumpo();
		return list;
	}

	@Override
	public List<SearchProductVo> searchSalesList(Map<String, Object> map) {
		List<SearchProductVo> list = bonsaDao.searchSalesList(map);
		return list;
	}
	
}
