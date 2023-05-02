package com.green.mart.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.AnnDao;
import com.green.mart.vo.AnniversaryVo;



@Repository
public class AnnDaoImpl implements AnnDao {
	
	
	@Autowired
	@Resource(name = "jumpo")
	private SqlSession jumpo;

	@Override
	public List<AnniversaryVo> getAnniversaryVoList() {
		List<AnniversaryVo> list =  jumpo.selectList("Ann.GetAnniversaryList");
		return list;
	}

}
