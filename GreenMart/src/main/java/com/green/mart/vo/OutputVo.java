package com.green.mart.vo;

public class OutputVo {
	
	private String out_id;
	private String out_date;
	private int out_num;
	private String e_id;
	private int p_seq;
	
	public OutputVo() {
	}
	public OutputVo(String out_id, String out_date, int out_num, String e_id, int p_seq) {
		super();
		this.out_id = out_id;
		this.out_date = out_date;
		this.out_num = out_num;
		this.e_id = e_id;
		this.p_seq = p_seq;
	}
	
	public String getOut_id() {
		return out_id;
	}
	public void setOut_id(String out_id) {
		this.out_id = out_id;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public int getOut_num() {
		return out_num;
	}
	public void setOut_num(int out_num) {
		this.out_num = out_num;
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
		return "OutputVo [out_id=" + out_id + ", out_date=" + out_date + ", out_num=" + out_num + ", e_id=" + e_id
				+ ", p_seq=" + p_seq + "]";
	}
	
}
