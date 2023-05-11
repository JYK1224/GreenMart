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
import com.green.mart.vo.DeptVo;
import com.green.mart.vo.EmployeeVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchDeptVo;
import com.green.mart.vo.work.SearchInputListVo;
import com.green.mart.vo.work.SearchOrderListVo;
import com.green.mart.vo.work.SearchOrderVo;
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
		public void delete(@RequestParam("e_id") String e_id) {
			
			bonsaService.deleteEmp(e_id);
			
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
		
}
