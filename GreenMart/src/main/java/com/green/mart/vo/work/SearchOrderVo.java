package com.green.mart.vo.work;

public class SearchOrderVo {
	
	private String d_name;
	private String o_date;
	private String in_date;
	private String p_id;
	private String p_name;
	private int st_num;
	private int o_num;
	private String e_id;
	private String out_date;
	private int out_num;
	public SearchOrderVo() {
	}
	public SearchOrderVo(String d_name, String o_date, String in_date, String p_id, String p_name, int st_num, int o_num,
			String e_id, String out_date, int out_num) {
		this.d_name = d_name;
		this.o_date = o_date;
		this.in_date = in_date;
		this.p_id = p_id;
		this.p_name = p_name;
		this.st_num = st_num;
		this.o_num = o_num;
		this.e_id = e_id;
		this.out_date = out_date;
		this.out_num = out_num;
	}
	public String getD_name() {
		return d_name;
	}
	public void setD_name(String d_name) {
		this.d_name = d_name;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
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
	public int getSt_num() {
		return st_num;
	}
	public void setSt_num(int st_num) {
		this.st_num = st_num;
	}
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
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
	@Override
	public String toString() {
		return "SearchOrderVo [d_name=" + d_name + ", o_date=" + o_date + ", in_date=" + in_date + ", p_id=" + p_id
				+ ", p_name=" + p_name + ", st_num=" + st_num + ", o_num=" + o_num + ", e_id=" + e_id + ", out_date="
				+ out_date + ", out_num=" + out_num + "]";
	}

}
