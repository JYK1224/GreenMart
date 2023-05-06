package com.green.menu3.service.Impl;

import com.green.menu3.vo.Menu3PagingVo;

public class BoardPaging {

	// Fields
	private String m_id;
	private int    nowpage;
	private int    pagecount;
	private int    totalcount;
	private int    pagetotalcount;
	
	// 생성자
	public BoardPaging(
			String m_id, int nowpage, int pagecount, int totalcount, int pagetotalcount) {
		this.m_id           = m_id;
		this.nowpage        = nowpage;
		this.pagecount      = pagecount;
		this.totalcount     = totalcount;
		this.pagetotalcount = pagetotalcount;
	}

	// method
	public Menu3PagingVo getPdsPagingInfo() {
		
		Menu3PagingVo vo = new Menu3PagingVo();
		
		int    totalpagecount = (int) Math.ceil( (double)totalcount / (double)pagecount ); 

		int    pagestartnum   = (nowpage-1) / pagetotalcount * pagetotalcount + 1;
		int    pageendnum     = ((nowpage-1) / pagetotalcount + 1) * pagetotalcount;
		  if( pageendnum > totalpagecount )
			  pageendnum = totalpagecount;
		
		vo.setM_id(m_id);
		vo.setPagestartnum(pagestartnum);
		vo.setPageendnum(pageendnum);
		vo.setTotalpagecount(totalpagecount);
		
		return vo;
	}
	
	// toString

}
