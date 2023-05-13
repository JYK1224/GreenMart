package com.green.mart.vo.work;

public class SearchBonsaOrderVo {
	// Field
	private String p_seq;
	private String j_name;
	private String b_date;
	private String e_id;
	private String p_id;
	private String p_name;
	private int    p_iprice;
	private int    b_num;
	// Constructor
	public SearchBonsaOrderVo() {}
	public SearchBonsaOrderVo(String p_seq, String j_name, String b_date, String e_id, String p_id, String p_name,
			int p_iprice, int b_num) {
		this.p_seq = p_seq;
		this.j_name = j_name;
		this.b_date = b_date;
		this.e_id = e_id;
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_iprice = p_iprice;
		this.b_num = b_num;
	}
	// Getter, Setter
	public String getP_seq() {
		return p_seq;
	}
	public void setP_seq(String p_seq) {
		this.p_seq = p_seq;
	}
	public String getJ_name() {
		return j_name;
	}
	public void setJ_name(String j_name) {
		this.j_name = j_name;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
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
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	// toString
	@Override
	public String toString() {
		return "SearchBonsaOrderVo [p_seq=" + p_seq + ", j_name=" + j_name + ", b_date=" + b_date + ", e_id=" + e_id
				+ ", p_id=" + p_id + ", p_name=" + p_name + ", p_iprice=" + p_iprice + ", b_num=" + b_num + "]";
	}
	
}
