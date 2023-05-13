package com.green.mart.service;

import java.util.Map;

public interface FavoriteService {
	// e_id 의 기존 즐찾 모두삭제
	int deleteFavorite(String e_id);
	// 선택한 즐찾으로 추가
	int insertFavorite(Map<String, Object> map);

}
