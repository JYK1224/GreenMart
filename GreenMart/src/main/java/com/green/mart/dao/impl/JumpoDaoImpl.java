package com.green.mart.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.mart.dao.JumpoDao;
import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.ProductVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchOrderVo;
import com.green.mart.vo.work.SearchProductVo;

@Repository
public class JumpoDaoImpl implements JumpoDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<SearchDeptVo> searchDeptList(String search) {
		String d_name = search.toUpperCase().trim();
		List<SearchDeptVo> list = sqlSession.selectList("Jumpo.SearchDeptList",d_name);
		return list;
	}

	@Override
	public int insertOrder(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Jumpo.InsertOrder",map);
		return aftcnt;
	}
	
	@Override
	public List<SearchProductVo> searchProductList(String text) {
		String p_id = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.SearchProductList",p_id);
		return list;
	}

	@Override
	public List<SearchProductVo> searchProductList1(String text) {
		String p_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.SearchProductList1",p_name);
		return list;
	}

	@Override
	public List<SearchDeptVo> searchBonsaDeptList(String search) {
		List<SearchDeptVo> list = sqlSession.selectList("Jumpo.SearchBonsaDeptList");
		return list;
	}

	@Override
	public int insertBonsaOrder(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Jumpo.InsertBonsaOrder",map);
		return aftcnt;
	}

	@Override
	public List<SearchOrderVo> searchOrderDeptList(Map<String, Object> map) {
		List<SearchOrderVo> list = sqlSession.selectList("Jumpo.searchOrderDeptList" , map);
		return list;
	}

	@Override
	public int insertInput(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Jumpo.InsertInput",map);
		return aftcnt;
	}

	@Override
	public int updateStock(Map<String, Object> map) {
		int aftcnt = sqlSession.update("Jumpo.UpdateInputStock",map);
		return aftcnt;
	}

	@Override
	public int updateStockMinus(Map<String, Object> map) {
		int aftcnt = sqlSession.update("Jumpo.UpdateStockMinus",map);
		return aftcnt;
	}

	@Override
	public int insertDisuse(Map<String, Object> map) {
		int aftcnt = sqlSession.insert("Jumpo.InsertDisuse",map);
		return aftcnt;
	}

	@Override
	public List<SearchDisuseVo> searchDisUseList(String search) {
		System.out.println("search" +search );
		List<SearchDisuseVo> list = sqlSession.selectList("Jumpo.SearchDisUseList",search);
		return list;
	}

	@Override
	public List<AssortmentVo> getDisuseSelect() {
		List<AssortmentVo> list = sqlSession.selectList("Jumpo.GetDisuseSelect" );
		return list;
	}
	
	@Override
	public List<DeptVo> searchAllDeptList(String search) {
		String d_name = search.toUpperCase().trim();
		List<DeptVo> list = sqlSession.selectList("Jumpo.SearchAllDeptList",d_name);
		return list;
	}
	// 결제시 상품정보조회
	@Override
	public ProductVo prodSearch(String p_seq) {
		ProductVo vo = sqlSession.selectOne("Jumpo.ProdSearch", p_seq);
		return vo;
	}

	// 마일리지 창에서 고객정보 조회
	@Override
	public CustomerVo custSearch(String c_phone) {
		CustomerVo vo = sqlSession.selectOne("Jumpo.CustSearch", c_phone);
		return vo;
	}
	@Override
	public List<SearchProductVo> FullProductList3(String text) {
		String d_name = text.toUpperCase().trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.FullProductList3",d_name);
		System.out.println("dddd : " + list);
		return list;
	}
	
	@Override
	public List<SearchProductVo> FullProductList1(String text) {
		String d_name = text.toUpperCase().trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.FullProductList1",d_name);
		System.out.println("dddd : " + list);
		return list;
	}
	
	
	@Override
	public List<SearchProductVo> FullProductList4(String text) {
		String a_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.FullProductList4",a_name);
		System.out.println("dddd : " + list);
		return list;
	}
	
	@Override
	public List<SearchProductVo> FullProductList5(String text) {
		String d_name = text.toUpperCase().trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.FullProductList5",d_name);
		System.out.println("dddd : " + list);
		return list;
	}
	
	@Override
	public List<SearchProductVo> FullProductList6(String text) {
		String a_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.FullProductList6",a_name);
		System.out.println("dddd : " + list);
		return list;
	}

	@Override
	public List<SearchProductVo> FullProductList2(String text) {
		String a_name = text.trim();
		List<SearchProductVo> list = sqlSession.selectList("Jumpo.FullProductList2",a_name);
		return list;
	}
	@Override
	public List<JumpoVo> searchJumpoList(String search) {
		String j_id = search.toUpperCase().trim();
		List<JumpoVo> list = sqlSession.selectList("Jumpo.SearchJumpoList",j_id);
		return list;
	}

	@Override
	public List<JumpoVo> getSearchSaleJumpo() {
		List<JumpoVo> list = sqlSession.selectList("Jumpo.SearchSale");
		return list;
	}

	@Override
	public List<SearchProductVo> searchSalesList(Map<String, Object> map) {
	    List<SearchProductVo> list = null;
	    String j_name = (String) map.get("j_name"); // Retrieve the value from the map

	    if (j_name != "" && !j_name.isEmpty()) {
	        list = sqlSession.selectList("Jumpo.SearchSalesList", map);
	    } else {
	        list = sqlSession.selectList("Jumpo.SearchSalesList1", map);
	    }

	    return list;
	}

}
