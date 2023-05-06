package com.green.menu3.vo;

public class BoardVo {
	// Fields
	private int    idx;
	private String m_id;
	private String title;
	private String cont;
	private String e_id;
	private String regdate;
	private int    readcount;
	private int    bnum;
	private int    lvl;
	private int    step;
	private int    nref;
	private int    del;
	private int    pnum;
	// Generator
	public BoardVo() {}
	public BoardVo(int idx, String m_id, String title, String cont, String e_id, String regdate, int readcount,
			int bnum, int lvl, int step, int nref, int del, int pnum) {
		super();
		this.idx = idx;
		this.m_id = m_id;
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
	}
	
	// Getter, Setter
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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

	// toString
	@Override
	public String toString() {
		return "BoardVo [idx=" + idx + ", m_id=" + m_id + ", title=" + title + ", cont=" + cont + ", e_id=" + e_id
				+ ", regdate=" + regdate + ", readcount=" + readcount + ", bnum=" + bnum + ", lvl=" + lvl + ", step="
				+ step + ", nref=" + nref + ", del=" + del + ", pnum=" + pnum + "]";
	}
	
}
