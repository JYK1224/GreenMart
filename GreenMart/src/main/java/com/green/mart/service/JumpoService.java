package com.green.mart.service;

import java.util.List;

import com.green.mart.vo.work.SearchDeptVo;

public interface JumpoService {

	List<SearchDeptVo> searchDeptList(String search);

}
