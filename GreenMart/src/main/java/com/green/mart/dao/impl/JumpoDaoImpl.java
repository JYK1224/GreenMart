package com.green.mart.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.JumpoDao;
import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchOrderVo;
import com.green.mart.vo.work.SearchProductVo;

@Repository
public class JumpoDaoImpl implements JumpoDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SearchDeptVo> searchDeptList(String search) {
		String d_name = search.toUpperCase().trim();
		List<SearchDeptVo> list = sqlSession.selectList("Jumpo.SearchDeptList",d_name);
		return list;
	}

	@Override
	public int insertOrder(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Jumpo.InsertOrder",map);
		return aftcnt;
	}
	
	@Override
	public List<SearchProductVo> searchProductList(String text) {
		String p_id = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.SearchProductList",p_id);
		return list;
	}

	@Override
	public List<SearchProductVo> searchProductList1(String text) {
		String p_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.SearchProductList1",p_name);
		return list;
	}

	@Override
	public List<SearchDeptVo> searchBonsaDeptList(String search) {
		List<SearchDeptVo> list = sqlSession.selectList("Jumpo.SearchBonsaDeptList");
		return list;
	}

	@Override
	public int insertBonsaOrder(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Jumpo.InsertBonsaOrder",map);
		return aftcnt;
	}

	@Override
	public List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map) {
		List<SearchOrderVo> list = sqlSession.selectList("Jumpo.searchOrderDeptList" , map);
		return list;
	}

	@Override
	public int insertInput(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Jumpo.InsertInput",map);
		return aftcnt;
	}

	@Override
	public int updateStock(Map<String, Object> map) {
		int aftcnt = sqlSession.update("Jumpo.UpdateInputStock",map);
		return aftcnt;
	}

	@Override
	public int updateStockMinus(Map<String, Object> map) {
		int aftcnt = sqlSession.update("Jumpo.UpdateStockMinus",map);
		return aftcnt;
	}

	@Override
	public int insertDisuse(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Jumpo.InsertDisuse",map);
		return aftcnt;
	}

	@Override
	public List<SearchDisuseVo> searchDisUseList(String search) {
		System.out.println("search" +search );
		List<SearchDisuseVo> list = sqlSession.selectList("Jumpo.SearchDisUseList",search);
		return list;
	}

	@Override
	public List<AssortmentVo> getDisuseSelect() {
		List<AssortmentVo> list = sqlSession.selectList("Jumpo.GetDisuseSelect" );
		return list;
	}
	
	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		String d_name = search.toUpperCase().trim();
		List<DeptVo> list = sqlSession.selectList("Jumpo.SearchAllDeptList",d_name);
		return list;
	}
}
