package com.green.mart.vo;

public class SaleVo {
	
	private String s_id;
	private String s_date;
	private int s_num;
	private String c_id;
	private String e_id;
	private int p_seq;
	
	public SaleVo() {
	}
	public SaleVo(String s_id, String s_date, int s_num, String c_id, String e_id, int p_seq) {
		super();
		this.s_id = s_id;
		this.s_date = s_date;
		this.s_num = s_num;
		this.c_id = c_id;
		this.e_id = e_id;
		this.p_seq = p_seq;
	}
	
	public String getS_id() {
		return s_id;
	}
	public void setS_id(String s_id) {
		this.s_id = s_id;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public int getS_num() {
		return s_num;
	}
	public void setS_num(int s_num) {
		this.s_num = s_num;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	
	@Override
	public String toString() {
		return "SaleVo [s_id=" + s_id + ", s_date=" + s_date + ", s_num=" + s_num + ", c_id=" + c_id + ", e_id=" + e_id
				+ ", p_seq=" + p_seq + "]";
	}
	
}
