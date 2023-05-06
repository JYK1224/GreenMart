package com.green.menu3.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.green.menu3.vo.FilesVo;
import com.green.menu3.vo.Menu3PagingVo;
import com.green.menu3.vo.PdsVo;

public interface Menu3Service {

	List<Menu3PagingVo> getMenu3PagingList(HashMap<String, Object> map);

	PdsVo getPds(HashMap<String, Object> map);

	List<FilesVo> getFileList(HashMap<String, Object> map);

	String getM_name(String m_id);

	void setWrite(HashMap<String, Object> map, HttpServletRequest request);

	void setUpdate(HashMap<String, Object> map, HttpServletRequest request);

	void deleteUploadFile(HashMap<String, Object> map);

}
