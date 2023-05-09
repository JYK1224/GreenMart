package com.green.mart.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.BonsaDao;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;

@Repository
public class BonsaDaoImpl implements BonsaDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		String d_name = search.toUpperCase().trim();
		List<DeptVo> list = sqlSession.selectList("Bonsa.SearchAllDeptList",d_name);
		return list;
	}
	
	@Override
	public List<EmployeeVo> getEmpList() {

		List<EmployeeVo> empList = sqlSession.selectList("Bonsa.EmpList");
		
		return empList;
	}
	@Override
	public void insertEmp(EmployeeVo vo) {
		
		sqlSession.insert("Bonsa.EmpInsert",vo);
		
	}
	@Override
	public EmployeeVo viewEmp(String e_id) {
		
		EmployeeVo empVo = sqlSession.selectOne("Bonsa.EmpView", e_id);
		
		return empVo;
	}
	@Override
	public void deleteEmp(EmployeeVo vo) {
		
		sqlSession.delete("Bonsa.EmpDelete", vo);
		
	}

	@Override
	public EmployeeVo getEmp(String e_id) {

		EmployeeVo empVo = sqlSession.selectOne("Bonsa.EmpView", e_id);
		
		return empVo;
	}
	@Override
	public void updateEmp(EmployeeVo vo) {
		
		sqlSession.update("Bonsa.EmpUpdate", vo);
		
	}
}
