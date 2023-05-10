package com.green.mart;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.JumpoService;
import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.ProductVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchOrderVo;
import com.green.mart.vo.work.SearchProductVo;

@Controller
@RequestMapping("/JWork")
public class JumpoWorkController {

	@Autowired
	private JumpoService jumpoService;

	@RequestMapping("/SearchDept")
	@ResponseBody
	public List<SearchDeptVo> returnListVO(String search) throws Exception {

		List<SearchDeptVo> list = jumpoService.searchDeptList(search);
		return list;
	}
	
	@RequestMapping("/SearchBonsaDept")
	@ResponseBody
	public List<SearchDeptVo> returnBonsaListVO(String search) throws Exception {
		
		List<SearchDeptVo> list = jumpoService.searchBonsaDeptList(search);
		return list;
	}

	@RequestMapping("/Order")
	@ResponseBody
	public int order(@RequestParam(value = "ordernum[]") String[] ordernum,
			@RequestParam(value = "orderdate[]") String[] orderdate,
			@RequestParam(value = "orderdname[]") String[] orderdname,
			@RequestParam(value = "orderpname[]") String[] orderpname) {

		
//		  System.out.println("ordernum[] :" + Arrays.toString(ordernum));
//		  System.out.println("orderdate[] :" + Arrays.toString(orderdate));
//		  System.out.println("orderdname[] :" + Arrays.toString(orderdname));
//		  System.out.println("orderpname[] :" + Arrays.toString(orderpname));
		 

		int aftcnt = 0 ;
		
		int j = ordernum.length;
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < j; i++) {
			if(ordernum[i].equals("NaN")) {	
			}else {
				if(ordernum[i].equals("0")) {
				}else {
					map.put("o_num",  ordernum[i]);
					map.put("o_date", orderdate[i]);
					map.put("d_name", orderdname[i]);
					map.put("p_name",  orderpname[i]);					
					aftcnt = jumpoService.insertOrder(map);
					map.clear();
				}
			}
		}
				
				

