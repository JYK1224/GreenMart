package com.green.mart.vo.work;

import lombok.Data;


public class SearchDeptVo {
	private String d_name;
	private int p_seq;
	private String p_name;
	private int p_iprice;
	private int st_num;
	private String p_id;
	public SearchDeptVo() {
	}
	public SearchDeptVo(String d_name, int p_seq, String p_name, int p_iprice, int st_num, String p_id) {
		super();
		this.d_name = d_name;
		this.p_seq = p_seq;
		this.p_name = p_name;
		this.p_iprice = p_iprice;
		this.st_num = st_num;
		this.p_id = p_id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_iprice() {
		return p_iprice;
	}
	public void setP_iprice(int p_iprice) {
		this.p_iprice = p_iprice;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	@Override
	public String toString() {
		return "SearchDeptVo [d_name=" + d_name + ", p_seq=" + p_seq + ", p_name=" + p_name + ", p_iprice=" + p_iprice
				+ ", st_num=" + st_num + ", p_id=" + p_id + "]";
	}
}
