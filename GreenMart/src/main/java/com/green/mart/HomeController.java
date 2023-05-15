package com.green.mart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.service.FavoriteService;
import com.green.mart.vo.FavoriteVo;
import com.green.menu3.service.Menu3Service;
import com.green.menu3.vo.Menu3PagingVo;

@Controller
public class HomeController {
	
	@Autowired
	private Menu3Service menu3Service;
	
	@Autowired
	private FavoriteService favoriteService;
	
	@RequestMapping("/")
	public  ModelAndView  home() {
		
		// 홈화면 공지사항 띄우기 : map
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nowpage", 1); // 첫페이지를 띄울거다
		map.put("pagecount", 5); // 5줄 띄울거다 
		map.put("startnum", 1); // DB에서 1~5 줄 가져올거다
		map.put("endnum", 5); // DB에서 1~5 줄 가져올거다	
		map.put("m_id", "M01"); // M01 : 공지사항
		List<Menu3PagingVo> noticeList = menu3Service.homeNoticeList( map );
		
		// 홈화면 업무연락 띄우기 : map2
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("nowpage", 1); // 첫페이지를 띄울거다
		map2.put("pagecount", 5); // 5줄 띄울거다 
		map2.put("startnum2", 1); // DB에서 1~5 줄 가져올거다
		map2.put("endnum2", 5); // DB에서 1~5 줄 가져올거다	
		map2.put("m_id2", "M02"); // M02 : 업무연락
		List<Menu3PagingVo> contactList = menu3Service.homeContactList( map2 );
		
		// 즐겨찾기 메뉴 가져오기 : map3
		HashMap<String, Object> map3 = new HashMap<String, Object>();
		map3.put("e_id", "0001"); // 로그인아이디를 e_id 로 map에 담는다.
		List<FavoriteVo> favoriteList = favoriteService.getFavoriteList( map3 );
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		mv.addObject("map", map);
		mv.addObject("map2", map2);
		mv.addObject("noticeList", noticeList);
		mv.addObject("contactList", contactList);
		mv.addObject("favoriteList", favoriteList);
		
		return  mv;
	}
	// 헤더 메뉴
		//--------------------------------------
	@RequestMapping("/Jumpo")
	public  ModelAndView   jumpo(  ) {
		
		// 홈화면 공지사항 띄우기 : map
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nowpage", 1); // 첫페이지를 띄울거다
		map.put("pagecount", 5); // 5줄 띄울거다 
		map.put("startnum", 1); // DB에서 1~5 줄 가져올거다
		map.put("endnum", 5); // DB에서 1~5 줄 가져올거다	
		map.put("m_id", "M01"); // M01 : 공지사항
		List<Menu3PagingVo> noticeList = menu3Service.homeNoticeList( map );
		
		// 홈화면 업무연락 띄우기 : map2
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("nowpage", 1); // 첫페이지를 띄울거다
		map2.put("pagecount", 5); // 5줄 띄울거다 
		map2.put("startnum2", 1); // DB에서 1~5 줄 가져올거다
		map2.put("endnum2", 5); // DB에서 1~5 줄 가져올거다	
		map2.put("m_id2", "M02"); // M02 : 업무연락
		List<Menu3PagingVo> contactList = menu3Service.homeContactList( map2 );
		
		ModelAndView  mv  =  new ModelAndView(); 
		mv.addObject("map", map);
		mv.addObject("map2", map2);
		mv.addObject("noticeList", noticeList);
		mv.addObject("contactList", contactList);
		mv.setViewName("jumpo/jumpo");
		
		return  mv;
	}
	@RequestMapping("/Bonsa")
	public  ModelAndView   bonsa(  ) {
		
		// 홈화면 공지사항 띄우기 : map
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nowpage", 1); // 첫페이지를 띄울거다
		map.put("pagecount", 5); // 5줄 띄울거다 
		map.put("startnum", 1); // DB에서 1~5 줄 가져올거다
		map.put("endnum", 5); // DB에서 1~5 줄 가져올거다	
		map.put("m_id", "M01"); // M01 : 공지사항
		List<Menu3PagingVo> noticeList = menu3Service.homeNoticeList( map );
		
		// 홈화면 업무연락 띄우기 : map2
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		map2.put("nowpage", 1); // 첫페이지를 띄울거다
		map2.put("pagecount", 5); // 5줄 띄울거다 
		map2.put("startnum2", 1); // DB에서 1~5 줄 가져올거다
		map2.put("endnum2", 5); // DB에서 1~5 줄 가져올거다	
		map2.put("m_id2", "M02"); // M02 : 업무연락
		List<Menu3PagingVo> contactList = menu3Service.homeContactList( map2 );
		
		ModelAndView  mv  =  new ModelAndView(); 
		mv.addObject("map", map);
		mv.addObject("map2", map2);
		mv.addObject("noticeList", noticeList);
		mv.addObject("contactList", contactList);
		mv.setViewName("bonsa/bonsa"); 
		
		return  mv;
	}
		@RequestMapping("/Community")
		public  ModelAndView   community(  ) {
			ModelAndView  mv  =  new ModelAndView(); 
			mv.setViewName("community/community"); 
			return  mv;
		}
		@RequestMapping("/Customer")
		public  ModelAndView   customer(  ) {
			
			// 홈화면 공지사항 띄우기 : map
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("nowpage", 1); // 첫페이지를 띄울거다
			map.put("pagecount", 5); // 5줄 띄울거다 
			map.put("startnum", 1); // DB에서 1~5 줄 가져올거다
			map.put("endnum", 5); // DB에서 1~5 줄 가져올거다	
			map.put("m_id", "M01"); // M01 : 공지사항
			List<Menu3PagingVo> noticeList = menu3Service.homeNoticeList( map );
			
			// 홈화면 업무연락 띄우기 : map2
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("nowpage", 1); // 첫페이지를 띄울거다
			map2.put("pagecount", 5); // 5줄 띄울거다 
			map2.put("startnum2", 1); // DB에서 1~5 줄 가져올거다
			map2.put("endnum2", 5); // DB에서 1~5 줄 가져올거다	
			map2.put("m_id2", "M02"); // M02 : 업무연락
			List<Menu3PagingVo> contactList = menu3Service.homeContactList( map2 );
			
			ModelAndView  mv  =  new ModelAndView(); 
			mv.addObject("map", map);
			mv.addObject("map2", map2);
			mv.addObject("noticeList", noticeList);
			mv.addObject("contactList", contactList);
			mv.setViewName("customer/customer"); 
			
			return  mv;
		}
		//--------------------------------------
		@RequestMapping("/Mobile")
		public  ModelAndView   mobile( ) {
			ModelAndView  mv  =  new ModelAndView(); 
			mv.setViewName("mobile/mhome"); 
			return  mv;
		}
		
		@RequestMapping("/Favorites")
		public ModelAndView favorites() {
			ModelAndView  mv  =  new ModelAndView(); 
			mv.setViewName("favorites");
			return mv;
		}
		@RequestMapping("/SaveFavorites")
		@ResponseBody
		public int saveFavorites(@RequestParam(value="menus[]") String[] menus,
								@RequestParam(value = "e_id") String e_id) {
//			System.out.println("컨트롤러 메뉴들 : "+ Arrays.toString(menus));
//			System.out.println(e_id);
			
			int aftcnt = 0 ;
			
			Map<String, Object> map = new HashMap<String, Object>();
			int j = menus.length;
			
			aftcnt = favoriteService.deleteFavorite(e_id);	// e_id 의 기존 즐찾 모두삭제
			for (int i = 0; i < j; i++) {
				map.put("ft_id", menus[i]);
				map.put("e_id",  e_id);
				aftcnt += favoriteService.insertFavorite(map);	// 선택한 즐찾으로 추가
				map.clear();
			}
			return aftcnt;
			
		}
}
