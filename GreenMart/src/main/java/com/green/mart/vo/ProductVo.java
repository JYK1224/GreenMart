package com.green.mart.vo;

public class ProductVo {
	
	private int p_seq;
	private String p_name;
	private int p_iprice;
	private int p_sprice;
	private int p_del;
	private String d_id;
	private String a_id;
	private String j_id;
	private String s_id;
	private String s_num;
	
	public ProductVo() {
	}

	public ProductVo(int p_seq, String p_name, int p_iprice, int p_sprice, int p_del, String d_id, String a_id,
			String j_id, String s_id, String s_num) {
		super();
		this.p_seq = p_seq;
		this.p_name = p_name;
		this.p_iprice = p_iprice;
		this.p_sprice = p_sprice;
		this.p_del = p_del;
		this.d_id = d_id;
		this.a_id = a_id;
		this.j_id = j_id;
		this.s_id = s_id;
		this.s_num = s_num;
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

	public int getP_sprice() {
		return p_sprice;
	}

	public void setP_sprice(int p_sprice) {
		this.p_sprice = p_sprice;
	}

	public int getP_del() {
		return p_del;
	}

	public void setP_del(int p_del) {
		this.p_del = p_del;
	}

	public String getD_id() {
		return d_id;
	}

	public void setD_id(String d_id) {
		this.d_id = d_id;
	}

	public String getA_id() {
		return a_id;
	}

	public void setA_id(String a_id) {
		this.a_id = a_id;
	}

	public String getJ_id() {
		return j_id;
	}

	public void setJ_id(String j_id) {
		this.j_id = j_id;
	}

	public String getS_id() {
		return s_id;
	}

	public void setS_id(String s_id) {
		this.s_id = s_id;
	}

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

	@Override
	public String toString() {
		return "ProductVo [p_seq=" + p_seq + ", p_name=" + p_name + ", p_iprice=" + p_iprice + ", p_sprice=" + p_sprice
				+ ", p_del=" + p_del + ", d_id=" + d_id + ", a_id=" + a_id + ", j_id=" + j_id + ", s_id=" + s_id
				+ ", s_num=" + s_num + "]";
	}
}