		return aftcnt;
	}
	@RequestMapping("/BonsaOrder")
	@ResponseBody
	public int bonsaorder(@RequestParam(value = "ordernum[]") String[] ordernum,
			@RequestParam(value = "orderdate[]") String[] orderdate,
			@RequestParam(value = "orderpname[]") String[] orderpname) {
		
		
		  System.out.println("ordernum[] :" + Arrays.toString(ordernum));
		  System.out.println("orderdate[] :" + Arrays.toString(orderdate));
		  System.out.println("orderpname[] :" + Arrays.toString(orderpname));
		
		
		int aftcnt = 0 ;
		
		int j = ordernum.length;
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < j; i++) {
			if(ordernum[i].equals("NaN")) {	
			}else {
				if(ordernum[i].equals("0")) {
				}else {
					map.put("o_num",  ordernum[i]);
					map.put("o_date", orderdate[i]);
					map.put("p_name",  orderpname[i]);					
					aftcnt = jumpoService.insertBonsaOrder(map);
					map.clear();
				}
			}
		}
		
		
		
		return aftcnt;
	}
	
	//거래처 입고
	@RequestMapping("/Input")
	@ResponseBody
	public int input(@RequestParam(value = "inputnum[]") String[] inputnum,
			@RequestParam(value = "inputdate[]") String[] inputdate,
			@RequestParam(value = "inputpname[]") String[] inputpname) {
		
		
		  System.out.println("ordernum[] :" + Arrays.toString(inputnum));
		  System.out.println("orderdate[] :" + Arrays.toString(inputdate));
		  System.out.println("orderpname[] :" + Arrays.toString(inputpname));
		
		
		int aftcnt = 0 ;
		
		int j = inputnum.length;
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < j; i++) {
			if(inputnum[i].equals("NaN")) {	
			}else {
				if(inputnum[i].equals("0")) {
				}else {
					map.put("in_num",  Integer.parseInt(inputnum[i]));
					map.put("in_date", inputdate[i]);
					map.put("p_name",  inputpname[i]);					
					aftcnt = jumpoService.insertInput(map);
					aftcnt = jumpoService.updateStock(map);
					map.clear();
				}
			}
		}
		
		
		
		return aftcnt;
	}
	
	//거래처로 주문일 조회
	@RequestMapping("/SearchOrder")
	@ResponseBody
	public List<SearchOrderVo> returnOrderListVO(String search, String orderdate) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		String d_name = search.toUpperCase();
		map.put("d_name", d_name);
		map.put("orderdate", orderdate);
		
		List<SearchOrderVo> list = jumpoService.searchOrderDeptList(map);
		return list;
	}
	
	//폐기 checkbox 리스트 조회
	@RequestMapping("/SearchDisuseSelect")
	@ResponseBody
	public List<AssortmentVo> returnDisuseSelect() throws Exception {
		
		
		List<AssortmentVo> list = jumpoService.getDisuseSelect();
		return list;
	}
	
	//폐기 리스트 조회
	@RequestMapping("/SearchDisUse")
	@ResponseBody
	public List<SearchDisuseVo> returnSearchDisUseListVO(String search) throws Exception {

		List<SearchDisuseVo> list = jumpoService.searchDisUseList(search);
		return list;
	}
	
	//거래처 폐기
	@RequestMapping("/Disuse")
	@ResponseBody
	public int disuse(@RequestParam(value = "disusenum[]") String[] disusenum,
			@RequestParam(value = "disusepname[]") String[] disusepname) {
		
		
		  System.out.println("disusenum[] :" + Arrays.toString(disusenum));
		  System.out.println("disusepname[] :" + Arrays.toString(disusepname));
		
		
		int aftcnt = 0 ;
		
		int j = disusenum.length;
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (int i = 0; i < j; i++) {
			if(disusenum[i].equals("NaN")) {	
			}else {
				if(disusenum[i].equals("0")) {
				}else {
					map.put("dis_num",  Integer.parseInt(disusenum[i]));
					map.put("p_name", disusepname[i]);
					aftcnt = jumpoService.insertDisuse(map);
					aftcnt = jumpoService.updateStockMinus(map);
					map.clear();
				}
			}
		}
		
		
		
		return aftcnt;
	}

	
	
	//상품 상세조회 -------------------------------
	@RequestMapping("/Inquery1")
	@ResponseBody
	public List<SearchProductVo> ListVo(String text) throws Exception {

		List<SearchProductVo> list = jumpoService.searchProductList(text);
		return list;
	}
	@RequestMapping("/Inquery2")
	@ResponseBody
	public List<SearchProductVo> ListVo1(String text) throws Exception {
		
		List<SearchProductVo> list = jumpoService.searchProductList1(text);
		return list;
	}
	//------------------------------------------------
	
	// 거래처 조회
		@RequestMapping("/SearchAllDept")
		@ResponseBody
		public List<DeptVo> returnDeptListVO(String search) throws Exception {

			List<DeptVo> list = jumpoService.searchAllDeptList(search);
			return list;
		}
		
	// 결제시 상품정보조회
	@RequestMapping("/ProdSearch")
	@ResponseBody
	public ProductVo prodSearch( String p_seq ) {
		
		ProductVo vo = jumpoService.prodSearch( p_seq );
		
		return vo;
		
	}
	
	// 마일리지 창에서 고객정보 조회
	@RequestMapping("/CustSearch")
	@ResponseBody
	public CustomerVo custSearch( String c_phone ) {
		
		CustomerVo vo = jumpoService.custSearch( c_phone );
		
		return vo;
		
	}	
	// 상품전체조회
	@RequestMapping("/Fullquery3")
	@ResponseBody
	public List<SearchProductVo> FullList3(String text) throws Exception {
		List<SearchProductVo> list = jumpoService.FullProductList3(text);
		return list;
}
	@RequestMapping("/Fullquery1")
	@ResponseBody
	public List<SearchProductVo> FullList1(String text) throws Exception {
		List<SearchProductVo> list = jumpoService.FullProductList1(text);
		return list;
}
	@RequestMapping("/Fullquery2")
	@ResponseBody
	public List<SearchProductVo> FullList2(String text) throws Exception {
		List<SearchProductVo> list = jumpoService.FullProductList2(text);
		System.out.println("aaa: " + list);
		return list;
}
	@RequestMapping("/Fullquery4")
	@ResponseBody
	public List<SearchProductVo> FullList4(String text) throws Exception {
		List<SearchProductVo> list = jumpoService.FullProductList4(text);
		return list;
}
	@RequestMapping("/Fullquery5")
	@ResponseBody
	public List<SearchProductVo> FullList5(String text) throws Exception {
		List<SearchProductVo> list = jumpoService.FullProductList5(text);
		return list;
}
	@RequestMapping("/Fullquery6")
	@ResponseBody
	public List<SearchProductVo> FullList6(String text) throws Exception {
		List<SearchProductVo> list = jumpoService.FullProductList6(text);
		System.out.println("aaa:" + text);
		return list;
}
	// 점포조회
	@RequestMapping("/SearchJumpo")
	@ResponseBody
	public List<JumpoVo> returnJumpoVO(String search) throws Exception {

		List<JumpoVo> list = jumpoService.searchJumpoList(search);
		return list;
	}
	//상품매출조회 점포 리스트 조회
		@RequestMapping("/SearchSaleslistSelect")
		@ResponseBody
		public List<JumpoVo> returnSearchSaleslist() throws Exception {
			
			
			List<JumpoVo> list = jumpoService.getSearchSaleJumpo();
			return list;
		}
		// 날짜지정해서 점포선택후 판매내역조회
	@RequestMapping("/SearchSaleslist")
	@ResponseBody
		public List<SearchProductVo> returnSalesListVO(String search, String startdate, String enddate) throws Exception {

			Map<String, Object> map = new HashMap<String, Object>();
			String j_name = search;
		
				map.put("j_name", j_name);
				map.put("startdate", startdate);
				map.put("enddate", enddate);
				System.out.println("map =" + map);
				List<SearchProductVo> list = jumpoService.searchSalesList(map);
				return list;
			}
		
}
