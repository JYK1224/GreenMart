package com.green.mart.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.JumpoDao;
import com.green.mart.vo.work.SearchDeptVo;
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
}
