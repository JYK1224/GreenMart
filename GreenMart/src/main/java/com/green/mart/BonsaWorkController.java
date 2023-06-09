package com.green.mart;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.BonsaService;
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
import com.green.mart.vo.work.SearchOutputListVo;
import com.green.mart.vo.work.SearchProductVo;


@Controller
@RequestMapping("/BWork")
public class BonsaWorkController {

	@Autowired
	private BonsaService bonsaService;
	
	// 거래처 조회
		@RequestMapping("/SearchAllDept")
		@ResponseBody
		public List<DeptVo> returnDeptListVO(String search) throws Exception {
		
			List<DeptVo> list = bonsaService.searchAllDeptList(search);
			return list;
		}

		// 거래처 등록
		@RequestMapping("/deptForm")
		public ModelAndView deftaddForm(DeptVo vo) {
		
			ModelAndView mv = new ModelAndView();
			mv.setViewName("bonsa/deptadd");
		
			return mv;
		}
		@RequestMapping("/deptAdd")
		public ModelAndView deftAdd(DeptVo vo) {
		
			bonsaService.insertDept(vo);
		
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Deptadd1");
		
			return mv;
		}
		// 거래처 상세보기
		@RequestMapping("/deptView")
		public ModelAndView deptView(String d_id) {
		
			DeptVo dVo = bonsaService.deptView(d_id);
		
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/bonsa/deptview");
			mv.addObject("vo", dVo);
		
			return mv;
		}
		// 거래처 삭제 
		@RequestMapping(value = "/deptDelete", method = RequestMethod.POST)
		public ResponseEntity<String> deptDel(@RequestParam("d_id") String d_id) {
			
			bonsaService.deptDel(d_id);
			
			return ResponseEntity.ok("삭제되었습니다.");
			
		}
		// 거래처 수정
		@RequestMapping(value = "/deptUpdate", method = RequestMethod.POST)
		public ResponseEntity<DeptVo> deptUp(@RequestParam("d_id") String d_id,
				@RequestParam("d_name") String d_name,
				@RequestParam("d_dam") String d_dam,
				@RequestParam("d_phone") String d_phone ){ 
		  
			DeptVo dVo = new DeptVo();
			
			dVo.setD_id(d_id);
			dVo.setD_name(d_name);
			dVo.setD_dam(d_dam);
			dVo.setD_phone(d_phone);
			
			bonsaService.deptUp(dVo);
			
			System.out.println("dvo:  : " + dVo);
			
		    return ResponseEntity.ok(dVo);
		}

	// 사원관리
		// 사원등록
		@RequestMapping("/userAddForm")
		public ModelAndView customeraddForm (EmployeeVo vo) {
			
			//EmployeeVo empVo = bonsaService.geteid(vo);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("bonsa/useradd");
			//mv.addObject("vo" , empVo);
			
			
			return mv;
		}
		@RequestMapping("/userAdd")
		public ModelAndView popadd(EmployeeVo vo) {
			
			bonsaService.insertEmployee(vo);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/BWork/userAddForm");
			
			return mv;
			
		}
		// 사원 상세보기
		@RequestMapping("/userView")
		public ModelAndView viewUser(String e_id) {
			
			EmployeeVo empVo = bonsaService.viewEmp(e_id);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/bonsa/userview");
			mv.addObject("vo", empVo);
			
			return mv;
		}
		// 사원삭제
		@RequestMapping("/empDelete")
		public ResponseEntity<String> empDel(@RequestParam("e_id") String e_id) {
			
			bonsaService.deleteEmp(e_id);
			
			return ResponseEntity.ok("삭제되었습니다.");
			
		}
		// 사원수정 
		@RequestMapping("/empUpdateForm")
		public ModelAndView updateForm (EmployeeVo vo) {
			
			EmployeeVo empVo = bonsaService.getEmp(vo.getE_id());
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/bonsa/userupdate");
			mv.addObject("vo", empVo);
			
			return mv;
		}
		// 사원수정
		@RequestMapping("/userUpdate")
		public ModelAndView empUpdate (EmployeeVo vo) {
			
			bonsaService.updateEmp(vo);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/BWork/userView?e_id=" + vo.getE_id());
			
			
			return mv;
		}	
		//상품매출조회 점포 리스트 조회
		@RequestMapping("/SearchSaleslistSelect")
		@ResponseBody
		public List<JumpoVo> returnSearchSaleslist() throws Exception {
			
			
			List<JumpoVo> list = bonsaService.getSearchSaleJumpo();
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
				List<SearchProductVo> list = bonsaService.searchSalesList(map);
				return list;
			}
		
