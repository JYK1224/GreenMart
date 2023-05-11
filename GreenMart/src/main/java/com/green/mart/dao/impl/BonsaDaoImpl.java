package com.green.mart.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.BonsaDao;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchProductVo;

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
	// 거래처 등록
	@Override
	public void insertDept(DeptVo vo) {
		
		sqlSession.insert("Bonsa.DeptInset", vo);
	}
	// 거래처 뷰
	@Override
	public DeptVo deptView(String d_id) {
		
		DeptVo dVo = sqlSession.selectOne("Bonsa.DeptView", d_id);
		
		return dVo;
	}
	// 거래처 삭제
	@Override
	public void deptDel(String d_id) {
		
		sqlSession.delete("Bonsa.DeptDel", d_id);
		
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
	@Override
	public List<JumpoVo> getSearchSaleJumpo() {
		List<JumpoVo> list = sqlSession.selectList("Bonsa.SearchSale");
		return list;
	}

	@Override
	public List<SearchProductVo> searchSalesList(Map<String, Object> map) {
	    List<SearchProductVo> list = null;
	    String j_name = (String) map.get("j_name"); // Retrieve the value from the map

	    if (j_name != "" && !j_name.isEmpty()) {
	        list = sqlSession.selectList("Bonsa.SearchSalesList", map);
	    } else {
	        list = sqlSession.selectList("Bonsa.SearchSalesList1", map);
	    }

	    return list;
	}
	@Override
	public List<SearchProductVo> FullProductList3(String text) {
		String d_name = text.toUpperCase().trim();
		List<SearchProductVo> list = sqlSession.selectList("Bonsa.FullProductList3",d_name);
		System.out.println("dddd : " + list);
		return list;
	}
	
	@Override
	public List<SearchProductVo> FullProductList1(String text) {
		String d_name = text.toUpperCase().trim();
		List<SearchProductVo> list = sqlSession.selectList("Bonsa.FullProductList1",d_name);
		System.out.println("dddd : " + list);
		return list;
	}
	
	
	@Override
	public List<SearchProductVo> FullProductList4(String text) {
		String a_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Bonsa.FullProductList4",a_name);
		System.out.println("dddd : " + list);
		return list;
	}
	
	@Override
	public List<SearchProductVo> FullProductList5(String text) {
		String d_name = text.toUpperCase().trim();
		List<SearchProductVo> list = sqlSession.selectList("Bonsa.FullProductList5",d_name);
		System.out.println("dddd : " + list);
		return list;
	}
	
	@Override
	public List<SearchProductVo> FullProductList6(String text) {
		String a_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Bonsa.FullProductList6",a_name);
		System.out.println("dddd : " + list);
		return list;
	}

	@Override
	public List<SearchProductVo> FullProductList2(String text) {
		String a_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Bonsa.FullProductList2",a_name);
		return list;
	}
}
