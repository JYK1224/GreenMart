package com.green.mart.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.JumpoDao;
import com.green.mart.service.JumpoService;
import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.ProductVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchInputListVo;
import com.green.mart.vo.work.SearchOrderListVo;
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
	// 결제시 상품정보조회
	@Override
	public ProductVo prodSearch(String p_seq) {
		ProductVo vo = jumpoDao.prodSearch( p_seq );
		return vo;
	}
	// 마일리지 창에서 고객정보 조회
	@Override
	public CustomerVo custSearch(String c_phone) {
		CustomerVo vo = jumpoDao.custSearch( c_phone );
		return vo;
	}
	@Override
	public int getSaleId() {
		int merchant_uid = jumpoDao.getSaleId();
		return merchant_uid;
	}

	@Override
	public void insertSale(Map<String, Object> map2) {
		jumpoDao.insertSale(map2);
		
	}
	@Override
	public List<SearchProductVo> FullProductList3(String text) {
		List<SearchProductVo> list = jumpoDao.FullProductList3(text);
		return list;
	}
	
	@Override
	public List<SearchProductVo> FullProductList1(String text) {
		List<SearchProductVo> list = jumpoDao.FullProductList1(text);
		return list;
	}
	
	
	
	@Override
	public List<SearchProductVo> FullProductList4(String text) {
		List<SearchProductVo> list = jumpoDao.FullProductList4(text);
		return list;
	}
	@Override
	public List<SearchProductVo> FullProductList5(String text) {
		List<SearchProductVo> list = jumpoDao.FullProductList5(text);
		return list;
	}
	@Override
	public List<SearchProductVo> FullProductList6(String text) {
		List<SearchProductVo> list = jumpoDao.FullProductList6(text);
		return list;
	}

	@Override
	public List<SearchProductVo> FullProductList2(String text) {
		List<SearchProductVo> list = jumpoDao.FullProductList2(text);
		return list;
	}
	@Override
	public List<JumpoVo> searchJumpoList(String search) {
		List<JumpoVo> list = jumpoDao.searchJumpoList(search);
		return list;
	}

	@Override
	public List<JumpoVo> getSearchSaleJumpo() {
		List<JumpoVo> list = jumpoDao.getSearchSaleJumpo();
		return list;
	}

	@Override
	public List<SearchProductVo> searchSalesList(Map<String, Object> map) {
		List<SearchProductVo> list = jumpoDao.searchSalesList(map);
		return list;
	}
	@Override
	public List<SearchOrderListVo> searchOrderList(Map<String, Object> map) {
		List<SearchOrderListVo> list = jumpoDao.searchOrderList(map);
		return list;
	}

	@Override
	public List<SearchInputListVo> searchInputList(Map<String, Object> map) {
		List<SearchInputListVo> list = jumpoDao.searchInputList(map);
		return list;
	}

}
