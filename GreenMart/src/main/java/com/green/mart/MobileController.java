package com.green.mart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.JumpoService;
import com.green.mart.service.MobileService;
import com.green.mart.vo.AssortmentVo;
import com.green.mart.vo.CustomerVo;
import com.green.mart.vo.JumpoVo;
import com.green.mart.vo.work.SearchDisuseVo;
import com.green.mart.vo.work.SearchMobileProductVo;

@Controller
@RequestMapping("/M")
public class MobileController {
	
	@Autowired
	private JumpoService jumpoService;
	
	@Autowired
	private MobileService mobileService;
	
	@RequestMapping("/Login_check")
	public ModelAndView login_check(@RequestParam HashMap<String, String> map){
		System.out.println(map);
		ModelAndView mv = new ModelAndView();
		
		CustomerVo vo = new CustomerVo();
		vo = mobileService.getCustomer(map);
		
		if(vo !=null) {
			mv.addObject("vo",vo);
			mv.setViewName("mobile/loginhome");
		}else {
		mv.addObject("message", "error");
		mv.setViewName("mobile/mhome");
		}
		return mv;
		
	}
	
	@RequestMapping("/Pay")
	public ModelAndView pay(@RequestParam HashMap<String, String> map
			) {
		
		System.out.println(map);
		System.out.println(map.get("p_seqList"));
		
		String c_name  = map.get("c_name");
		String c_phone = map.get("c_phone");
		
		
		int finalPrice = Integer.parseInt(map.get("finalPrice"));
		int earnMiles  = Integer.parseInt(map.get("earnMiles"));
		int milePay    = Integer.parseInt(map.get("milePay"));
		
		List<String> p_seqList = null;
		List<String> suList = null;
		
		// p_seq List
		Object p_seqListobj = map.get("p_seqList");
		if (p_seqListobj instanceof String) {
		    String p_seqListStr = String.valueOf( p_seqListobj);
		    
		    if (p_seqListStr.startsWith("[") && p_seqListStr.endsWith("]")) {
		    	p_seqListStr = p_seqListStr.substring(1, p_seqListStr.length() - 1);
		    }
		    
		    String[] itemList = p_seqListStr.split(",");
		    List<String> itemListNoQuotes = new ArrayList<>();
		    for (String item : itemList) {
		        String itemNoQuotes = item.replace("\"", "");
		        itemListNoQuotes.add(itemNoQuotes);
		    }
		    p_seqList = itemListNoQuotes;
		    
		    
		}
		
		System.out.println(p_seqList);
		System.out.println(p_seqList.get(1));
		
		// suList
				Object su_Listobj = map.get("su_List");
				if (su_Listobj instanceof String) {
				    String su_ListStr = String.valueOf( su_Listobj);
				    
				    if (su_ListStr.startsWith("[") && su_ListStr.endsWith("]")) {
				    	su_ListStr = su_ListStr.substring(1, su_ListStr.length() - 1);
				    }
				    
				    suList = Arrays.asList(su_ListStr.split(","));
				    
				}
				
		System.out.println(suList);
		System.out.println(suList.get(1));
		
		int merchant_uid = jumpoService.getSaleId();
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("c_name", c_name);
		mv.addObject("c_phone", c_phone);
		mv.addObject("finalPrice", finalPrice);
		mv.addObject("earnMiles", earnMiles);
		mv.addObject("milePay", milePay);
		mv.addObject("p_seqList", p_seqList);
		mv.addObject("suList", suList);						
		mv.addObject("s_id", merchant_uid);						
		mv.setViewName("mobile/pay");
		return mv;
		
	}
	
