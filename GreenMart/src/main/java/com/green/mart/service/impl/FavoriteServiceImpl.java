package com.green.mart.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.mart.dao.FavoriteDao;
import com.green.mart.service.FavoriteService;
import com.green.mart.vo.FavoriteVo;

@Service("favoriteService")
public class FavoriteServiceImpl implements FavoriteService{

	@Autowired
	FavoriteDao favoriteDao;
	
	// e_id 의 기존 즐찾 모두삭제
	@Override
	public int deleteFavorite(String e_id) {
		int aftcnt = favoriteDao.deleteFavorite(e_id);
		return aftcnt;
	}
	// 선택한 즐찾으로 추가
	@Override
	public int insertFavorite(Map<String, Object> map) {
		int aftcnt = favoriteDao.insertFavorite(map);
		return aftcnt;
	}
	// 즐겨찾기 메뉴 가져오기
	@Override
	public List<FavoriteVo> getFavoriteList(HashMap<String, Object> map3) {
		List<FavoriteVo> favoriteList = favoriteDao.getFavoriteList( map3 );
		return favoriteList;
	}
	
	

}
