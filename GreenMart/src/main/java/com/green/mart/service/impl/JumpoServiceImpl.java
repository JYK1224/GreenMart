package com.green.mart.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.JumpoDao;
import com.green.mart.service.JumpoService;
import com.green.mart.vo.work.SearchDeptVo;

@Service
public class JumpoServiceImpl implements JumpoService {
	
	@Autowired
	private JumpoDao jumpoDao;

	@Override
	public List<SearchDeptVo> searchDeptList(String search) {
		List<SearchDeptVo> list = jumpoDao.searchDeptList(search);
		return list;
	}

	@Override
	public int insertOrder(Map<String, Object> map) {
		int aftcnt = jumpoDao.insertOrder(map);
		return aftcnt;
	}

}
