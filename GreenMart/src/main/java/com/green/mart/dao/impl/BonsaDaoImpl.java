package com.green.mart.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.BonsaDao;
import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchBonsaOrderVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseListVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchInputListVo;
import com.green.mart.vo.work.SearchJOrderListVo;
import com.green.mart.vo.work.SearchOrderListVo;
import com.green.mart.vo.work.SearchOrderVo;
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
	// 거래처 수정
	@Override
	public void deptUp(DeptVo dVo) {
		
		sqlSession.update("Bonsa.DeptUp", dVo);
	
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
	@Override
	public int insertOrder(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Bonsa.InsertOrder",map);
		return aftcnt;
	}
	@Override
	public List<SearchDeptVo> searchDeptList(String search) {
		String d_name = search.toUpperCase().trim();
		List<SearchDeptVo> list = sqlSession.selectList("Bonsa.SearchDeptList",d_name);
		return list;
	}
	@Override
	public List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map) {
		List<SearchOrderVo> list = sqlSession.selectList("Bonsa.searchOrderDeptList" , map);
		return list;
	}
	@Override
	public int insertInput(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Bonsa.InsertInput",map);
		return aftcnt;
	}
	@Override
	public int updateStock(Map<String, Object> map) {
		int aftcnt = sqlSession.update("Bonsa.UpdateInputStock",map);
		return aftcnt;
	}
	@Override
	public List<JumpoVo> searchJumpoList(String search) {
		String j_id = search.toUpperCase().trim();
		List<JumpoVo> list = sqlSession.selectList("Bonsa.SearchJumpoList",j_id);
		return list;
	}
	@Override
	public List<SearchProductVo> searchProductList(String text) {
		String p_id = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Bonsa.SearchProductList",p_id);
		return list;
	}
	@Override
	public List<SearchProductVo> searchProductList1(String text) {
		String p_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Bonsa.SearchProductList1",p_name);
		return list;
	}
	@Override
	public List<SearchOrderListVo> searchOrderList(Map<String, Object> map) {
		List<SearchOrderListVo> list = sqlSession.selectList("Bonsa.SearchOrderList" , map);
		return list;
	}
	@Override
	public List<SearchInputListVo> searchInputList(Map<String, Object> map) {
		List<SearchInputListVo> list = sqlSession.selectList("Bonsa.SearchInputList" , map);
		return list;
	}
	@Override
	public List<AssortmentVo> getDisuseSelect() {
		List<AssortmentVo> list = sqlSession.selectList("Bonsa.GetDisuseSelect" );
		return list;
	}
	@Override
	public List<SearchDisuseVo> searchDisUseList(String search) {
		List<SearchDisuseVo> list = sqlSession.selectList("Bonsa.SearchDisUseList",search);
		return list;
	}
	@Override
	public int insertDisuse(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Bonsa.InsertDisuse",map);
		return aftcnt;
	}
	@Override
	public int updateStockMinus(Map<String, Object> map) {
		int aftcnt = sqlSession.update("Bonsa.UpdateStockMinus",map);
		return aftcnt;
	}
	@Override
	public List<JumpoVo> getSearchJOrderJumpo() {
		List<JumpoVo> list = sqlSession.selectList("Bonsa.SearchJO");
		return list;
	}
	@Override
	public List<SearchJOrderListVo> searchJOrderList(Map<String, Object> map) {
		List<SearchJOrderListVo> list = null;
	    String j_name = (String) map.get("j_name"); 

	    if (j_name != "" && !j_name.isEmpty()) {
	        list = sqlSession.selectList("Bonsa.SearchJumpoOrderList", map);
	    } else {
	        list = sqlSession.selectList("Bonsa.SearchJumpoOrderList1", map);
	    }

	    return list;
	}
	@Override
	public List<JumpoVo> getSearchDisJumpo() {
		List<JumpoVo> list = sqlSession.selectList("Bonsa.SearchDis");
		return list;
	}
	@Override
	public List<SearchDisuseListVo> searchDisList(Map<String, Object> map) {
		List<SearchDisuseListVo> list = null;
	    String j_name = (String) map.get("j_name"); 

	    if (j_name != "" && !j_name.isEmpty()) {
	        list = sqlSession.selectList("Bonsa.SearchDisList", map);
	    } else {
	        list = sqlSession.selectList("Bonsa.SearchDisList1", map);
	    }

	    return list;
	}
	// 본사출고시 주문리스트 가져오기
	@Override
	public List<SearchBonsaOrderVo> searchBonsaOrderList(Map<String, Object> map) {
		List<SearchBonsaOrderVo> list = sqlSession.selectList("Bonsa.SearchBonsaOrderList",map);
		return list;
	}
	// 본사출고시 출고DB 반영
	@Override
	public int insertOutput(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Bonsa.InsertOutput",map);
		return aftcnt;
	}
	// 본사출고시 재고DB 반영
	@Override
	public int outputUpdateStock(Map<String, Object> map) {
		int aftcnt = sqlSession.update("Bonsa.OutputUpdateStock",map);
		return aftcnt;
	}
}
