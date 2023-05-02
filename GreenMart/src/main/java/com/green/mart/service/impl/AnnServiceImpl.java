package com.green.mart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.AnnDao;
import com.green.mart.service.AnnService;
import com.green.mart.vo.AnniversaryVo;


@Service
public class AnnServiceImpl implements AnnService {
	
	@Autowired
	private AnnDao annDao;

	@Override
	public List<AnniversaryVo> getAnniversaryVoList() {
		List<AnniversaryVo> list = annDao.getAnniversaryVoList();
		return list;
	}

}
