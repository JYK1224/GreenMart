package com.green.mart.service;

import java.util.HashMap;

import com.green.mart.vo.EmployeeVo;

public interface UserService {

	EmployeeVo getLogin(HashMap<String, Object> map);

}
