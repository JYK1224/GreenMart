package com.green.mart.vo;

public class StockVo {
	
	private String st_id;
	private int st_num;
	private String d_id;
	private int p_seq;
	
	public StockVo() {
	}
	public StockVo(String st_id, int st_num, String d_id, int p_seq) {
		super();
		this.st_id = st_id;
		this.st_num = st_num;
		this.d_id = d_id;
		this.p_seq = p_seq;
	}
	
	public String getSt_id() {
		return st_id;
	}
	public void setSt_id(String st_id) {
		this.st_id = st_id;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	public String getD_id() {
		return d_id;
	}
	public void setD_id(String d_id) {
		this.d_id = d_id;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	
	@Override
	public String toString() {
		return "StockVo [st_id=" + st_id + ", st_num=" + st_num + ", d_id=" + d_id + ", p_seq=" + p_seq + "]";
	}
	
}
