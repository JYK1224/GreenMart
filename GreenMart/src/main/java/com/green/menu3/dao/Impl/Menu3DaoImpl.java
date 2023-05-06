package com.green.menu3.dao.Impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.green.menu3.dao.Menu3Dao;
import com.green.menu3.vo.FilesVo;
import com.green.menu3.vo.Menu3PagingVo;
import com.green.menu3.vo.PdsVo;

@Repository("menu3Dao")
public class Menu3DaoImpl implements Menu3Dao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Menu3PagingVo> getMenu3PagingList(HashMap<String, Object> map) {
		// 전체 자료수 조회
		int               totalcount    = sqlSession.selectOne("Pds.GetTotalCount", map);
		map.put("totalcount", totalcount);

		// 메뉴 목록 조회 (paging)
		List<Menu3PagingVo> pdsPagingList = sqlSession.selectList("Pds.PdsPagingList", map);
		return pdsPagingList;
	}

	@Override
	public PdsVo getPds(HashMap<String, Object> map) {
		// 조회수 증가( Board table )
		sqlSession.update("Board.incrementReadCount", map);

		// 자료조회
		System.out.println("자료조회전 map : " + map);
		PdsVo  pdsVo = sqlSession.selectOne("Pds.PdsGet", map );
		return pdsVo;
	}

	@Override
	public List<FilesVo> getFileList(HashMap<String, Object> map) {

		List<FilesVo> fileList = sqlSession.selectList("Pds.FileList", map); 

		return fileList;
	}

	// 게시판이름 가져오기
	@Override
	public String getM_name(String m_id) {
		String m_name = sqlSession.selectOne("Menu.GetMenuName", m_id);
		return m_name;
	}

	// 게시글 작성
	@Override
	public void setWrite(HashMap<String, Object> map) {

		// db 정보 저장
		int bnum = Integer.parseInt( (String) map.get("bnum") );
		if( bnum == 0) {								// 새글일때
			sqlSession.insert("Pds.PdsInsert", map);	
		} else {										// 답글일때
			sqlSession.update("Pds.StepUpdate", map);	
			sqlSession.insert("Pds.PdsReply", map);
		}

		// Files 에 저장 
		List<FilesVo> fileList = (List<FilesVo>) map.get("fileList");
		if( fileList.size() != 0 )
			sqlSession.insert("Pds.FileInsert", map);

	}

	@Override
	public void setUpdate(HashMap<String, Object> map) {

		// 1. Board table 의 title, cont 를 수정
		sqlSession.update("Pds.PdsUpdate", map);

		// 2. 추가된 파일을 Files table 에 저장 
		List<FilesVo> fileList = (List<FilesVo>) map.get("fileList");
		if( fileList.size() > 0 )
			sqlSession.insert("Pds.FileInsert2", map);

	}

	@Override
	public void deleteUploadFile(HashMap<String, Object> map) {

		sqlSession.delete("Pds.DeleteUploadFile", map);
		
	}


}
