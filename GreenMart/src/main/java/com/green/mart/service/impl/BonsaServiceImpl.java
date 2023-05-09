package com.green.mart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.BonsaDao;
import com.green.mart.service.BonsaService;
import com.green.mart.vo.DeptVo;

@Service
public class BonsaServiceImpl implements BonsaService {

	@Autowired
	private BonsaDao bonsaDao;

	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		List<DeptVo> list = bonsaDao.searchAllDeptList(search);
		return list;
	}

}
