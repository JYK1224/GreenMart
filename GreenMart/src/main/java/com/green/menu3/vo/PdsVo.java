package com.green.menu3.vo;

public class PdsVo {
	// Board 자료
	private int    idx;
	private String title;
	private String cont;
	private String regdate;
	private String e_id;
	private int    readcount;
	
	// Board 답글 여부
	private int    bnum;
	private int    lvl;
	private int    step;
	private int    nref;
	
	// 삭제처리
	private int    del;
	private int    pnum;
	
	// 파일 자료수
	private int    filescount; 
	
	// 메뉴정보
	private String m_id;
	private String m_name;
	private int    m_seq;
	
	// Constructor
	public PdsVo() {}
	public PdsVo(int idx, String title, String cont, String e_id, String regdate, int readcount, int bnum, int lvl,
			int step, int nref, int del, int pnum, int filescount, String m_id, String m_name, int m_seq) {
		this.idx = idx;
		this.title = title;
		this.cont = cont;
		this.e_id = e_id;
		this.regdate = regdate;
		this.readcount = readcount;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.del = del;
		this.pnum = pnum;
		this.filescount = filescount;
		this.m_id = m_id;
		this.m_name = m_name;
		this.m_seq = m_seq;
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
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
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
	public int getFilescount() {
		return filescount;
	}
	public void setFilescount(int filescount) {
		this.filescount = filescount;
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
	
	// toString
	@Override
	public String toString() {
		return "PdsVo [idx=" + idx + ", title=" + title + ", cont=" + cont + ", e_id=" + e_id + ", regdate=" + regdate
				+ ", readcount=" + readcount + ", bnum=" + bnum + ", lvl=" + lvl + ", step=" + step + ", nref=" + nref
				+ ", del=" + del + ", pnum=" + pnum + ", filescount=" + filescount + ", m_id=" + m_id + ", m_name="
				+ m_name + ", m_seq=" + m_seq + "]";
	}
	
}
