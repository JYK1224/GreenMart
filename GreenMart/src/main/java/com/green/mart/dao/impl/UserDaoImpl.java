package com.green.mart.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.UserDao;
import com.green.mart.vo.EmployeeVo;

@Repository("userDao")
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession  sqlSession;
	
	@Override
	public EmployeeVo getLogin(HashMap<String, Object> map) {
		EmployeeVo employeeVo = sqlSession.selectOne("User.GetLogin", map);
		return employeeVo;
	}

}