	// 상품전체조회
	@RequestMapping("/Fullquery3")
	@ResponseBody
	public List<SearchProductVo> FullList3(String text) throws Exception {
		List<SearchProductVo> list = bonsaService.FullProductList3(text);
		return list;
}
	@RequestMapping("/Fullquery1")
	@ResponseBody
	public List<SearchProductVo> FullList1(String text) throws Exception {
		List<SearchProductVo> list = bonsaService.FullProductList1(text);
		return list;
}
	@RequestMapping("/Fullquery2")
	@ResponseBody
	public List<SearchProductVo> FullList2(String text) throws Exception {
		List<SearchProductVo> list = bonsaService.FullProductList2(text);
		System.out.println("aaa: " + list);
		return list;
}
	@RequestMapping("/Fullquery4")
	@ResponseBody
	public List<SearchProductVo> FullList4(String text) throws Exception {
		List<SearchProductVo> list = bonsaService.FullProductList4(text);
		return list;
}
	@RequestMapping("/Fullquery5")
	@ResponseBody
	public List<SearchProductVo> FullList5(String text) throws Exception {
		List<SearchProductVo> list = bonsaService.FullProductList5(text);
		return list;
}
	@RequestMapping("/Fullquery6")
	@ResponseBody
	public List<SearchProductVo> FullList6(String text) throws Exception {
		List<SearchProductVo> list = bonsaService.FullProductList6(text);
		System.out.println("aaa:" + text);
		return list;
}
	//주문업무

