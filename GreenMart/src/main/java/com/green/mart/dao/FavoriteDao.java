package com.green.mart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.green.mart.vo.FavoriteVo;

public interface FavoriteDao {
	
	// e_id 의 기존 즐찾 모두삭제
	int deleteFavorite(String e_id);
	// 선택한 즐찾으로 추가
	int insertFavorite(Map<String, Object> map);
	// 즐겨찾기 메뉴 가져오기
	List<FavoriteVo> getFavoriteList(HashMap<String, Object> map3);

}
