package com.green.mart.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.MobileDao;
import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchMobileProductVo;

@Repository
public class MobileDaoImpl implements MobileDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public CustomerVo getCustomer(HashMap<String, String> map) {
		CustomerVo vo = sqlSession.selectOne("Mobile.GetCustomer", map);
		return vo;
	}

	@Override
	public CustomerVo getCustomer2(HashMap<String, Object> map) {
		CustomerVo vo = sqlSession.selectOne("Mobile.GetCustomer2", map);
		return vo;
	}

	@Override
	public List<JumpoVo> getDisuseSelect() {
		List<JumpoVo> vo = sqlSession.selectList("Mobile.selectList");
		return vo;
	}

	@Override
	public SearchMobileProductVo searchProductList(Map<String, Object> map) {
		SearchMobileProductVo vo = sqlSession.selectOne("Mobile.searchProductList",map);
		return vo;
	}

}
