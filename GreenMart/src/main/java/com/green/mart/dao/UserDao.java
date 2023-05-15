package com.green.mart.dao;

import java.util.HashMap;

import com.green.mart.vo.EmployeeVo;

public interface UserDao {

	EmployeeVo getLogin(HashMap<String, Object> map);

}
