package com.green.menu3.vo;

public class Menu3PagingVo {

	// Board
	private int    idx;
	private String title;
	private String cont;
	private String regdate;
	private String e_id;
	private int    readcount;
	
	private int    filescount;
	
	private int    bnum;
	private int    lvl;
	private int    step;
	private int    nref;
	private int    del;
	private int    pnum;

	// Menus
	private String m_id;
	private String m_name;
	private int    m_seq;
	
	// Files
	private int    f_seq;
	private String f_name;
	private String f_ext;
	private String f_sname;
	
	// paging 처리를 위한 추가 정보
	// sql 문을 위한 변수
	private int    nowpage;			// 현재 페이지
	private int    pagecount;		// 현재 페이지에 보여줄 row 수
	private int    totalcount;		// 전체 자료(row)수
	
	// paging.jsp 가 쓸 변수
	private int    totalpagecount;	// 화면에 보여줄 페이지 수
	private int    pagestartnum;	// 페이지 시작 번호
	private int    pageendnum;		// 페이지 끝 번호
	private int    pagegrpnum;		// 페이지 그룹 번호
	
	// Contructor
	public Menu3PagingVo() {}
	public Menu3PagingVo(int idx, String title, String cont, String regdate, String e_id, int readcount, int filescount,
			int bnum, int lvl, int step, int nref, int del, int pnum, String m_id, String m_name, int m_seq, int f_seq,
			String f_name, String f_ext, String f_sname, int nowpage, int pagecount, int totalcount, int totalpagecount,
			int pagestartnum, int pageendnum, int pagegrpnum) {
		this.idx = idx;
		this.title = title;
		this.cont = cont;
		this.regdate = regdate;
		this.e_id = e_id;
		this.readcount = readcount;
		this.filescount = filescount;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.del = del;
		this.pnum = pnum;
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_seq = m_seq;
		this.f_seq = f_seq;
		this.f_name = f_name;
		this.f_ext = f_ext;
		this.f_sname = f_sname;
		this.nowpage = nowpage;
		this.pagecount = pagecount;
		this.totalcount = totalcount;
		this.totalpagecount = totalpagecount;
		this.pagestartnum = pagestartnum;
		this.pageendnum = pageendnum;
		this.pagegrpnum = pagegrpnum;
	}
	
	// Getter, Setter
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getFilescount() {
		return filescount;
	}
	public void setFilescount(int filescount) {
		this.filescount = filescount;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getLvl() {
		return lvl;
	}
	public void setLvl(int lvl) {
		this.lvl = lvl;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getNref() {
		return nref;
	}
	public void setNref(int nref) {
		this.nref = nref;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_seq() {
		return m_seq;
	}
	public void setM_seq(int m_seq) {
		this.m_seq = m_seq;
	}
	public int getF_seq() {
		return f_seq;
	}
	public void setF_seq(int f_seq) {
		this.f_seq = f_seq;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_ext() {
		return f_ext;
	}
	public void setF_ext(String f_ext) {
		this.f_ext = f_ext;
	}
	public String getF_sname() {
		return f_sname;
	}
	public void setF_sname(String f_sname) {
		this.f_sname = f_sname;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getTotalpagecount() {
		return totalpagecount;
	}
	public void setTotalpagecount(int totalpagecount) {
		this.totalpagecount = totalpagecount;
	}
	public int getPagestartnum() {
		return pagestartnum;
	}
	public void setPagestartnum(int pagestartnum) {
		this.pagestartnum = pagestartnum;
	}
	public int getPageendnum() {
		return pageendnum;
	}
	public void setPageendnum(int pageendnum) {
		this.pageendnum = pageendnum;
	}
	public int getPagegrpnum() {
		return pagegrpnum;
	}
	public void setPagegrpnum(int pagegrpnum) {
		this.pagegrpnum = pagegrpnum;
	}
	
	// toString
	@Override
	public String toString() {
		return "Menu3PagingVo [idx=" + idx + ", title=" + title + ", cont=" + cont + ", regdate=" + regdate + ", e_id="
				+ e_id + ", readcount=" + readcount + ", filescount=" + filescount + ", bnum=" + bnum + ", lvl=" + lvl
				+ ", step=" + step + ", nref=" + nref + ", del=" + del + ", pnum=" + pnum + ", m_id=" + m_id
				+ ", m_name=" + m_name + ", m_seq=" + m_seq + ", f_seq=" + f_seq + ", f_name=" + f_name + ", f_ext="
				+ f_ext + ", f_sname=" + f_sname + ", nowpage=" + nowpage + ", pagecount=" + pagecount + ", totalcount="
				+ totalcount + ", totalpagecount=" + totalpagecount + ", pagestartnum=" + pagestartnum + ", pageendnum="
				+ pageendnum + ", pagegrpnum=" + pagegrpnum + "]";
	}
	
	
}










