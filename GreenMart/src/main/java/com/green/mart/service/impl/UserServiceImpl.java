package com.green.mart.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.UserDao;
import com.green.mart.service.UserService;
import com.green.mart.vo.EmployeeVo;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao  userDao;
	
	@Override
	public EmployeeVo getLogin(HashMap<String, Object> map) {
		EmployeeVo employeeVo = userDao.getLogin(map);
		return employeeVo;
	}

}
