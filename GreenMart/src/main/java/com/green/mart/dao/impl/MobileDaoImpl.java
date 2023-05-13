package com.green.mart.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.MobileDao;
import com.green.mart.vo.CustomerVo;

@Repository
public class MobileDaoImpl implements MobileDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public CustomerVo getCustomer(HashMap<String, String> map) {
		CustomerVo vo = sqlSession.selectOne("Mobile.GetCustomer", map);
		return vo;
	}

}
