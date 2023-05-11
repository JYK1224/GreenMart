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
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchOrderVo;
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
	@Override
	public List<SearchProductVo> FullProductList3(String text) {
		List<SearchProductVo> list = bonsaDao.FullProductList3(text);
		return list;
	}
	
	@Override
	public List<SearchProductVo> FullProductList1(String text) {
		List<SearchProductVo> list = bonsaDao.FullProductList1(text);
		return list;
	}
	
	
	
	@Override
	public List<SearchProductVo> FullProductList4(String text) {
		List<SearchProductVo> list = bonsaDao.FullProductList4(text);
		return list;
	}
	@Override
	public List<SearchProductVo> FullProductList5(String text) {
		List<SearchProductVo> list = bonsaDao.FullProductList5(text);
		return list;
	}
	@Override
	public List<SearchProductVo> FullProductList6(String text) {
		List<SearchProductVo> list = bonsaDao.FullProductList6(text);
		return list;
	}

	@Override
	public List<SearchProductVo> FullProductList2(String text) {
		List<SearchProductVo> list = bonsaDao.FullProductList2(text);
		return list;
	}
	@Override
	public int insertOrder(Map<String, Object> map) {
		int aftcnt = bonsaDao.insertOrder(map);
		return aftcnt;
	}
	@Override
	public List<SearchDeptVo> searchDeptList(String search) {
		List<SearchDeptVo> list = bonsaDao.searchDeptList(search);
		return list;
	}
	@Override
	public List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map) {
		List<SearchOrderVo> list = bonsaDao.searchOrderDeptList(map);
		return list;
	}
	@Override
	public int insertInput(Map<String, Object> map) {
		int aftcnt = bonsaDao.insertInput(map);
		return aftcnt;
	}
	@Override
	public int updateStock(Map<String, Object> map) {
		int aftcnt = bonsaDao.updateStock(map);
		return aftcnt;
	}
	@Override
	public List<JumpoVo> searchJumpoList(String search) {
		List<JumpoVo> list = bonsaDao.searchJumpoList(search);
		return list;
	}
	@Override
	public List<SearchProductVo> searchProductList(String text) {
		List<SearchProductVo> list = bonsaDao.searchProductList(text);
		return list;
	}
	@Override
	public List<SearchProductVo> searchProductList1(String text) {
		List<SearchProductVo> list = bonsaDao.searchProductList1(text);
		return list;
	}
}
