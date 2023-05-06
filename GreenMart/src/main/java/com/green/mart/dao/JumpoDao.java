package com.green.mart.dao;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.work.SearchDeptVo;

public interface JumpoDao {

	List<SearchDeptVo> searchDeptList(String search);

	int insertOrder(Map<String, Object> map);

}
