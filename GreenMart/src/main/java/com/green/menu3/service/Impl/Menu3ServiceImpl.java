package com.green.menu3.service.Impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.menu3.dao.Menu3Dao;
import com.green.menu3.service.Menu3Service;
import com.green.menu3.vo.FilesVo;
import com.green.menu3.vo.Menu3PagingVo;
import com.green.menu3.vo.PdsVo;

@Service("menu3Service")
public class Menu3ServiceImpl implements Menu3Service {

	@Autowired
	private Menu3Dao menu3Dao;

	// paging 처리를 위해 getPdsList() 수정
	@Override
	public List<Menu3PagingVo> getMenu3PagingList(HashMap<String, Object> map) {

		// 필요한 자료를 조회( 10개 row 만 )
		List<Menu3PagingVo> pdsPagingList = menu3Dao.getMenu3PagingList( map );

		int pagetotalcount = 5;	// paging.jsp 페이지 번호 출력 갯수
		// 1 2 3 4 5 6 7 8 9 10   :  10
		// 1 2 3 4 5              :  5

		// System.out.println("map123  : "+ map);

		int nowpage        = Integer.parseInt( String.valueOf( map.get("nowpage") ));	// 현재 페이지
		int pagecount      = Integer.parseInt( String.valueOf( map.get("pagecount") )); // 한페이지에 보여줄 자료수

		// menu_id 에 해당되는 전체 자료수 : pdsDao.getPdsPagingList(map) 가 돌려준 map 에 저장되어 있음
		int totalcount     = Integer.parseInt( String.valueOf( map.get("totalcount") ));		// menu_id 에 해당되는 전체 자료수
		int pagegrpnum     = 0;
		String menu_id     = String.valueOf( map.get("menu_id") );

		//  
		BoardPaging bp = new BoardPaging(
				menu_id, nowpage, pagecount, totalcount, pagetotalcount );

		Menu3PagingVo vo = bp.getPdsPagingInfo();

		map.put("pdsPagingVo", vo );

		return pdsPagingList;
	}

	@Override
	public PdsVo getPds(HashMap<String, Object> map) {
		PdsVo  pdsVo = menu3Dao.getPds( map );
		return pdsVo;
	}

	@Override
	public List<FilesVo> getFileList(HashMap<String, Object> map) {

		List<FilesVo> fileList = menu3Dao.getFileList( map );
		return fileList;
	}

	// 게시판이름 가져오기
	@Override
	public String getM_name(String m_id) {
		String m_name = menu3Dao.getM_name( m_id );
		return m_name;
	}

	@Override
	public void setWrite(HashMap<String, Object> map, 
			HttpServletRequest request) {

		// 1. request 처리 - 넘어온 파일 d://upload// 에 저장
		PdsFile.save( map, request );	// 별도 class 생성

		// 2. 넘어온 정보 db 저장 (Board, Files)
		menu3Dao.setWrite( map );

	}

	@Override
	public void setUpdate(
			HashMap<String, Object> map, 
			HttpServletRequest request) {

		PdsFile.save( map, request );	// 별도 class 생성

		menu3Dao.setUpdate( map );

	}

	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {

		// d:\\upload\\ sfilename 에 해당되는 파일을 삭제

		String  filepath  = "D:\\upload\\";
		String  sfilename = (String) map.get("sfile");

		File file = new File( filepath + sfilename );
		if( file.exists() )
			file.delete();

		// Files table 에서 f_seq 자료를 삭제
		menu3Dao.deleteUploadFile( map );

	}


}
