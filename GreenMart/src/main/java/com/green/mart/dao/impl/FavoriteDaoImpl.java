package com.green.mart.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.FavoriteDao;
import com.green.mart.vo.FavoriteVo;

@Repository("favoriteDao")
public class FavoriteDaoImpl implements FavoriteDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int deleteFavorite(String e_id) {
		int aftcnt =sqlSession.delete("Favorite.DeleteFavorite", e_id);
		return aftcnt;
	}

	@Override
	public int insertFavorite(Map<String, Object> map) {
		int aftcnt =sqlSession.insert("Favorite.InsertFavorite", map);
		return aftcnt;
	}
	// 즐겨찾기 메뉴 가져오기
	@Override
	public List<FavoriteVo> getFavoriteList(HashMap<String, Object> map3) {
		
		List<FavoriteVo> favoriteList = sqlSession.selectList("Favorite.GetFavoriteList", map3 );
		
		return favoriteList;
	}

}
