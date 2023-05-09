package com.green.mart.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.JumpoDao;
import com.green.mart.service.JumpoService;
import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchOrderVo;
import com.green.mart.vo.work.SearchProductVo;

@Service
public class JumpoServiceImpl implements JumpoService {
	
	@Autowired
	private JumpoDao jumpoDao;

	@Override
	public List<SearchDeptVo> searchDeptList(String search) {
		List<SearchDeptVo> list = jumpoDao.searchDeptList(search);
		return list;
	}

	@Override
	public int insertOrder(Map<String, Object> map) {
		int aftcnt = jumpoDao.insertOrder(map);
		return aftcnt;
	}
	@Override
	public List<SearchProductVo> searchProductList(String text) {
		List<SearchProductVo> list = jumpoDao.searchProductList(text);
		return list;
	}

	@Override
	public List<SearchProductVo> searchProductList1(String text) {
		List<SearchProductVo> list = jumpoDao.searchProductList1(text);
		return list;
	}

	@Override
	public List<SearchDeptVo> searchBonsaDeptList(String search) {
		List<SearchDeptVo> list = jumpoDao.searchBonsaDeptList(search);
		return list;
	}

	@Override
	public int insertBonsaOrder(Map<String, Object> map) {
		int aftcnt = jumpoDao.insertBonsaOrder(map);
		return aftcnt;
	}

	@Override
	public List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map) {
		List<SearchOrderVo> list = jumpoDao.searchOrderDeptList(map);
		return list;
	}

	@Override
	public int updateStock(Map<String, Object> map) {
		int aftcnt = jumpoDao.insertInput(map);
		return aftcnt;
	}

	@Override
	public int insertInput(Map<String, Object> map) {
		int aftcnt = jumpoDao.updateStock(map);
		return aftcnt;
	}

	@Override
	public List<AssortmentVo> getDisuseSelect() {
		List<AssortmentVo> list = jumpoDao.getDisuseSelect();
		return list;
	}

	@Override
	public List<SearchDisuseVo> searchDisUseList(String search) {
		List<SearchDisuseVo> list = jumpoDao.searchDisUseList(search);
		return list;
	}

	@Override
	public int insertDisuse(Map<String, Object> map) {
		int aftcnt = jumpoDao.insertDisuse(map);
		return aftcnt;
	}

	@Override
	public int updateStockMinus(Map<String, Object> map) {
		int aftcnt = jumpoDao.updateStockMinus(map);
		return aftcnt;
	}
	
	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		List<DeptVo> list = jumpoDao.searchAllDeptList(search);
		return list;
	}

}
