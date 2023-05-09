package com.green.mart.vo.work;

public class SearchDisuseVo {
	private String d_name;
	private String p_id;
	private String p_name;
	private int p_iprice;
	private int st_num;
	private String e_id;
	public SearchDisuseVo() {
	}
	public SearchDisuseVo(String d_name, String p_id, String p_name, int p_iprice, int st_num, String e_id) {
		this.d_name = d_name;
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_iprice = p_iprice;
		this.st_num = st_num;
		this.e_id = e_id;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
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
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	@Override
	public String toString() {
		return "DisuseVo [d_name=" + d_name + ", p_id=" + p_id + ", p_name=" + p_name + ", p_iprice=" + p_iprice
				+ ", st_num=" + st_num + ", e_id=" + e_id + "]";
	}
}