	@RequestMapping("/Order")
	@ResponseBody
	public int order(@RequestParam(value = "ordernum[]") String[] ordernum,
			@RequestParam(value = "orderdate[]") String[] orderdate,
			@RequestParam(value = "orderdname[]") String[] orderdname,
			@RequestParam(value = "orderpname[]") String[] orderpname,
			@RequestParam(value = "e_id") String e_id
			) {

		
		  System.out.println("ordernum[] :" + Arrays.toString(ordernum));
		  System.out.println("orderdate[] :" + Arrays.toString(orderdate));
		  System.out.println("orderdname[] :" + Arrays.toString(orderdname));
		  System.out.println("orderpname[] :" + Arrays.toString(orderpname));
		  System.out.println("e_id : " + e_id);

		int aftcnt = 0 ;
		
		int j = ordernum.length;
		
		System.out.println("ordernum 길이 : " + j);
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
					aftcnt = bonsaService.insertOrder(map);
					map.clear();
				}
			}
		}
				

		return aftcnt;
	}
	@RequestMapping("/SearchDept")
	@ResponseBody
	public List<SearchDeptVo> returnListVO(String search) throws Exception {

		List<SearchDeptVo> list = bonsaService.searchDeptList(search);
		return list;
	}
	
	//거래처로 주문일 조회
		@RequestMapping("/SearchOrder")
		@ResponseBody
		public List<SearchOrderVo> returnOrderListVO(String search, String orderdate) throws Exception {

			Map<String, Object> map = new HashMap<String, Object>();
			String d_name = search.toUpperCase();
			map.put("d_name", d_name);
			map.put("orderdate", orderdate);
			
			List<SearchOrderVo> list = bonsaService.searchOrderDeptList(map);
			return list;
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

						aftcnt = bonsaService.insertInput(map);
						aftcnt = bonsaService.updateStock(map);
						map.clear();
					}
				}
			}
			
			
			
			return aftcnt;
		}
		// 점포조회
		@RequestMapping("/SearchJumpo")
		@ResponseBody
		public List<JumpoVo> returnJumpoVO(String search) throws Exception {

			List<JumpoVo> list = bonsaService.searchJumpoList(search);
			return list;
		}
		//상품 상세조회 -------------------------------
		@RequestMapping("/Inquery1")
		@ResponseBody
		public List<SearchProductVo> ListVo(String text) throws Exception {

			List<SearchProductVo> list = bonsaService.searchProductList(text);
			return list;
		}
		@RequestMapping("/Inquery2")
		@ResponseBody
		public List<SearchProductVo> ListVo1(String text) throws Exception {
			
			List<SearchProductVo> list = bonsaService.searchProductList1(text);
			return list;
		}
		// 신규상품 등록	
		@RequestMapping(value= "/productAdd" , method= RequestMethod.POST)
		public ModelAndView productAdd (
				@RequestParam("d_id") String d_id,
				@RequestParam("a_id") String a_id,
				SearchProductVo pVo) {
			
			bonsaService.insertProduct(pVo);
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/Productadd1");
			
			return mv;
		}
		// 상품 수정 
		@RequestMapping("/productView")
		public ModelAndView productView (String p_seq ) {
			
			List<DeptVo> checkDeptlist = bonsaService.getDeptList();
			List<AssortmentVo> checkAstlist = bonsaService.getAstList();
			
			SearchProductVo pVo = bonsaService.productView(p_seq);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("/bonsa/productview");
			mv.addObject("vo", pVo);
			mv.addObject("checkDeptlist", checkDeptlist);
			mv.addObject("checkAstlist", checkAstlist);
			
			return mv;
		}
		@RequestMapping("/productUpdate" )
		public ResponseEntity<SearchProductVo> productUp(
				@RequestParam("p_id") String p_id, 
				@RequestParam("p_name") String p_name,
				@RequestParam("p_iprice") String p_iprice,
				@RequestParam("p_sprice") String p_sprice,
				@RequestParam("d_id") String d_id,
				@RequestParam("a_id") String a_id
				) {
			
			SearchProductVo pVo = new SearchProductVo();
			
			pVo.setP_id(p_id);
			pVo.setP_name(p_name);
			pVo.setP_iprice(Integer.parseInt(p_iprice));
			pVo.setP_sprice(Integer.parseInt(p_sprice));
			pVo.setD_id(d_id);
			pVo.setA_id(a_id);
			
			bonsaService.productUp(pVo);
			
			return ResponseEntity.ok(pVo) ;
		}
		@RequestMapping("productDelete")
		public ResponseEntity<String> productDel(
				@RequestParam("p_id") String p_id) {
			
			bonsaService.productDel(p_id);
			
			return ResponseEntity.ok("조회함") ;
		}

		
		//------------------------------------------------
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
			
			List<SearchOrderListVo> list = bonsaService.searchOrderList(map);
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
			
			List<SearchInputListVo> list = bonsaService.searchInputList(map);
			return list;
		}
		//폐기 checkbox 리스트 조회
		@RequestMapping("/SearchDisuseSelect")
		@ResponseBody
		public List<AssortmentVo> returnDisuseSelect() throws Exception {
			
			
			List<AssortmentVo> list = bonsaService.getDisuseSelect();
			return list;
		}
		//폐기 리스트 조회
		@RequestMapping("/SearchDisUse")
		@ResponseBody
		public List<SearchDisuseVo> returnSearchDisUseListVO(String search) throws Exception {

			List<SearchDisuseVo> list = bonsaService.searchDisUseList(search);
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

						aftcnt = bonsaService.insertDisuse(map);
						aftcnt = bonsaService.updateStockMinus(map);
						map.clear();
					}
				}
			}
			
			
			
			return aftcnt;
		}

		// 점포 주문내역 조회1
		@RequestMapping("/SearchJOrderlistSelect")
		@ResponseBody
		public List<JumpoVo> returnSearchJlist() throws Exception {
			
			
			List<JumpoVo> list = bonsaService.getSearchJOrderJumpo();
			return list;
		}
		// 점포 주문내역 조회2
	@RequestMapping("/SearchJOrderlist")
	@ResponseBody
		public List<SearchJOrderListVo> returnJlistVO(String search, String startdate, String enddate) throws Exception {

			Map<String, Object> map = new HashMap<String, Object>();
			String j_name = search;
		
				map.put("j_name", j_name);
				map.put("startdate", startdate);
				map.put("enddate", enddate);
				System.out.println("map =" + map);
				List<SearchJOrderListVo> list = bonsaService.searchJOrderList(map);
				return list;
			}
	// 폐기내역 조회1
	@RequestMapping("/SearchDislistSelect")
	@ResponseBody
	public List<JumpoVo> returnSearchDislist() throws Exception {
		
		
		List<JumpoVo> list = bonsaService.getSearchDisJumpo();
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
			List<SearchDisuseListVo> list = bonsaService.searchDisList(map);
			return list;
		}	

		//본사출고시 점포가 본사에 주문한 내역 조회
		@RequestMapping("/SearchBonsaOrder")
		@ResponseBody
		public List<SearchBonsaOrderVo> searchBonsaOrderList(String combobox, String order2) throws Exception {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("combobox", combobox);
			map.put("order2", order2);
			
			List<SearchBonsaOrderVo> list = bonsaService.searchBonsaOrderList(map);
			return list;
			
		}
		
		// 본사출고
		@RequestMapping("/OutPut")
		@ResponseBody
		public int outPut(@RequestParam(value = "outputNum[]") String[] outputNum,
				@RequestParam(value = "outputP_id[]") String[] outputP_id,
				@RequestParam(value = "outputE_id[]") String[] outputE_id,
				@RequestParam(value = "outputDate") String[] outputDate
				) {

			  System.out.println("outputNum[] :" + Arrays.toString(outputNum));
			  System.out.println("outputP_id[] :" + Arrays.toString(outputP_id));
			  System.out.println("outputE_id[] :" + Arrays.toString(outputE_id));
			  System.out.println("outputDate :" + Arrays.toString(outputDate));
			  
			  int aftcnt = 0 ;
			 
			int j = outputNum.length;
			Map<String, Object> map = new HashMap<String, Object>();
			
			for (int i = 0; i < j; i++) {
				if(outputNum[i].equals("NaN")) {
				}else {
					if(outputNum[i].equals("0")) {
					}else {
						map.put("out_num",  outputNum[i]);
						map.put("p_id", outputP_id[i]);
						map.put("e_id", outputE_id[i]);
						map.put("out_date", outputDate[0]);
						aftcnt = bonsaService.insertOutput(map);
						aftcnt = bonsaService.outputUpdateStock(map);
						map.clear();
					}
				}
			}
			return aftcnt;

		}
		// 출고내역 조회1
				@RequestMapping("/SearchOutListSelect")
				@ResponseBody
				public List<JumpoVo> returnSearchOutlist() throws Exception {
					List<JumpoVo> list = bonsaService.getSearchOutJumpo();
					return list;
				}
				// 출고내역 조회2
			@RequestMapping("/SearchOutList")
			@ResponseBody
				public List<SearchOutputListVo> returnOutlistVO(String search, String startdate, String enddate) throws Exception {

					Map<String, Object> map = new HashMap<String, Object>();
					String j_name = search;
				
						map.put("j_name", j_name);
						map.put("startdate", startdate);
						map.put("enddate", enddate);
						System.out.println("map =" + map);
						List<SearchOutputListVo> list = bonsaService.searchOutList(map);
						return list;
					}	
		
}
