package com.green.mart.service;

import java.util.List;

import com.green.mart.vo.DeptVo;

public interface BonsaService {

	List<DeptVo> searchAllDeptList(String search);

}
