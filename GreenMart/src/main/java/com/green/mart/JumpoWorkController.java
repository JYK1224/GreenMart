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
import com.green.mart.vo.work.SearchDeptVo;

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
}
