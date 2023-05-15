package com.green.mart.vo.work;

public class SearchInputListVo {
	private String in_date;
	private String startdate;
	private String enddate;
	private String d_name;
	private String p_id;
	private String p_name;
	private int p_iprice;
	private int st_num;
	private int in_num; 
	private String e_id;
	
	public SearchInputListVo() {}

	public SearchInputListVo(String in_date, String startdate, String enddate, String d_name, String p_id,
			String p_name, int p_iprice, int st_num, int in_num, String e_id) {
		this.in_date = in_date;
		this.startdate = startdate;
		this.enddate = enddate;
		this.d_name = d_name;
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_iprice = p_iprice;
		this.st_num = st_num;
		this.in_num = in_num;
		this.e_id = e_id;
	}

	public String getIn_date() {
		return in_date;
	}

	public void setIn_date(String in_date) {
		this.in_date = in_date;
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

	public int getSt_num() {
		return st_num;
	}

	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}

	public int getIn_num() {
		return in_num;
	}

	public void setIn_num(int in_num) {
		this.in_num = in_num;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	@Override
	public String toString() {
		return "SearchInputListVo [in_date=" + in_date + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", d_name=" + d_name + ", p_id=" + p_id + ", p_name=" + p_name + ", p_iprice=" + p_iprice
				+ ", st_num=" + st_num + ", in_num=" + in_num + ", e_id=" + e_id + "]";
	}

	
	
}
