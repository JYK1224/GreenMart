package com.green.mart.dao;

import java.util.List;

import com.green.mart.vo.work.SearchDeptVo;

public interface JumpoDao {

	List<SearchDeptVo> searchDeptList(String search);

}
