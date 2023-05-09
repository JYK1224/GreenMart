package com.green.mart.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.BonsaDao;
import com.green.mart.vo.DeptVo;

@Repository
public class BonsaDaoImpl implements BonsaDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		String d_name = search.toUpperCase().trim();
		List<DeptVo> list = sqlSession.selectList("Bonsa.SearchAllDeptList",d_name);
		return list;
	}

}
