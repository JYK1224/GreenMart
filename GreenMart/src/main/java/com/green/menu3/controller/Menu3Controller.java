package com.green.menu3.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.green.mart.vo.EmployeeVo;
import com.green.menu3.service.Menu3Service;
import com.green.menu3.vo.FilesVo;
import com.green.menu3.vo.Menu3PagingVo;
import com.green.menu3.vo.PdsVo;

@Controller
@RequestMapping("/Menu3")	
public class Menu3Controller {

	@Autowired
	private Menu3Service menu3Service;

	// 게시글 목록
	@RequestMapping("/Pds")
	public ModelAndView notice( @RequestParam HashMap<String, Object> map) {

		//-------------------------------------------
		// 페이징 정보 준비
		int         nowpage   = Integer.parseInt( (String) map.get("nowpage") ); 
		int         pagecount = 5;		// 한페이지 당 출력할 row 수

		// sql 사용할 변수 : 조회할 레코드 번호
		int         startnum  = ( nowpage - 1) * pagecount + 1;
		int         endnum    = nowpage * pagecount;

		map.put("nowpage", nowpage);
		map.put("pagecount", pagecount);
		map.put("startnum", startnum);		// 예를들어 한페이지당 5줄씩 찍을거니까 1, 6, 11, 16, ... 
		map.put("endnum", endnum);			// 예를들어 한페이지당 5줄씩 찍을거니까 5, 10, 15, 20, ... 
		// sql 에서 SELECT ~ BETWEEN startnum AND endnum 으로 출력할때 사용할 예정
		//--------------------------------------------

		// 게시판 이름을 가져온다
		String m_id   = (String) map.get("m_id");
		String m_name = menu3Service.getM_name( m_id );
		map.put("m_name", m_name);
		map.put("m_id", m_id);

		// 게시판 글 목록
		List<Menu3PagingVo> list = menu3Service.getMenu3PagingList( map );

		Menu3PagingVo pdsPagingVo = (Menu3PagingVo) map.get("pdsPagingVo");

		ModelAndView mv = new ModelAndView();
		mv.setViewName("community/communityList");
		mv.addObject("map", map);
		mv.addObject("list", list);
		mv.addObject("pdsPagingVo", pdsPagingVo);

		return mv;
	}

	// 사원 리스트 테이블
		@RequestMapping("/empTable")
		public ModelAndView empListTable (@RequestParam HashMap<String, Object> map) {
			
			int         nowpage   = Integer.parseInt( (String) map.get("nowpage") ); 
			int         pagecount = 10;		// 한페이지 당 출력할 row 수
			int         startnum  = ( nowpage - 1) * pagecount + 1;
			int         endnum    = nowpage * pagecount;
			
			map.put("nowpage", nowpage);
			map.put("pagecount", pagecount);
			map.put("startnum", startnum);		// 예를들어 한페이지당 5줄씩 찍을거니까 1, 6, 11, 16, ... 
			map.put("endnum", endnum);	
			
			String m_id   = (String) map.get("m_id");
			String m_name = menu3Service.getM_name( m_id );
			map.put("m_name", m_name);
			map.put("m_id", m_id);
			
			List<EmployeeVo> empList = menu3Service.getEmpList(map); 	
			ModelAndView mv = new ModelAndView();
			mv.setViewName("community/communityemp");
			mv.addObject("map", map);
			mv.addObject("empList", empList);
			
			return mv;
			
		}
	
	
	// 게시글 보기
	@RequestMapping("/View")
	public ModelAndView view(
			@RequestParam HashMap< String, Object > map	
			) {

		// 조회수 증가 (readcount++) -> dao 로 이동

		// 보여줄 게시글 내용
		PdsVo pdsVo = menu3Service.getPds(map);	// idx
		// 게시글의 내용중 <textarea> 안의 엔터키는 -> \n
		// 화면에 출력<td><div> 줄바꿈 <br>
		String cont = pdsVo.getCont();
		if ( cont == null ) 
			cont = "";
		cont = cont.replace("\n", "<br>");	// cont 의 엔터(\n)를 <br> 로 바꿔야 함  
		pdsVo.setCont(cont);

		// 파일정보목록
		List<FilesVo> fileList = menu3Service.getFileList(map); // idx

		// 게시판 이름을 가져온다
		String m_id   = (String) map.get("m_id");
		String m_name = menu3Service.getM_name( m_id );
		map.put("m_name", m_name);
		map.put("m_id", m_id);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("community/communityView");		// pds/view.jsp
		mv.addObject("vo", pdsVo);
		mv.addObject("fileList", fileList);
		mv.addObject("map", map);
		return mv;

	}

	// 새글 작성
	@RequestMapping("/WriteForm")
	public ModelAndView writeForm(
			@RequestParam HashMap<String, Object> map
			) {

		int     idx   = 0;
		PdsVo   pdsVo = null;
		if( map.get("idx") != null ) {
			idx   = Integer.parseInt( String.valueOf( map.get("idx") ));
			pdsVo = menu3Service.getPds( map );

			if(pdsVo.getCont() != null) {
				String title = ">> " + pdsVo.getTitle();
				String cont  = ">> " + pdsVo.getCont().replace("\n", "\n >> ");
				cont += "\n===========================================\n";
				pdsVo.setTitle(title);
				pdsVo.setCont(cont);
			}

		}
		map.put("idx", idx);

		// System.out.println("idx=" + map.get("idx"));

		ModelAndView mv = new ModelAndView();
		mv.setViewName("community/communityWrite");			// /WEV-INF/views/  pds/write  .jsp
		mv.addObject("vo", pdsVo);				// 답글처리를 위해 기존글 조회
		mv.addObject("map", map);

		return mv;

	}

