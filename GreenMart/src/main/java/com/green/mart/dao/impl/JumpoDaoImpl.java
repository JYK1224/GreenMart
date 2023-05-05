package com.green.mart.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.JumpoDao;
import com.green.mart.vo.work.SearchDeptVo;

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

}