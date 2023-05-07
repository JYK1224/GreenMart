package com.green.menu3.dao;

import java.util.HashMap;
import java.util.List;

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


}