	@RequestMapping("/Write")
	public ModelAndView write(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request ) {

		String m_id = (String) map.get("m_id");
		int    nowpage = Integer.parseInt( String.valueOf( map.get("nowpage") ) );

		// 새글(답글)저장 -> Board table 저장
		// 파일 정보 저장 -> Files table 저장
		// 실제 파일 저장 -> d:\\upload  저장

		// 글쓰기 및 파일저장
		System.out.println("작성전 map" + map);
		menu3Service.setWrite(map, request);


		String fmt = "redirect:/Menu3/Pds?m_id=%s&nowpage=%d";
		String loc = String.format(fmt,  m_id, nowpage);

		ModelAndView mv = new ModelAndView();
		mv.addObject("map", map);
		mv.setViewName(loc);

		return mv;

	}
	
	@RequestMapping("/Delete")
	public ModelAndView delete(
		@RequestParam HashMap<String, Object> map	
			) {
		
		// 자료실 자료삭제
		// 1. Files idx 가진 파일정보 삭제 : child
		// 2. Board idx 번 글 삭제         : parent
		// 3. D:\\upload\\ 에 있는 파일 삭제
		
		menu3Service.setDelete(map);
		
		String fmt = "redirect:/Menu3/Pds?m_id=%s&nowpage=%s";
		String loc = String.format(fmt,  map.get("m_id"), map.get("nowpage"));
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName( loc );
		mv.addObject("map", map);
		return mv;
		
	}
	
	

	// 수정
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(
			@RequestParam HashMap<String, Object> map
			) {

		// 수정을 위해 조회한 자료		
		PdsVo pdsVo = menu3Service.getPds( map );

		// fileList
		List<FilesVo> fileList = menu3Service.getFileList( map );

		ModelAndView mv = new ModelAndView();
		mv.setViewName("community/communityUpdate");
		mv.addObject("vo", pdsVo);
		mv.addObject("fileList", fileList);
		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping("/Update")
	public ModelAndView update(
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request 
			) {

		menu3Service.setUpdate(map, request);

		// 수정된 내용들 다시 조회해서 출력
		int    idx     = Integer.parseInt( (String) map.get("idx") ); 
		String m_id = (String) map.get("m_id");
		String nowpage = (String) map.get("nowpage");
		String fmt     = "redirect:/Menu3/View?m_id=%s&idx=%d&nowpage=%s";
		String loc     = String.format(fmt, m_id, idx, nowpage);

		ModelAndView mv = new ModelAndView();
		mv.addObject(map);
		mv.setViewName(loc);

		return mv;
	}










	//-----------------------------------------------
	// 다운로드
	// 정규식
	// {sfile}     : .jpg 와 같이  . 포함된 문자가 들어오면 문자를 무시 ( . 을 인식하지 않는다)
	// {sfile:.+}  : .+ 는 . 이 한개 이상이라는 뜻 (반드시 . 을 포함해야 @PathVariable 이 인식한다)
	@RequestMapping(value  = "/download/{type}/{sfile:.+}",
			method = RequestMethod.GET ) 
	public void downloadFile( 
			@PathVariable("type")  String type,
			@PathVariable("sfile") String sfile,
			HttpServletResponse    response
			) throws IOException {

		String INTERNAL_FILE      = sfile;
		String EXTERNAL_FILE_PATH = "d:\\upload\\" + sfile;

		File file = null;
		if ( type.equalsIgnoreCase("internal") ) {
			ClassLoader classLoader = 
					Thread.currentThread().getContextClassLoader();
			file = new File( classLoader.getResource(INTERNAL_FILE).getPath() );
		} else {
			file = new File( EXTERNAL_FILE_PATH );
		}

		if( !file.exists() ) {
			String errorMessage = "죄송합니다. 파일이 없습니다";
			// System.out.println( errorMessage );
			OutputStream outputStream = response.getOutputStream();
			outputStream.write( errorMessage.getBytes(Charset.forName("UTF-8")) );
			outputStream.close();
			return;
		}

		// 실제 다운로드
		String mimeType = URLConnection.guessContentTypeFromName(file.getName());
		mimeType = "application/octet-stream";	// 무조건 다운로드

		// 파일명의 한글처리
		String fname = new String( 
				file.getName().getBytes("UTF-8"), "ISO-8859-1" );
		response.setContentType( mimeType );
		response.setHeader("Content-Disposition", 
				String.format("inline; filename=\"" + fname + "\""));

		response.setContentLength( (int) file.length() );

		InputStream inputStream = new BufferedInputStream(
				new FileInputStream( file ) );

		FileCopyUtils.copy( inputStream, response.getOutputStream() );

		inputStream.close();

	}

}
