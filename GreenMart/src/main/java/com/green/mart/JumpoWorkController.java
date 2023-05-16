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
import com.green.mart.vo.work.SearchDisuseListVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchInputListVo;
import com.green.mart.vo.work.SearchOrderListVo;
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
			@RequestParam(value = "orderpname[]") String[] orderpname,
			@RequestParam(value = "e_id") String e_id) {

		
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
					map.put("e_id",  e_id);
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
			@RequestParam(value = "orderpname[]") String[] orderpname,
			@RequestParam(value = "e_id") String e_id) {
		
		
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
					map.put("e_id",  e_id);
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
			@RequestParam(value = "inputpname[]") String[] inputpname,
			@RequestParam(value = "e_id") String e_id) {
		
		
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
					map.put("e_id",  e_id);
					aftcnt = jumpoService.insertInput(map);
					aftcnt = jumpoService.updateStock(map);
					map.clear();
				}
			}
		}
		
		
		
		return aftcnt;
	}
	
	// 점포 입고시 거래처로 주문일 조회
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
	
	// 점포 입고시 본사 출고리스트 검색(본사상품검색)
	@RequestMapping("/BonsaSearchOrder")
	@ResponseBody
	public List<SearchOrderVo> returnBonsaList(String search, String outdate) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String d_name = search.toUpperCase();
		map.put("d_name", d_name);
		map.put("outdate", outdate);
		
		List<SearchOrderVo> list = jumpoService.returnBonsaList(map);
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
			@RequestParam(value = "disusepname[]") String[] disusepname,
			@RequestParam(value = "e_id") String e_id) {
		
		
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
					map.put("e_id",  e_id);
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
	public ProductVo prodSearch(String p_id, String e_id ) {

		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("p_id", p_id);
		map.put("e_id", e_id);
		
		ProductVo vo = jumpoService.prodSearch( map );
		
		return vo;
		
	}
	
	// 마일리지 창에서 고객정보 조회
	@RequestMapping("/CustSearch")
	@ResponseBody
	public CustomerVo custSearch( String c_phone ) {
		
		CustomerVo vo = jumpoService.custSearch( c_phone );
		
		return vo;
		
	}
	
	@RequestMapping("/PayWork")
	public ModelAndView paywork(@RequestParam HashMap<String, Object> map) {
		
		// 가져온 map 찍어보자
		System.out.println("PayWork 직전 map "+ map);
		
		List<String> itemList = null;
		List<String> suList = null;
		
		// 상품코드 List
		Object itemListobj = map.get("itemList");
		if (itemListobj instanceof String) {
		    String itemListStr = String.valueOf( itemListobj);
		    
		    if (itemListStr.startsWith("[") && itemListStr.endsWith("]")) {
		        itemListStr = itemListStr.substring(1, itemListStr.length() - 1);
		    }
		    
		     itemList = Arrays.asList(itemListStr.split(", "));
		    
		}
		
//		System.out.println("itemList.get(0)" + itemList.get(0));
//		System.out.println("itemList.get(1)" + itemList.get(1));
//		System.out.println("itemList.get(2)" + itemList.get(2));
		
		// 판매수량 List
		Object suListobj = map.get("suList");
		if (suListobj instanceof String) {
			String suListStr = String.valueOf( suListobj);			
			if (suListStr.startsWith("[") && suListStr.endsWith("]")) {
				suListStr = suListStr.substring(1, suListStr.length() - 1);
			}

			suList = Arrays.asList(suListStr.split(", "));
		}
		
		int j = itemList.size();
		
		// 새로운 map 생성하여 SALE 테이블에 반영
		Map<String, Object> map2 = new HashMap<String, Object>();
		for (int i = 0; i < j; i++) {
			map2.put("item", String.valueOf(itemList.get(i))  );
			map2.put("su", Integer.parseInt(suList.get(i)));
			map2.put("c_name",String.valueOf( map.get("c_name")));
			map2.put("e_id", String.valueOf( map.get("e_id") ));			
			jumpoService.insertSale(map2);
			map2.clear();		
		}
		
		// CUSTOMER 테이블에 반영
		jumpoService.updateMileage(map);
		
		
		// 새로운 map 생성하여 STOCK 테이블에 반영
		Map<String, Object> map3 = new HashMap<String, Object>();
		
		for (int i = 0; i < j; i++) {
			map3.put("item", String.valueOf(itemList.get(i))  );
			map3.put("su", Integer.parseInt(suList.get(i)));
			map3.put("e_id", String.valueOf( map.get("e_id") ));			
			jumpoService.saleUpdateStock(map3);
			map3.clear();
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jumpo/paysuccess");
		return mv;
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

			
			startdate = startdate + " 00:00:00";
			enddate = enddate + " 23:59:59";
			System.out.println("startdate=" +startdate);
			System.out.println("enddate=" +enddate);
			Map<String, Object> map = new HashMap<String, Object>();
			String j_name = search;
		
				map.put("j_name", j_name);
				map.put("startdate", startdate);
				map.put("enddate", enddate);
				System.out.println("map =" + map);
				List<SearchProductVo> list = jumpoService.searchSalesList(map);
				return list;
			}
	// 주문내역 조회
				@RequestMapping("/SearchOrderList")
				@ResponseBody
				public List<SearchOrderListVo> returnOListVO(String search, String startdate, String enddate) throws Exception {

					Map<String, Object> map = new HashMap<String, Object>();
					String d_name = search.toUpperCase();
					map.put("d_name", d_name);
					map.put("startdate", startdate);
					map.put("enddate", enddate);
					System.out.println("map = "+ map);
					
					List<SearchOrderListVo> list = jumpoService.searchOrderList(map);
					System.out.println(list);
					return list;
				}
				// 입고내역 조회
				@RequestMapping("/SearchInputList")
				@ResponseBody
				public List<SearchInputListVo> returnIListVO(String search, String startdate, String enddate) throws Exception {

					Map<String, Object> map = new HashMap<String, Object>();
					String d_name = search.toUpperCase();
					map.put("d_name", d_name);
					map.put("startdate", startdate);
					map.put("enddate", enddate);
					
					List<SearchInputListVo> list = jumpoService.searchInputList(map);
					return list;
				}
				
				// 폐기내역 조회1
				@RequestMapping("/SearchDislistSelect")
				@ResponseBody
				public List<JumpoVo> returnSearchDislist() throws Exception {
					
					
					List<JumpoVo> list = jumpoService.getSearchDisJumpo();
					return list;
				}
				// 폐기내역 조회2
			@RequestMapping("/SearchDislist")
			@ResponseBody
				public List<SearchDisuseListVo> returnDislistVO(String search, String startdate, String enddate) throws Exception {

					Map<String, Object> map = new HashMap<String, Object>();
					String j_name = search;
				
						map.put("j_name", j_name);
						map.put("startdate", startdate);
						map.put("enddate", enddate);
						System.out.println("map =" + map);
						List<SearchDisuseListVo> list = jumpoService.searchDisList(map);
						return list;
					}	
		
}
