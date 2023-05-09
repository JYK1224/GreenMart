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
	// 거래처 조회
	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		String d_name = search.toUpperCase().trim();
		List<DeptVo> list = sqlSession.selectList("Bonsa.SearchAllDeptList",d_name);
		return list;
	}
	// 사원관리 - 조회
	@Override
	public List<EmployeeVo> getEmpList() {

		List<EmployeeVo> empList = sqlSession.selectList("Bonsa.EmpList");
		
		return empList;
	}
	//사원관리 - 등록
	@Override
	public void insertEmp(EmployeeVo vo) {
		
		sqlSession.insert("Bonsa.EmpInsert",vo);
		
	}
	//사원관리 - 뷰
	@Override
	public EmployeeVo viewEmp(String e_id) {
		
		EmployeeVo empVo = sqlSession.selectOne("Bonsa.EmpView", e_id);
		
		return empVo;
	}
	//사원관리 - 삭제
	@Override
	public void deleteEmp(String e_id) {
		
		sqlSession.delete("Bonsa.EmpDelete", e_id);
		
	}
	//사원관리 - 수정(뷰)
	@Override
	public EmployeeVo getEmp(String e_id) {

		EmployeeVo empVo = sqlSession.selectOne("Bonsa.EmpView", e_id);
		
		return empVo;
	}
	//사원관리 - 수정
	@Override
	public void updateEmp(EmployeeVo vo) {
		
		sqlSession.update("Bonsa.EmpUpdate", vo);
		
	}
}
