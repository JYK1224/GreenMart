package com.green.mart.vo;

public class OrderingVo {
	private String o_id;
	private String o_date;
	private int o_num;
	private String e_id;
	private int p_seq;
	private String d_id;
	
	public OrderingVo() {
	}
	public OrderingVo(String o_id, String o_date, int o_num, String e_id, int p_seq, String d_id) {
		super();
		this.o_id = o_id;
		this.o_date = o_date;
		this.o_num = o_num;
		this.e_id = e_id;
		this.p_seq = p_seq;
		this.d_id = d_id;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public String getO_date() {
		return o_date;
	}

	public void setO_date(String o_date) {
		this.o_date = o_date;
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

	public int getP_seq() {
		return p_seq;
	}

	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}

	public String getD_id() {
		return d_id;
	}

	public void setD_id(String d_id) {
		this.d_id = d_id;
	}

	@Override
	public String toString() {
		return "OrderingVo [o_id=" + o_id + ", o_date=" + o_date + ", o_num=" + o_num + ", e_id=" + e_id + ", p_seq="
				+ p_seq + ", d_id=" + d_id + "]";
	}
	
	
}
