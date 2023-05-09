package com.green.mart.dao;

import java.util.List;

import com.green.mart.vo.DeptVo;

public interface BonsaDao {

	List<DeptVo> searchAllDeptList(String search);

}
