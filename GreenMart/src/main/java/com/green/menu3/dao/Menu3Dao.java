package com.green.menu3.dao;

import java.util.HashMap;
import java.util.List;

import com.green.mart.vo.EmployeeVo;
import com.green.menu3.vo.FilesVo;
import com.green.menu3.vo.Menu3PagingVo;
import com.green.menu3.vo.PdsVo;

public interface Menu3Dao {

	List<Menu3PagingVo> getMenu3PagingList(HashMap<String, Object> map);

	PdsVo getPds(HashMap<String, Object> map);

	List<FilesVo> getFileList(HashMap<String, Object> map);

	String getM_name(String m_id);

	void setWrite(HashMap<String, Object> map);

	void setUpdate(HashMap<String, Object> map);

	void deleteUploadFile(HashMap<String, Object> map);

	void setDelete(HashMap<String, Object> map);
	// 공지사항 띄우기 : 홈
	List<Menu3PagingVo> homeNoticeList(HashMap<String, Object> map);
	// 업무연락 띄우기 : 홈
	List<Menu3PagingVo> homeContactList(HashMap<String, Object> map2);
	//사원리스트
	List<EmployeeVo> getEmpList(HashMap<String, Object> map);

}