	@RequestMapping("/PayCard")
	public ModelAndView paycard(@RequestParam HashMap<String, String> map
			) {
		
		System.out.println(map);
		System.out.println(map.get("p_seqList"));
		
		String c_name  = map.get("c_name");
		String c_phone = map.get("c_phone");
		
		c_phone = c_phone.replaceAll("\"", "");
		
		System.out.println("시발" +c_phone);
		
		int finalPrice = Integer.parseInt(map.get("finalPrice"));
		int earnMiles  = Integer.parseInt(map.get("earnMiles"));
		int milePay    = Integer.parseInt(map.get("milePay"));
		int cash       = Integer.parseInt(map.get("cash"));
		
		List<String> p_seqList = null;
		List<String> suList = null;
		
		// p_seq List
		Object p_seqListobj = map.get("p_seqList");
		if (p_seqListobj instanceof String) {
			String p_seqListStr = String.valueOf( p_seqListobj);
			
			if (p_seqListStr.startsWith("[") && p_seqListStr.endsWith("]")) {
				p_seqListStr = p_seqListStr.substring(1, p_seqListStr.length() - 1);
			}
			
			String[] itemList = p_seqListStr.split(",");
			List<String> itemListNoQuotes = new ArrayList<>();
			for (String item : itemList) {
				String itemNoQuotes = item.replace("\"", "");
				itemListNoQuotes.add(itemNoQuotes);
			}
			p_seqList = itemListNoQuotes;
			
			
		}
		
		System.out.println(p_seqList);
		System.out.println(p_seqList.get(1));
		
		// suList
		Object su_Listobj = map.get("su_List");
		if (su_Listobj instanceof String) {
			String su_ListStr = String.valueOf( su_Listobj);
			
			if (su_ListStr.startsWith("[") && su_ListStr.endsWith("]")) {
				su_ListStr = su_ListStr.substring(1, su_ListStr.length() - 1);
			}
			
			suList = Arrays.asList(su_ListStr.split(","));
			
		}
		
		System.out.println(suList);
		System.out.println(suList.get(1));
		
		int merchant_uid = jumpoService.getSaleId();
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("c_name", c_name);
		mv.addObject("c_phone", c_phone);
		mv.addObject("finalPrice", finalPrice);
		mv.addObject("earnMiles", earnMiles);
		mv.addObject("milePay", milePay);
		mv.addObject("p_seqList", p_seqList);
		mv.addObject("suList", suList);						
		mv.addObject("s_id", merchant_uid);						
		mv.addObject("cash", cash);						
		mv.setViewName("mobile/paycard");
		return mv;
		
	}
	
	@RequestMapping("/PayMent")
	public ModelAndView paywork(@RequestParam HashMap<String, Object> map) {
		
		System.out.println(" map "+ map);
		
		List<String> p_seqList = null;
		List<String> suList = null;
		
		// p_seq List
				Object p_seqListobj = map.get("p_seqList");
				if (p_seqListobj instanceof String) {
				    String p_seqListStr = String.valueOf( p_seqListobj);
				    
				    if (p_seqListStr.startsWith("[") && p_seqListStr.endsWith("]")) {
				    	p_seqListStr = p_seqListStr.substring(1, p_seqListStr.length() - 1);
				    }
				    
				    p_seqList = Arrays.asList(p_seqListStr.split(","));
				   				   				    
				}
		// su_List
				Object suListobj = map.get("suList");
				if (suListobj instanceof String) {
					String suListStr = String.valueOf( suListobj);			
					if (suListStr.startsWith("[") && suListStr.endsWith("]")) {
						suListStr = suListStr.substring(1, suListStr.length() - 1);
					}

					suList = Arrays.asList(suListStr.split(","));
				}
				
		int j = p_seqList.size();
		
		// 새로운 map 생성하여 SALE 테이블에 반영
				Map<String, Object> map2 = new HashMap<String, Object>();
				for (int i = 0; i < j; i++) {
					map2.put("item", Integer.parseInt(p_seqList.get(i).trim())  );
					map2.put("su", Integer.parseInt(suList.get(i).trim()));
					map2.put("c_name",String.valueOf(map.get("c_name")));
					map2.put("e_id", String.valueOf( map.get("e_id") ));			
					jumpoService.insertSale(map2);
					map2.clear();		
				}
				
				// CUSTOMER 테이블에 반영
				jumpoService.updateMileage(map);
				
				
				// 새로운 map 생성하여 STOCK 테이블에 반영
				Map<String, Object> map3 = new HashMap<String, Object>();
				
				for (int i = 0; i < j; i++) {
					map3.put("item", Integer.parseInt(p_seqList.get(i).trim())  );
					map3.put("su", Integer.parseInt(suList.get(i).trim()));
					jumpoService.saleUpdateStock(map3);
					map3.clear();
				}
				
				CustomerVo vo = new CustomerVo();
				vo = mobileService.getCustomer2(map);
				
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.setViewName("/mobile/paysuccess");
		
		return mv;
	}
	
	@RequestMapping("/Product")
	public ModelAndView product() {		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mobile/product");				
		return mv;
	}
	
	//점포 이름 리스트 조회
	@RequestMapping("/SearchJumpoSelect")
	@ResponseBody
	public List<JumpoVo> returnDisuseSelect() throws Exception {		
		
		List<JumpoVo> list = mobileService.getDisuseSelect();
		return list;
	}
	
	//상품 이름 조회
	@RequestMapping(value="/SearchProduct")
	@ResponseBody 
	public SearchMobileProductVo returnVO(String search, String p_name) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("p_name", p_name);
		
		System.out.println(map);
		
		SearchMobileProductVo vo = mobileService.searchProductList(map);
		return vo;
	}

}
