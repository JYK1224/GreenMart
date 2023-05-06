package com.green.mart.service;

import java.util.List;
import java.util.Map;

import com.green.mart.vo.work.SearchDeptVo;

public interface JumpoService {

	List<SearchDeptVo> searchDeptList(String search);

	int insertOrder(Map<String, Object> map);

}
