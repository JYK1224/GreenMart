package com.green.mart.vo.work;

public class SearchOutputListVo {
	private String b_date;
	private String startdate;
	private String enddate;
	private String d_name; 
	private String p_id;   
	private String p_name; 
	private int p_iprice;
	private int p_sprice;
	private int st_num; 
	private int b_num;  
	private String e_id;
	
	public SearchOutputListVo() {}
	public SearchOutputListVo(String b_date, String startdate, String enddate, String d_name, String p_id,
			String p_name, int p_iprice, int p_sprice, int st_num, int b_num, String e_id) {
		this.b_date = b_date;
		this.startdate = startdate;
		this.enddate = enddate;
		this.d_name = d_name;
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_iprice = p_iprice;
		this.p_sprice = p_sprice;
		this.st_num = st_num;
		this.b_num = b_num;
		this.e_id = e_id;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
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
	public int getP_sprice() {
		return p_sprice;
	}
	public void setP_sprice(int p_sprice) {
		this.p_sprice = p_sprice;
	}
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	@Override
	public String toString() {
		return "SearchOutputListVo [b_date=" + b_date + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", d_name=" + d_name + ", p_id=" + p_id + ", p_name=" + p_name + ", p_iprice=" + p_iprice
				+ ", p_sprice=" + p_sprice + ", st_num=" + st_num + ", b_num=" + b_num + ", e_id=" + e_id + "]";
	}
	
	
}
